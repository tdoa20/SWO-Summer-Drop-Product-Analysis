-- Create SWO database
CREATE DATABASE SWO_Data_Warehouse;

USE SWO_Data_Warehouse; 

-- Create Orders Export Table (Data_Warehouse)
CREATE TABLE Data_Warehouse (
		Name nvarchar(255)
      ,Email nvarchar(255) 
      ,Financial_Status nvarchar(255)
      ,Paid_at nvarchar(255)
      ,Fulfillment_Status nvarchar(255)
      ,Fulfilled_at nvarchar(255)
      ,Accepts_Marketing nvarchar(255)
      ,Currency nvarchar(255)
      ,Subtotal float
      ,Shipping float
      ,Taxes float
      ,Total float
      ,Discount_Code nvarchar(255)
      ,Discount_Amount float
      ,Shipping_Method nvarchar(255)
      ,Created_at nvarchar(255)
      ,Lineitem_quantity tinyint
      ,Lineitem_name nvarchar(255)
      ,Lineitem_price float
      ,Lineitem_compare_at_price float
      ,Lineitem_sku nvarchar(255)
      ,Lineitem_requires_shipping nvarchar(255)
      ,Lineitem_taxable nvarchar(255)
      ,Lineitem_fulfillment_status nvarchar(255)
      ,Billing_Name nvarchar(255)
      ,Billing_Street nvarchar(255)
      ,Billing_Address1 nvarchar(255)
      ,Billing_Address2 nvarchar(255)
      ,Billing_Company nvarchar(255)
      ,Billing_City nvarchar(255)
      ,Billing_Zip nvarchar(255)
      ,Billing_Province nvarchar(255)
      ,Billing_Country nvarchar(255)
      ,Billing_Phone nvarchar(255)
      ,Shipping_Name nvarchar(255)
      ,Shipping_Street nvarchar(255)
      ,Shipping_Address1 nvarchar(255)
      ,Shipping_Address2 nvarchar(255)
      ,Shipping_Company nvarchar(255)
      ,Shipping_City nvarchar(255)
      ,Shipping_Zip nvarchar(255)
      ,Shipping_Province nvarchar(255)
      ,Shipping_Country nvarchar(255)
      ,Shipping_Phone nvarchar(255)
      ,Notes nvarchar(255)
      ,Note_Attributes nvarchar(255)
      ,Cancelled_at nvarchar(255)
      ,Payment_Method nvarchar(255)
      ,Payment_Reference nvarchar(255)
      ,Refunded_Amount float
      ,Vendor nvarchar(255)
      ,Outstanding_Balance float
      ,Employee nvarchar(255)
      ,Location nvarchar(255)
      ,Device_ID nvarchar(255)
      ,Id nvarchar(255)
      ,Tags nvarchar(255)
      ,Risk_Level nvarchar(255)
      ,Source nvarchar(255)
      ,Lineitem_discount float
      ,Tax_1_Name nvarchar(255)
      ,Tax_1_Value float
      ,Tax_2_Name nvarchar(255)
      ,Tax_2_Value float
      ,Tax_3_Name nvarchar(255)
      ,Tax_3_Value float
      ,Tax_4_Name nvarchar(255)
      ,Tax_4_Value float
      ,Tax_5_Name nvarchar(255)
      ,Tax_5_Value float
      ,Phone nvarchar(255)
      ,Receipt_Number nvarchar(255)
      ,Duties nvarchar(255)
      ,Billing_Province_Name nvarchar(255)
      ,Shipping_Province_Name nvarchar(255)
      ,Payment_ID nvarchar(255)
      ,Payment_Terms_Name nvarchar(255)
      ,Next_Payment_Due_At nvarchar(255)
      ,Payment_References nvarchar(255)
);




-- Convert datatypes of diferent columns
ALTER TABLE Data_Warehouse
ALTER COLUMN Lineitem_requires_shipping bit;

ALTER TABLE Data_Warehouse
ALTER COLUMN Lineitem_taxable bit;

UPDATE Data_Warehouse
SET Accepts_Marketing =
    CASE 
        WHEN Accepts_Marketing = 'yes' THEN 1
        WHEN Accepts_Marketing = 'no' THEN 0
        ELSE NULL
    END;

ALTER TABLE Data_Warehouse
ALTER COLUMN Accepts_Marketing bit;

-- Convert columns back to nvarchar by changing bit values.
UPDATE Data_Warehouse
SET 
	Lineitem_requires_shipping =
    CASE 
        WHEN Lineitem_requires_shipping = 1 THEN 'True'
        WHEN Lineitem_requires_shipping = 0 THEN 'False'
        ELSE NULL
    END,
	Lineitem_taxable =
    CASE 
        WHEN Lineitem_taxable = 1 THEN 'True'
        WHEN Lineitem_taxable = 0 THEN 'False'
        ELSE NULL
    END;

-- Change data types
ALTER TABLE Data_Warehouse
ALTER COLUMN Lineitem_requires_shipping nvarchar(255);

ALTER TABLE Data_Warehouse
ALTER COLUMN Lineitem_taxable nvarchar(255);

-- Accepts_Marketing 
UPDATE Data_Warehouse
SET Accepts_Marketing =
    CASE 
        WHEN Accepts_Marketing = 1 THEN 'True'
        WHEN Accepts_Marketing = 0 THEN 'False'
        ELSE NULL
    END;

ALTER TABLE Data_Warehouse
ALTER COLUMN Accepts_Marketing nvarchar(255);

UPDATE Data_Warehouse
SET Accepts_Marketing =
    CASE 
        WHEN Accepts_Marketing = 'True' THEN 'yes'
        WHEN Accepts_Marketing = 'False' THEN 'no'
        ELSE NULL
    END;


-- Refresh DataWarehouse table by rebuilding table structure.
-- This is done so SQL Server does not retain internal metadata.
-- Step 1: Create a temp table with RowID
SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowID
INTO #Temp_Data_Warehouse
FROM Data_Warehouse;

-- Step 2: Truncate the original table with orders_export file
TRUNCATE TABLE Data_Warehouse;

ALTER TABLE Data_Warehouse
ADD RowID int;


-- Step 3: Insert back with RowID
INSERT INTO Data_Warehouse
SELECT * FROM #Temp_Data_Warehouse;

DROP TABLE #Temp_Data_Warehouse;


-- Re-create the clustered index (adjust columns as needed)
CREATE CLUSTERED INDEX IX_Data_Warehouse_YourClusteredIndex
ON dbo.Data_Warehouse (RowID);

ALTER TABLE dbo.Data_Warehouse REBUILD;

-- Drop existing clustered index (replace with actual index name)
DROP INDEX IF EXISTS IX_Data_Warehouse_YourClusteredIndex ON dbo.Data_Warehouse;

ALTER TABLE dbo.Data_Warehouse
DROP COLUMN RowID;
