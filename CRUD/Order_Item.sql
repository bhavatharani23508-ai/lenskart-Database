CREATE TABLE LenskartOrderItem (
    Order_Item_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER,
    Product_ID NUMBER,
    Quantity NUMBER NOT NULL,
    Price NUMBER(10,2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES LenskartOrder(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES LenskartProduct(Product_ID)
);

-- OUTPUT:
-- Table created.

DESC LenskartOrderItem;

-- OUTPUT:
-- ORDER_ITEM_ID  NOT NULL NUMBER
-- ORDER_ID                NUMBER
-- PRODUCT_ID              NUMBER
-- QUANTITY       NOT NULL NUMBER
-- PRICE          NOT NULL NUMBER(10,2)

INSERT INTO LenskartOrderItem
VALUES (1, 1, 1, 2, 1200.00);

INSERT INTO LenskartOrderItem
VALUES (2, 2, 2, 2, 1800.00);

INSERT INTO LenskartOrderItem
VALUES (3, 3, 3, 2, 1500.00);

INSERT INTO LenskartOrderItem
VALUES (4, 4, 4, 2, 2000.00);

INSERT INTO LenskartOrderItem
VALUES (5, 5, 5, 2, 900.00);

COMMIT;

-- OUTPUT:
-- 1 row created.
-- 1 row created.
-- 1 row created.
-- 1 row created.
-- 1 row created.
-- Commit complete.

SELECT * FROM LenskartOrderItem;

-- OUTPUT:
-- ORDER_ITEM_ID ORDER_ID PRODUCT_ID QUANTITY PRICE
-- 1             1        1          2        1200
-- 2             2        2          2        1800
-- 3             3        3          2        1500
-- 4             4        4          2        2000
-- 5             5        5          2        900

UPDATE LenskartOrderItem
SET Quantity = 2
WHERE Order_Item_ID = 1;

UPDATE LenskartOrderItem
SET Price = 1200.00
WHERE Order_Item_ID = 1;

COMMIT;

-- OUTPUT:
-- 1 row updated.
-- 1 row updated.
-- Commit complete.

SELECT * FROM LenskartOrderItem;

-- OUTPUT:
-- ORDER_ITEM_ID ORDER_ID PRODUCT_ID QUANTITY PRICE
-- 1             1        1          2        1200
-- 2             2        2          2        1800
-- 3             3        3          2        1500
-- 4             4        4          2        2000
-- 5             5        5          2        900
