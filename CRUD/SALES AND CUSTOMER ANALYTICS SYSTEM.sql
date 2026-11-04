# SALES AND CUSTOMER ANALYTICS SYSTEM

##TASK 1: APPLY AGGREGATE FUNCTIONS

--1.1 COUNT() – Total Number of Orders

SELECT COUNT(*) AS Total_Orders
FROM LenskartOrder;

--1.2 SUM() – Total Sales Amount

SELECT SUM(Total_Amount) AS Total_Sales
FROM LenskartOrder;

--1.3 AVG() – Average Order Amount

SELECT AVG(Total_Amount) AS Average_Order_Amount
FROM LenskartOrder;

--1.4 MIN() – Minimum Order Amount

SELECT MIN(Total_Amount) AS Minimum_Order_Amount
FROM LenskartOrder;

--1.5 MAX() – Maximum Order Amount

SELECT MAX(Total_Amount) AS Maximum_Order_Amount
FROM LenskartOrder;

##TASK 2: GENERATE TOTAL SALES REPORTS

--2.1 Total Sales Report

SELECT
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Amount) AS Total_Sales,
    AVG(Total_Amount) AS Average_Sales
FROM LenskartOrder;

--2.2 Sales Report by Order Status

SELECT
    Order_Status,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Amount) AS Total_Sales
FROM LenskartOrder
GROUP BY Order_Status
ORDER BY Total_Sales DESC;

##TASK 3: FIND TOP CUSTOMERS BASED ON PURCHASE AMOUNT

SELECT
    C.Customer_ID,
    C.Customer_Name,
    SUM(O.Total_Amount) AS Total_Purchase_Amount
FROM LenskartCustomer C
INNER JOIN LenskartOrder O
    ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Total_Purchase_Amount DESC;

 ##TASK 4: IDENTIFY BEST-SELLING PRODUCTS

SELECT
    P.Product_ID,
    P.Product_Name,
    SUM(OI.Quantity) AS Total_Quantity_Sold,
    SUM(OI.Quantity * OI.Price) AS Total_Sales
FROM LenskartProduct P
INNER JOIN LenskartOrderItem OI
    ON P.Product_ID = OI.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Total_Quantity_Sold DESC;

##TASK 5: PERFORM CATEGORY-WISE SALES ANALYSIS

SELECT
    P.Category,
    SUM(OI.Quantity) AS Total_Quantity_Sold,
    SUM(OI.Quantity * OI.Price) AS Category_Sales,
    AVG(OI.Price) AS Average_Product_Price
FROM LenskartProduct P
INNER JOIN LenskartOrderItem OI
    ON P.Product_ID = OI.Product_ID
GROUP BY P.Category
ORDER BY Category_Sales DESC;
