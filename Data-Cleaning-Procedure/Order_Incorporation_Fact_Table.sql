-- Create temporary table to identify ProductIDs of orders. Will use for Order Fact table later.
SELECT 
	TRIM('#' FROM Name) AS OrderID,
	Lineitem_name,
	Email,
	Lineitem_sku,
	Lineitem_quantity,
	Lineitem_price
INTO OrdersFactTest
FROM dbo.Data_Warehouse
ORDER BY OrderID;

-- ADD ProductID column
ALTER TABLE OrdersFactTest ADD ProductID int;


-- Add individual ProductIDs to the column based on Product_information table
-- Caps
UPDATE OrdersFactTest
SET ProductID = 27
WHERE Lineitem_name = 'Casquettes SWO - Bleu';

UPDATE OrdersFactTest
SET ProductID = 26
WHERE Lineitem_name = 'Casquettes SWO - Noir';

UPDATE OrdersFactTest
SET ProductID = 28
WHERE Lineitem_name = 'Casquettes SWO - Rouge';


-- Training shorts
-- White
UPDATE OrdersFactTest
SET ProductID = 41
WHERE Lineitem_name = 'Claquettes de training SWO - Blanc / 42/43' 
OR Lineitem_name LIKE '(NOUVEAU) Short BLANC SWO - L%';

UPDATE OrdersFactTest
SET ProductID = 41
WHERE Lineitem_name = 'Claquettes de training SWO - Blanc / 36/37' 
OR Lineitem_name LIKE '(NOUVEAU) Short BLANC SWO - XS%';

UPDATE OrdersFactTest
SET ProductID = 42
WHERE Lineitem_name = 'Claquettes de training SWO - Blanc / 38/39' 
OR Lineitem_name LIKE '(NOUVEAU) Short BLANC SWO - S%';

UPDATE OrdersFactTest
SET ProductID = 39
WHERE Lineitem_name = 'Claquettes de training SWO - Blanc / 40/41' 
OR Lineitem_name LIKE '(NOUVEAU) Short BLANC SWO - M%';

-- Black
UPDATE OrdersFactTest
SET ProductID = 40
WHERE Lineitem_name = 'Claquettes de training SWO - Noir / 42/43' 
OR Lineitem_name LIKE '(NOUVEAU) Short NOIR SWO - L%';

UPDATE OrdersFactTest
SET ProductID = 41
WHERE Lineitem_name = 'Claquettes de training SWO - Noir / 36/37' 
OR Lineitem_name LIKE '(NOUVEAU) Short NOIR SWO - XS%';

UPDATE OrdersFactTest
SET ProductID = 42
WHERE Lineitem_name = 'Claquettes de training SWO - Noir / 38/39' 
OR Lineitem_name LIKE '(NOUVEAU) Short NOIR SWO - S%' 
OR Lineitem_name = 'Short de training SWO - S';

UPDATE OrdersFactTest
SET ProductID = 39
WHERE Lineitem_name = 'Claquettes de training SWO - Noir / 40/41' 
OR Lineitem_name LIKE '(NOUVEAU) Short NOIR SWO - M%' 
OR Lineitem_name = 'Short de training SWO - M';

UPDATE OrdersFactTest
SET ProductID = 40
WHERE Lineitem_name = 'Claquettes de training SWO - Noir / 42/43' 
OR Lineitem_name LIKE '(NOUVEAU) Short NOIR SWO - L%';


-- Necklace
UPDATE OrdersFactTest
SET ProductID = 7
WHERE Lineitem_name LIKE 'Collier Lightning - Argent%';

UPDATE OrdersFactTest
SET ProductID = 6
WHERE Lineitem_name LIKE 'Collier Lightning - Doré%';

UPDATE OrdersFactTest
SET ProductID = 5
WHERE Lineitem_name LIKE 'Collier Lightning - Noir%';


-- Rashguard (black)
UPDATE OrdersFactTest
SET ProductID = 4
WHERE Lineitem_name = 'DARKNESS RASHGUARD - L';

UPDATE OrdersFactTest
SET ProductID = 1
WHERE Lineitem_name = 'DARKNESS RASHGUARD - M';

