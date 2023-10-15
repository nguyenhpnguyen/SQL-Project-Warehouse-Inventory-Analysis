SELECT DISTINCT products.productCode AS undervaluedProducts, products.warehouseCode
	FROM orderdetails
    LEFT JOIN products
    ON orderdetails.productCode = products.productCode
    WHERE orderdetails.priceEach - products.buyPrice < products.MSRP - products.buyPrice
    ORDER BY warehouseCode;