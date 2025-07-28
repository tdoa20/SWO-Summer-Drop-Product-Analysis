/* Filter Orders export table. This also extracts individual customer names and info.
Only the transactions with existing billing names and emails are selected.
Format date and time to be datetime (all in UTC timezone) and make Email lowercase */
WITH Formatted AS (
    SELECT *, LOWER(Email) AS NormalizedEmail,
           SWITCHOFFSET(
		CAST(STUFF(Paid_at, 24, 0, ':') AS datetimeoffset(0)), 
		'+00:00'
		) AS PaymentDate
    FROM [SWO_Data_Warehouse].[dbo].[Data_Warehouse]
    WHERE Billing_Name IS NOT NULL AND Billing_Name != 'test test' AND Email IS NOT NULL
),
-- Rank by Billing Name and transaction order (most recent first)
Ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Billing_Name ORDER BY PaymentDate DESC) AS CxTransactionOrder
    FROM Formatted
),

/* Some people have done transactions with multiple names with the same email. 
This ranks transactions with the same email by the transaction date (last transaction by customer ranked 1) */
DistinctNames AS (
	SELECT NormalizedEmail, Billing_Name, Name,
		ROW_NUMBER() OVER (PARTITION BY NormalizedEmail ORDER BY TRY_CAST(REPLACE(Name, '#', '') AS INT) DESC) AS name_rank
		FROM Formatted
),

-- Selects the names from the most recent transaction with that email. 
 NamePivot AS (
    SELECT
        NormalizedEmail,
        MAX(CASE WHEN name_rank = 1 THEN Billing_Name END) AS Name
    FROM DistinctNames
    GROUP BY NormalizedEmail
),

/* Attach name to each record via NormalizedEmail. Due to previous code,
 multiple names with the same email now have the name with the most recent transaction.
 Still have names with multiple emails */
FormattedWithName AS (
	SELECT F.*, NP.Name AS CustomerName
	FROM Formatted F
	LEFT JOIN NamePivot NP ON F.NormalizedEmail = NP.NormalizedEmail
),

-- Identify multiple emails per customer and rank them by transaction date (1 most recent)
DistinctEmails AS (
    SELECT 
        CustomerName, 
        NormalizedEmail,
        MAX(F.Name) AS Name, -- use aggregation
        ROW_NUMBER() OVER (PARTITION BY CustomerName ORDER BY TRY_CAST(REPLACE(MAX(F.Name), '#', '') AS INT) DESC) AS email_rank
    FROM FormattedWithName F
    GROUP BY CustomerName, NormalizedEmail
),

/* Add Primary and secondary email. Primary email is the one for the most recent transaction. Secondary Email is the one for the 2nd most recent
Don't include 3rd email */
EmailPivot AS (
    SELECT
        CustomerName,
        MAX(CASE WHEN email_rank = 1 THEN NormalizedEmail END) AS PrimaryEmail,
        MAX(CASE WHEN email_rank = 2 THEN NormalizedEmail END) AS SecondaryEmail
    FROM DistinctEmails
    GROUP BY CustomerName
),

-- Identify multiple phone numbers per customer and rank them by transaction date (1 most recent)
DistinctPhoneNumbers AS (
    SELECT 
		CustomerName, 
		Billing_Phone,
		MAX(F.Name) AS Name,
        ROW_NUMBER() OVER (PARTITION BY CustomerName ORDER BY MAX(PaymentDate) DESC) AS phone_rank
    FROM FormattedWithName F
    WHERE Billing_Phone IS NOT NULL
    GROUP BY CustomerName, Billing_Phone
),

-- Do the same thing for numbers as emails
PhonePivot AS (
    SELECT
        CustomerName,
        MAX(CASE WHEN phone_rank = 1 THEN Billing_Phone END) AS PrimaryPhoneNumber,
        MAX(CASE WHEN phone_rank = 2 THEN Billing_Phone END) AS SecondaryPhoneNumber
    FROM DistinctPhoneNumbers
    GROUP BY CustomerName
),

-- Identify multiple addresses per customer and rank them by transaction date (1 most recent)
DistinctAddress AS (
    SELECT 
        CustomerName,
        Billing_Street,
        Billing_Address1,
        Billing_Address2,
        Billing_City,
		Billing_Province,
        Billing_Country,
        Billing_Zip,
        Shipping_Street,
        Shipping_Address1,
        Shipping_Address2,
        Shipping_City,
		Shipping_Province,
        Shipping_Country,
        Shipping_Zip,
        MAX(F.Name) AS Name, -- helps prevent duplicates
        ROW_NUMBER() OVER (
            PARTITION BY CustomerName 
            ORDER BY TRY_CAST(REPLACE(MAX(F.Name), '#', '') AS INT) DESC
        ) AS address_rank
    FROM FormattedWithName F
    GROUP BY CustomerName, Billing_Street, Billing_Address1, Billing_Address2, 
             Billing_City, Billing_Province, Billing_Country, Billing_Zip,
             Shipping_Street, Shipping_Address1, Shipping_Address2, 
             Shipping_City, Shipping_Province, Shipping_Country, Shipping_Zip
),

-- Filter out rows where both addresses are null, and pick billing if available, else shipping.
PreferredAddress AS (
    SELECT 
        CustomerName,
        address_rank,
        -- Preferred fields: use billing if available, else shipping
        COALESCE(Billing_Street, Shipping_Street) AS Street,
        CASE 
            WHEN Billing_Street IS NOT NULL THEN Billing_Address1 
            ELSE Shipping_Address1 
        END AS Address1,
        CASE 
            WHEN Billing_Street IS NOT NULL THEN Billing_Address2 
            ELSE Shipping_Address2 
        END AS Address2,
        CASE 
            WHEN Billing_Street IS NOT NULL THEN Billing_City 
            ELSE Shipping_City 
        END AS City,
		 CASE 
            WHEN Billing_Street IS NOT NULL THEN Billing_Province 
            ELSE Shipping_Province 
        END AS Province,
        CASE 
            WHEN Billing_Street IS NOT NULL THEN Billing_Country 
            ELSE Shipping_Country 
        END AS Country,
        CASE 
            WHEN Billing_Street IS NOT NULL THEN Billing_Zip 
            ELSE Shipping_Zip 
        END AS ZipCode
    FROM DistinctAddress
    WHERE Billing_Street IS NOT NULL OR Shipping_Street IS NOT NULL
),

-- Pick the first non-null address per customer based on address_rank.
FilteredAddress AS (
    SELECT *
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY CustomerName ORDER BY address_rank) AS addr_priority
        FROM PreferredAddress
    ) AS Ranked
    WHERE addr_priority = 1
),

-- Combine all tables with phone numbers, emails, and addresses together to create Customer Information Table
CustomerNoIndex AS (
    SELECT 
		FA.CustomerName AS Name,
		EP.PrimaryEmail,
		EP.SecondaryEmail,
		PP.PrimaryPhoneNumber,
		PP.SecondaryPhoneNumber,
		FA.Street,
		FA.Address1,
		FA.Address2,
		FA.City,
		FA.Province,
		FA.Country,
		FA.ZipCode
    FROM FilteredAddress FA
LEFT JOIN EmailPivot EP ON FA.CustomerName = EP.CustomerName
LEFT JOIN PhonePivot PP ON FA.CustomerName = PP.CustomerName
)

-- Create CustomerID and put all the info into Customer_Details table
SELECT ROW_NUMBER() OVER (ORDER BY Name) AS CustomerID, * 
INTO Customer_Details
FROM CustomerNoIndex;

