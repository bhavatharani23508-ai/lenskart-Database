SQL> CREATE TABLE LenskartInventory (
  2      Inventory_ID NUMBER PRIMARY KEY,
  3      Product_ID NUMBER,
  4      Seller_ID NUMBER,
  5      Stock_Quantity NUMBER NOT NULL,
  6      Stock_Status VARCHAR2(20) NOT NULL,
  7      Last_Updated DATE NOT NULL,
  8      FOREIGN KEY (Product_ID) REFERENCES LenskartProduct(Product_ID),
  9      FOREIGN KEY (Seller_ID) REFERENCES LenskartSeller(Seller_ID)
 10  );

Table created.
SQL> INSERT INTO LenskartInventory
  2  VALUES (1, 1, 1, 50, 'Available', SYSDATE);

1 row created.

SQL> 
SQL> INSERT INTO LenskartInventory
  2  VALUES (2, 2, 2, 30, 'Available', SYSDATE);

1 row created.

SQL> 
SQL> INSERT INTO LenskartInventory
  2  VALUES (3, 3, 3, 25, 'Available', SYSDATE);

1 row created.

SQL> 
SQL> INSERT INTO LenskartInventory
  2  VALUES (4, 4, 4, 40, 'Available', SYSDATE);

1 row created.

SQL> 
SQL> INSERT INTO LenskartInventory
  2  VALUES (5, 5, 5, 0, 'Unavailable', SYSDATE);

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

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




