DATABASE RELATIONSHIP ANALYSIS USING JOINS
Lenskart E-Commerce Database

TASK 1: COMBINE CUSTOMER, PRODUCT, ORDER, AND PAYMENT TABLES

SELECT
    C.Customer_ID,
    C.Customer_Name,
    P.Product_Name,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount,
    O.Order_Status,
    PM.Payment_Method,
    PM.Payment_Amount,
    PM.Payment_Status
FROM LenskartCustomer C
INNER JOIN LenskartOrder O
    ON C.Customer_ID = O.Customer_ID
INNER JOIN LenskartOrderItem OI
    ON O.Order_ID = OI.Order_ID
INNER JOIN LenskartProduct P
    ON OI.Product_ID = P.Product_ID
LEFT JOIN LenskartPayment PM
    ON O.Order_ID = PM.Order_ID
ORDER BY O.Order_ID;

TASK 2: IMPLEMENT INNER JOIN, LEFT JOIN, AND RIGHT JOIN

2.1 INNER JOIN

SELECT
    C.Customer_Name,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount,
    O.Order_Status
FROM LenskartCustomer C
INNER JOIN LenskartOrder O
    ON C.Customer_ID = O.Customer_ID
ORDER BY O.Order_ID;

2.2 LEFT JOIN

SELECT
    C.Customer_ID,
    C.Customer_Name,
    O.Order_ID,
    O.Total_Amount,
    O.Order_Status
FROM LenskartCustomer C
LEFT JOIN LenskartOrder O
    ON C.Customer_ID = O.Customer_ID
ORDER BY C.Customer_ID;

2.3 RIGHT JOIN

    C.Customer_Name,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount,
    O.Order_Status
FROM LenskartCustomer C
RIGHT JOIN LenskartOrder O
    ON C.Customer_ID = O.Customer_ID
ORDER BY O.Order_ID;

TASK 3: RETRIEVE COMPLETE ORDER DETAILS

SELECT
    O.Order_ID,
    O.Order_Date,
    C.Customer_ID,
    C.Customer_Name,
    C.Email,
    C.Phone_Number,
    C.Address,
    P.Product_ID,
    P.Product_Name,
    P.Brand,
    OI.Quantity,
    OI.Price AS Item_Price,
    OI.Quantity * OI.Price AS Item_Total,
    O.Total_Amount AS Order_Total,
    O.Order_Status,
    PM.Payment_Method,
    PM.Payment_Amount,
    PM.Payment_Status
FROM LenskartOrder O
INNER JOIN LenskartCustomer C
    ON O.Customer_ID = C.Customer_ID
INNER JOIN LenskartOrderItem OI
    ON O.Order_ID = OI.Order_ID
INNER JOIN LenskartProduct P
    ON OI.Product_ID = P.Product_ID
LEFT JOIN LenskartPayment PM
    ON O.Order_ID = PM.Order_ID
ORDER BY O.Order_ID;

TASK 4: DISPLAY CUSTOMER PURCHASE HISTORY

SELECT
    C.Customer_ID,
    C.Customer_Name,
    O.Order_ID,
    O.Order_Date,
    P.Product_Name,
    OI.Quantity,
    OI.Price,
    OI.Quantity * OI.Price AS Item_Total,
    O.Total_Amount,
    O.Order_Status
FROM LenskartCustomer C
INNER JOIN LenskartOrder O
    ON C.Customer_ID = O.Customer_ID
INNER JOIN LenskartOrderItem OI
    ON O.Order_ID = OI.Order_ID
INNER JOIN LenskartProduct P
    ON OI.Product_ID = P.Product_ID
ORDER BY C.Customer_ID, O.Order_Date;

TASK 5: GENERATE MULTI-TABLE REPORTS

5.1 Customer-Wise Order Summary

SELECT
    C.Customer_ID,
    C.Customer_Name,
    COUNT(DISTINCT O.Order_ID) AS Total_Orders,
    NVL(SUM(O.Total_Amount), 0) AS Total_Order_Amount
FROM LenskartCustomer C
LEFT JOIN LenskartOrder O
    ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY C.Customer_ID;

5.2 Product-Wise Sales Report

SELECT
    P.Product_ID,
    P.Product_Name,
    SUM(OI.Quantity) AS Total_Quantity_Sold,
    SUM(OI.Quantity * OI.Price) AS Total_Item_Sales
FROM LenskartProduct P
INNER JOIN LenskartOrderItem OI
    ON P.Product_ID = OI.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Total_Item_Sales DESC;

5.3 Payment Status Report

SELECT
    PM.Payment_Status,
    COUNT(PM.Payment_ID) AS Total_Payments,
    SUM(PM.Payment_Amount) AS Total_Payment_Amount
FROM LenskartPayment PM
GROUP BY PM.Payment_Status
ORDER BY PM.Payment_Status;

5.4 Order Status Report

SELECT
    O.Order_Status,
    COUNT(O.Order_ID) AS Total_Orders,
    SUM(O.Total_Amount) AS Total_Order_Amount
FROM LenskartOrder O
GROUP BY O.Order_Status
ORDER BY O.Order_Status;

5.5 Customer, Order, and Payment Report

SELECT
    C.Customer_Name,
    O.Order_ID,
    O.Total_Amount,
    O.Order_Status,
    PM.Payment_Method,
    PM.Payment_Amount,
    PM.Payment_Status
FROM LenskartCustomer C
INNER JOIN LenskartOrder O
    ON C.Customer_ID = O.Customer_ID
LEFT JOIN LenskartPayment PM
    ON O.Order_ID = PM.Order_ID
ORDER BY O.Order_ID;
