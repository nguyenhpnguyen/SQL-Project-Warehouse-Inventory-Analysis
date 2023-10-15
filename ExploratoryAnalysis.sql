-- Examining all tables and their columns
DESCRIBE customers;
DESCRIBE employees;
DESCRIBE offices;
DESCRIBE orderdetails;
DESCRIBE orders;
DESCRIBE payments;
DESCRIBE productlines;
DESCRIBE products;
DESCRIBE warehouses;

-- Looking through the first 5 rows of each table that is considered containing useful variables
SELECT * FROM warehouses;
SELECT * FROM orderdetails LIMIT 5;
SELECT * FROM products LIMIT 5;

-- Checking for NULL values
SELECT COUNT(*) FROM orderdetails
	WHERE productCode IS NULL
		OR quantityOrdered IS NULL
        OR priceEach IS NULL;
SELECT COUNT(*) FROM products
	WHERE productCode IS NULL
		OR productLine IS NULL
        OR quantityInStock IS NULL
        OR warehouseCode IS NULL
        OR buyPrice IS NULL
        OR MSRP IS NULL;

-- Investigating the warehouse inventory
SELECT warehouses.warehouseName, products.warehouseCode, COUNT(DISTINCT products.productLine),
	COUNT(DISTINCT productCode), SUM(products.quantityInStock), warehouses.warehousePctCap
	FROM products
    INNER JOIN warehouses
    ON products.warehouseCode = warehouses.warehouseCode
    GROUP BY warehouseCode;