UPDATE OrdersFactTest
SET ProductID = 3
WHERE Lineitem_name = 'DARKNESS RASHGUARD - S';

UPDATE OrdersFactTest
SET ProductID = 2
WHERE Lineitem_name = 'DARKNESS RASHGUARD - XS';


-- Resistance bands
UPDATE OrdersFactTest
SET ProductID = 21
WHERE Lineitem_name = 'ÉLASTIQUES SWO - LIGHT (5-10KG)';

UPDATE OrdersFactTest
SET ProductID = 20
WHERE Lineitem_name = 'ÉLASTIQUES SWO - MEDIUM (7,5-20KG)';

UPDATE OrdersFactTest
SET ProductID = 18
WHERE Lineitem_name = 'ÉLASTIQUES SWO - PACK 3 ÉLASTIQUES' OR Lineitem_name LIKE '%ÉLASTIQUES PREMIUM%';


-- Water bottle
UPDATE OrdersFactTest
SET ProductID = 34
WHERE Lineitem_name = 'Gourde isotherme SWO - Gris';

UPDATE OrdersFactTest
SET ProductID = 33
WHERE Lineitem_name = 'Gourde isotherme SWO - Noir';


-- Rashguard (white)
UPDATE OrdersFactTest
SET ProductID = 11
WHERE Lineitem_name = 'LIGHTNING RASHGUARD - L';

UPDATE OrdersFactTest
SET ProductID = 10
WHERE Lineitem_name = 'LIGHTNING RASHGUARD - M';

UPDATE OrdersFactTest
SET ProductID = 9
WHERE Lineitem_name = 'LIGHTNING RASHGUARD - S';

UPDATE OrdersFactTest
SET ProductID = 8
WHERE Lineitem_name = 'LIGHTNING RASHGUARD - XS';


-- Cargo shorts
UPDATE OrdersFactTest
SET ProductID = 25
WHERE Lineitem_name = 'PANTALON CARGO SWO - 38';

UPDATE OrdersFactTest
SET ProductID = 24
WHERE Lineitem_name = 'PANTALON CARGO SWO - 40';

UPDATE OrdersFactTest
SET ProductID = 23
WHERE Lineitem_name = 'PANTALON CARGO SWO - 42';

UPDATE OrdersFactTest
SET ProductID = 22
WHERE Lineitem_name = 'PANTALON CARGO SWO - 44';


-- Wrist wraps and elbow sleeves
UPDATE OrdersFactTest
SET ProductID = 59
WHERE Lineitem_name = 'PROTÈGE POIGNETS - COUDES - Coudes: 9x13cm'

UPDATE OrdersFactTest
SET ProductID = 60
WHERE Lineitem_name = 'PROTÈGE POIGNETS - COUDES - Poignets : 7*10cm' OR Lineitem_name = '(NOUVEAU ) PROTÈGE POIGNETS BLANCS - Poignets : 7*10cm';


-- Backpack
UPDATE OrdersFactTest
SET ProductID = 30
WHERE Lineitem_name = 'Sac de transport SWO - Blanc';

UPDATE OrdersFactTest
SET ProductID = 29
WHERE Lineitem_name = 'Sac de transport SWO - Noir';


-- Bracelets/wristbands
UPDATE OrdersFactTest
SET ProductID = 63
WHERE Lineitem_name = 'SWO BRACELET - Blanc' OR Lineitem_name = 'SWO BRACELETS - Blanc';

UPDATE OrdersFactTest
SET ProductID = 61
WHERE Lineitem_name = 'SWO BRACELET - Darkness' OR Lineitem_name = 'SWO BRACELETS - Noir';

UPDATE OrdersFactTest
SET ProductID = 62
WHERE Lineitem_name = 'SWO BRACELET - Violet' OR Lineitem_name = 'SWO BRACELETS - Violet';


