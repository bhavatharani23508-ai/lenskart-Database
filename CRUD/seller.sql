SQL> CREATE TABLE LenskartSeller (
  2      Seller_ID NUMBER PRIMARY KEY,
  3      Seller_Name VARCHAR2(100) NOT NULL,
  4      Contact_Number VARCHAR2(15),
  5      Email VARCHAR2(100) UNIQUE,
  6      Address VARCHAR2(200)
  7  );

Table created.

SQL> INSERT INTO LenskartSeller
  2  VALUES (1, 'Vision Plus', '9876543210', 'visionplus@gmail.com', 'Chennai');

1 row created.

SQL> 
SQL> INSERT INTO LenskartSeller
  2  VALUES (2, 'Eye World', '9876543211', 'eyeworld@gmail.com', 'Bangalore');

1 row created.

SQL> 
SQL> INSERT INTO LenskartSeller
  2  VALUES (3, 'Optic Zone', '9876543212', 'opticzone@gmail.com', 'Coimbatore');

1 row created.

SQL> 
SQL> INSERT INTO LenskartSeller
  2  VALUES (4, 'Clear Vision Store', '9876543213', 'clearvision@gmail.com', 'Madurai');

1 row created.

SQL> 
SQL> INSERT INTO LenskartSeller
  2  VALUES (5, 'Lens World', '9876543214', 'lensworld@gmail.com', 'Salem');

1 row created.

SQL> SELECT
  2      Stock_Status,
  3      COUNT(*) AS Total_Products
  4  FROM LenskartInventory
  5  GROUP BY Stock_Status
  6  ORDER BY Stock_Status;

STOCK_STATUS         TOTAL_PRODUCTS
-------------------- --------------
Available                         4
Unavailable                       1
SQL> SELECT
  2      COUNT(*) AS Total_Inventory,
  3      SUM(CASE
  4          WHEN Stock_Status = 'Available' THEN 1
  5          ELSE 0
  6      END) AS Available_Products,
  7      SUM(CASE
  8          WHEN Stock_Status = 'Unavailable' THEN 1
  9          ELSE 0
 10      END) AS Unavailable_Products,
 11      SUM(Stock_Quantity) AS Total_Stock
 12  FROM LenskartInventory;

TOTAL_INVENTORY AVAILABLE_PRODUCTS UNAVAILABLE_PRODUCTS TOTAL_STOCK
--------------- ------------------ -------------------- -----------
              5                  4                    1         145




