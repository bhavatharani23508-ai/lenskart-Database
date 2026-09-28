CREATE TABLE LenskartOrder (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Order_Date DATE NOT NULL,
    Total_Amount NUMBER(10,2) NOT NULL,
    Order_Status VARCHAR2(30) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES LenskartCustomer(Customer_ID)
);

-- OUTPUT:
-- Table created.

DESC LenskartOrder;

-- OUTPUT:
-- ORDER_ID       NOT NULL NUMBER
-- CUSTOMER_ID             NUMBER
-- ORDER_DATE     NOT NULL DATE
-- TOTAL_AMOUNT   NOT NULL NUMBER(10,2)
-- ORDER_STATUS   NOT NULL VARCHAR2(30)

INSERT INTO LenskartOrder
VALUES (1, 1, TO_DATE('18-09-2026','DD-MM-YYYY'), 1200.00, 'Confirmed');

INSERT INTO LenskartOrder
VALUES (2, 2, TO_DATE('19-09-2026','DD-MM-YYYY'), 1800.00, 'Shipped');

INSERT INTO LenskartOrder
VALUES (3, 3, TO_DATE('20-09-2026','DD-MM-YYYY'), 1500.00, 'Delivered');

INSERT INTO LenskartOrder
VALUES (4, 4, TO_DATE('21-09-2026','DD-MM-YYYY'), 2000.00, 'Confirmed');

INSERT INTO LenskartOrder
VALUES (5, 5, TO_DATE('22-09-2026','DD-MM-YYYY'), 900.00, 'Processing');

COMMIT;

-- OUTPUT:
-- 1 row created.
-- 1 row created.
-- 1 row created.
-- 1 row created.
-- 1 row created.
-- Commit complete.

SELECT * FROM LenskartOrder;

-- OUTPUT:
-- ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
-- 1        1           18-SEP-26 1200         Confirmed
-- 2        2           19-SEP-26 1800         Shipped
-- 3        3           20-SEP-26 1500         Delivered
-- 4        4           21-SEP-26 2000         Confirmed
-- 5        5           22-SEP-26 900          Processing

UPDATE LenskartOrder
SET Total_Amount = 2400.00
WHERE Order_ID = 1;

UPDATE LenskartOrder
SET Order_Date = TO_DATE('23-09-2026','DD-MM-YYYY')
WHERE Order_ID = 2;

UPDATE LenskartOrder
SET Total_Amount = 3200.00
WHERE Order_ID = 3;

COMMIT;

-- OUTPUT:
-- 1 row updated.
-- 1 row updated.
-- 1 row updated.
-- Commit complete.

SELECT * FROM LenskartOrder;

-- OUTPUT:
-- ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
-- 1        1           18-SEP-26 2400         Confirmed
-- 2        2           23-SEP-26 1800         Shipped
-- 3        3           20-SEP-26 3200         Delivered
-- 4        4           21-SEP-26 2000         Confirmed
-- 5        5           22-SEP-26 900          Processing