-- Swockets
-- White
UPDATE OrdersFactTest
SET ProductID = 51
WHERE Lineitem_name LIKE '%SWOCKETS%'  
AND Lineitem_name LIKE '%L (37-41)%' 
AND (Lineitem_name LIKE '%Blanc%' OR Lineitem_name LIKE '%Lightning%')
OR Lineitem_name = 'Sample of swocket'
OR Lineitem_name LIKE '%V2';

UPDATE OrdersFactTest
SET ProductID = 52
WHERE Lineitem_name LIKE '%SWOCKETS%'  
AND Lineitem_name LIKE '%XL (42-45)%' 
AND (Lineitem_name LIKE '%Blanc%' OR Lineitem_name LIKE '%Lightning%');

-- Black
UPDATE OrdersFactTest
SET ProductID = 49
WHERE Lineitem_name LIKE '%SWOCKETS%' 
AND Lineitem_name LIKE '%L (37-41)%' 
AND (Lineitem_name LIKE '%Noir%' OR Lineitem_name LIKE '%Darkness%');

UPDATE OrdersFactTest
SET ProductID = 50
WHERE Lineitem_name LIKE '%SWOCKETS%' 
AND Lineitem_name LIKE '%XL (42-45)%' 
AND (Lineitem_name LIKE '%Noir%' OR Lineitem_name LIKE '%Darkness%');


-- Oversized T-Shirt
-- Black
UPDATE OrdersFactTest
SET ProductID = 12
WHERE Lineitem_name LIKE '%T-Shirt%' 
AND Lineitem_name LIKE '%- L%' 
AND (Lineitem_name LIKE '%Noir%' OR Lineitem_name LIKE '%Darkness%');

UPDATE OrdersFactTest
SET ProductID = 13
WHERE Lineitem_name LIKE '%T-Shirt%' 
AND Lineitem_name LIKE '%- M%' 
AND (Lineitem_name LIKE '%Noir%' OR Lineitem_name LIKE '%Darkness%');

UPDATE OrdersFactTest
SET ProductID = 14
WHERE Lineitem_name LIKE '%T-Shirt%' 
AND Lineitem_name LIKE '%- S%'
AND (Lineitem_name LIKE '%Noir%' OR Lineitem_name LIKE '%Darkness%');

-- White
UPDATE OrdersFactTest
SET ProductID = 15
WHERE Lineitem_name LIKE '%T-Shirt%' 
AND Lineitem_name LIKE '%- L%' 
AND (Lineitem_name LIKE '%Blanc%' OR Lineitem_name LIKE '%Lightning%');

UPDATE OrdersFactTest
SET ProductID = 16
WHERE Lineitem_name LIKE '%T-Shirt%' 
AND Lineitem_name LIKE '%- M%' 
AND (Lineitem_name LIKE '%Blanc%' OR Lineitem_name LIKE '%Lightning%');

UPDATE OrdersFactTest
SET ProductID = 17
WHERE Lineitem_name LIKE '%T-Shirt%' 
AND Lineitem_name LIKE '%- S%' 
AND (Lineitem_name LIKE '%Blanc%' OR Lineitem_name LIKE '%Lightning%');


-- Create Shopify Product Fact Table (used to link Shopify Product Names with Google Sheets Products)
SELECT DISTINCT 
ProductID,
Lineitem_name AS ShopifyName
INTO ProductFact
FROM OrdersFactTest
WHERE ProductID IS NOT NULL
ORDER BY ProductID;



-- Create table that will used to merge customerIDs to Orders on order fact table.
SELECT 
	CustomerID, 
	PrimaryEmail AS Email
INTO Customer_Merge
FROM Customer_Details;

-- Add secondary emails to the table so that all transactions are identified.
INSERT INTO Customer_Merge (CustomerID, Email)
SELECT
	CustomerID,
	CASE 
	WHEN SecondaryEmail IS NOT NULL THEN SecondaryEmail 
	ELSE NULL 
	END AS Email
FROM Customer_Details;


