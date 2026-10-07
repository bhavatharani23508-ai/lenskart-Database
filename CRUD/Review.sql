-- REVIEW TABLE

SQL> CREATE TABLE Review (
  2      Review_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER,
  4      Product_ID NUMBER,
  5      Review_Text VARCHAR2(500),
  6      Review_Date DATE,
  7      FOREIGN KEY (Customer_ID) REFERENCES LenskartCustomer(Customer_ID),
  8      FOREIGN KEY (Product_ID) REFERENCES LenskartProduct(Product_ID)
  9  );

Table created.

SQL> INSERT INTO Review VALUES
  2  (601, 1, 1, 'Good quality frame and comfortable to wear',
  3  TO_DATE('24-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO Review VALUES
  2  (602, 2, 2, 'Very useful for computer and laptop use',
  3  TO_DATE('25-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO Review VALUES
  2  (603, 3, 3, 'Stylish design and good fitting',
  3  TO_DATE('26-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO Review VALUES
  2  (604, 4, 4, 'Good sunglasses with excellent look',
  3  TO_DATE('27-09-2026','DD-MM-YYYY'));

1 row created.

SQL> INSERT INTO Review VALUES
  2  (605, 5, 5, 'Comfortable contact lenses and easy to use',
  3  TO_DATE('28-09-2026','DD-MM-YYYY'));

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Review;

REVIEW_ID CUSTOMER_ID PRODUCT_ID REVIEW_TEXT
--------- ----------- ---------- -----------------------------------------------
REVIEW_DATE
-----------
601       1           1          Good quality frame and comfortable to wear
24-SEP-26

602       2           2          Very useful for computer and laptop use
25-SEP-26

603       3           3          Stylish design and good fitting
26-SEP-26

604       4           4          Good sunglasses with excellent look
27-SEP-26

605       5           5          Comfortable contact lenses and easy to use
28-SEP-26
