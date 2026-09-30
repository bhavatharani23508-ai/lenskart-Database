SQL> CREATE TABLE LenskartPayment (
  2      Payment_ID NUMBER PRIMARY KEY,
  3      Order_ID NUMBER,
  4      Payment_Date DATE,
  5      Payment_Method VARCHAR2(30),
  6      Payment_Amount NUMBER(10,2),
  7      Payment_Status VARCHAR2(30),
  8      FOREIGN KEY (Order_ID) REFERENCES LenskartOrder(Order_ID)
  9  );

Table created.

SQL> INSERT INTO LenskartPayment VALUES
  2  (501, 1, TO_DATE('18-09-2026','DD-MM-YYYY'), 'UPI', 2400.00, 'Paid');

1 row created.

SQL> INSERT INTO LenskartPayment VALUES
  2  (502, 2, TO_DATE('23-09-2026','DD-MM-YYYY'), 'Card', 1800.00, 'Paid');

1 row created.

SQL> INSERT INTO LenskartPayment VALUES
  2  (503, 3, TO_DATE('20-09-2026','DD-MM-YYYY'), 'Cash on Delivery', 3200.00, 'Pending');

1 row created.

SQL> INSERT INTO LenskartPayment VALUES
  2  (504, 4, TO_DATE('21-09-2026','DD-MM-YYYY'), 'Net Banking', 2000.00, 'Failed');

1 row created.

SQL> INSERT INTO LenskartPayment VALUES
  2  (505, 5, TO_DATE('22-09-2026','DD-MM-YYYY'), 'UPI', 900.00, 'Paid');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT *
  2  FROM LenskartPayment
  3  WHERE Payment_Status = 'Paid';

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
       501          1 18-SEP-26 UPI                                      2400
Paid

       502          2 23-SEP-26 Card                                     1800
Paid

       505          5 22-SEP-26 UPI                                       900
Paid


SQL> SELECT *
  2  FROM LenskartPayment
  3  WHERE Payment_Status IN ('Failed', 'Pending');

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
       503          3 20-SEP-26 Cash on Delivery                         3200
Pending

       504          4 21-SEP-26 Net Banking                              2000
Failed


SQL> UPDATE LenskartPayment
  2  SET Payment_Status = 'Paid'
  3  WHERE Payment_ID = 503;

1 row updated.

SQL> UPDATE LenskartPayment
  2  SET Payment_Status = 'Paid'
  3  WHERE Payment_ID = 504;

1 row updated.

SQL> COMMIT;

Commit complete.

SQL> SELECT Payment_Method, COUNT(*) AS Total_Transactions
  2  FROM LenskartPayment
  3  GROUP BY Payment_Method;

PAYMENT_METHOD                 TOTAL_TRANSACTIONS
------------------------------ ------------------
UPI                                             2
Card                                            1
Cash on Delivery                                1
Net Banking                                     1


SQL> SELECT Payment_Method,
  2         SUM(Payment_Amount) AS Total_Amount
  3  FROM LenskartPayment
  4  GROUP BY Payment_Method;

PAYMENT_METHOD                 TOTAL_AMOUNT
------------------------------ ------------
UPI                                    3300
Card                                   1800
Cash on Delivery                       3200
Net Banking                            2000


SQL> SELECT
  2      Payment_ID,
  3      Order_ID,
  4      Payment_Date,
  5      Payment_Method,
  6      Payment_Amount,
  7      Payment_Status
  8  FROM LenskartPayment
  9  ORDER BY Payment_Date;

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
       501          1 18-SEP-26 UPI                                      2400
Paid

       503          3 20-SEP-26 Cash on Delivery                         3200
Paid

       504          4 21-SEP-26 Net Banking                              2000
Paid

       505          5 22-SEP-26 UPI                                       900
Paid

       502          2 23-SEP-26 Card                                     1800
Paid


SQL> SELECT
  2      c.Customer_ID,
  3      p.Order_ID,
  4      p.Payment_ID,
  5      p.Payment_Date,
  6      p.Payment_Method,
  7      p.Payment_Amount,
  8      p.Payment_Status
  9  FROM LenskartCustomer c
 10  JOIN LenskartOrder o
 11  ON c.Customer_ID = o.Customer_ID
 12  JOIN LenskartPayment p
 13  ON o.Order_ID = p.Order_ID
 14  ORDER BY c.Customer_ID;

CUSTOMER_ID   ORDER_ID PAYMENT_ID PAYMENT_D PAYMENT_METHOD
----------- ---------- ---------- --------- ------------------------------
PAYMENT_AMOUNT PAYMENT_STATUS
-------------- ------------------------------
          1          1        501 18-SEP-26 UPI
          2400 Paid

          2          2        502 23-SEP-26 Card
          1800 Paid

          3          3        503 20-SEP-26 Cash on Delivery
          3200 Paid

          4          4        504 21-SEP-26 Net Banking
          2000 Paid

          5          5        505 22-SEP-26 UPI
           900 Paid


SQL> SELECT * FROM LenskartPayment;

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
       501          1 18-SEP-26 UPI                                      2400
Paid

       502          2 23-SEP-26 Card                                     1800
Paid

       503          3 20-SEP-26 Cash on Delivery                         3200
Paid

       504          4 21-SEP-26 Net Banking                              2000
Paid

       505          5 22-SEP-26 UPI                                       900
Paid