-- Create Orders Fact Table using OrdersFactTest and Customer_Merge linked by email
SELECT ord.OrderID, 
cx.CustomerID, 
ord.ProductID, 
ord.Lineitem_quantity AS Quantity,
ROUND(ord.Lineitem_price, 2) AS Price
INTO OrdersFact
FROM OrdersFactTest ord
LEFT JOIN Customer_Merge cx
ON cx.Email = ord.Email
WHERE ord.OrderID != 1424
AND ord.OrderID NOT BETWEEN 1251 AND 1258 AND ord.ProductID IS NOT NULL
ORDER BY ord.OrderID;


-- Create OrderDetails Dimension Table. This table has details on the payment information
-- and shipping information of orders. 
SELECT 
	TRIM('#' FROM Name) AS OrderID,
	Currency,
	Payment_Method,
	ROUND(Shipping, 2) AS ShippingCost,
	ROUND(Taxes, 2) AS Taxes,
	ROUND(Total, 2) AS TotalPrice,
	ROUND(Subtotal, 2) AS DiscountedTotal,
	ROUND(Discount_Amount, 2) AS DiscountAmount,
	Discount_Code,
	ROUND(Refunded_Amount, 2) AS RefundAmount,
	ROUND(Outstanding_Balance, 2) AS OutstandingBalance,
	Financial_Status,
-- Use Shipping Time as 'Time of Payment' if 'Time of Payment' is empty
	CASE 
		WHEN Paid_at IS NOT NULL THEN (SWITCHOFFSET(CAST(STUFF(Paid_at, 24, 0, ':') AS datetimeoffset(0)), '+00:00')) 
		ELSE (SWITCHOFFSET(CAST(STUFF(Fulfilled_at, 24, 0, ':') AS datetimeoffset(0)), '+00:00'))
	END AS TimeOfPayment,
	Fulfillment_Status,
	SWITCHOFFSET(
		CAST(STUFF(Cancelled_at, 24, 0, ':') AS datetimeoffset(0)), 
		'+00:00'
		) AS CancellationDate,
	Shipping_Method,
	Shipping_Phone,
	SWITCHOFFSET(
		CAST(STUFF(Fulfilled_at, 24, 0, ':') AS datetimeoffset(0)), 
		'+00:00'
		) AS ShippingTime,
	Shipping_Street,
	Shipping_Address1,
	Shipping_Address2,
	Shipping_Company,
	Shipping_City,
	Shipping_Zip,
	Shipping_Province,
	Shipping_Country,
	Accepts_Marketing
INTO Order_Details
FROM Data_Warehouse
WHERE Total IS NOT NULL 
AND TRIM('#' FROM Name) != 1424
AND TRIM('#' FROM Name) NOT BETWEEN 1251 AND 1258
ORDER BY TRIM('#' FROM Name) ASC; 


-- Refunded Orders
SELECT TRIM('#' FROM Name) AS OrderID,
Financial_Status,
Fulfillment_Status,
SWITCHOFFSET(
		CAST(STUFF(Cancelled_at, 24, 0, ':') AS datetimeoffset(0)), 
		'+00:00'
		) AS CancellationDate,
ROUND(Subtotal, 2) AS DiscountedTotal,
ROUND(Discount_Amount, 2) AS DiscountAmount,
ROUND(Refunded_Amount, 2) AS RefundAmount,
ROUND(Outstanding_Balance, 2) AS OutstandingBalance
INTO RefundedOrders
FROM Data_Warehouse
WHERE Financial_Status LIKE '%refund%'
ORDER BY TRIM('#' FROM Name);


-- Unfulfilled Orders
SELECT TRIM('#' FROM Name) AS OrderID,
Financial_Status,
Fulfillment_Status,
SWITCHOFFSET(
		CAST(STUFF(Cancelled_at, 24, 0, ':') AS datetimeoffset(0)), 
		'+00:00'
		) AS CancellationDate,
ROUND(Subtotal, 2) AS DiscountedTotal,
ROUND(Discount_Amount, 2) AS DiscountAmount,
ROUND(Refunded_Amount, 2) AS RefundAmount,
ROUND(Outstanding_Balance, 2) AS OutstandingBalance
INTO UnfulfilledOrders
FROM Data_Warehouse
WHERE Fulfillment_Status = 'unfulfilled'
ORDER BY TRIM('#' FROM Name)

