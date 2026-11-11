ADVANCED SQL QUERY IMPLEMENTATION

TASK 1: IMPLEMENT SUBQUERIES AND NESTED QUERIES

--- 1.1 Products with Price Greater Than 1500

SELECT Product_ID, Product_Name, Price
FROM LenskartProduct
WHERE Price > (SELECT 1500 FROM DUAL);

-- 1.2 Customers Who Have Placed Orders

SELECT Customer_ID, Customer_Name
FROM LenskartCustomer
WHERE Customer_ID IN
      (SELECT Customer_ID FROM LenskartOrder);

TASK 2: FIND PRODUCTS ABOVE AVERAGE PRICE

SELECT Product_ID, Product_Name, Brand, Price
FROM LenskartProduct
WHERE Price > (SELECT AVG(Price) FROM LenskartProduct)
ORDER BY Price DESC;

3: IDENTIFY CUSTOMERS WITH MAXIMUM PURCHASES

SELECT C.Customer_ID,
       C.Customer_Name,
       SUM(O.Total_Amount) AS Total_Purchase
FROM LenskartCustomer C
JOIN LenskartOrder O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
HAVING SUM(O.Total_Amount) =
       (SELECT MAX(Total_Purchase)
        FROM
        (SELECT SUM(Total_Amount) AS Total_Purchase
         FROM LenskartOrder
         GROUP BY Customer_ID))
ORDER BY Total_Purchase DESC;

TASK 4: GENERATE COMPLEX BUSINESS QUERIES

-- 4.1 Customers Who Purchased Above Average Order Amount

SELECT C.Customer_ID,
       C.Customer_Name,
       O.Order_ID,
       O.Total_Amount
FROM LenskartCustomer C
JOIN LenskartOrder O
ON C.Customer_ID = O.Customer_ID
WHERE O.Total_Amount >
      (SELECT AVG(Total_Amount)
       FROM LenskartOrder)
ORDER BY O.Total_Amount DESC;

-- 4.2 Products Sold in Orders Above Average Order Value

SELECT DISTINCT P.Product_ID,
       P.Product_Name,
       P.Price
FROM LenskartProduct P
JOIN LenskartOrderItem OI
ON P.Product_ID = OI.Product_ID
WHERE OI.Order_ID IN
      (SELECT Order_ID
       FROM LenskartOrder
       WHERE Total_Amount >
             (SELECT AVG(Total_Amount)
              FROM LenskartOrder));

-- 4.3 Products with Sales Quantity Greater Than Average

SELECT P.Product_ID,
       P.Product_Name,
       SUM(OI.Quantity) AS Total_Quantity_Sold
FROM LenskartProduct P
JOIN LenskartOrderItem OI
ON P.Product_ID = OI.Product_ID
GROUP BY P.Product_ID, P.Product_Name
HAVING SUM(OI.Quantity) >
       (SELECT AVG(Quantity)
        FROM LenskartOrderItem)
ORDER BY Total_Quantity_Sold DESC;

TASK 5: PREPARE AN ADVANCED SQL REPORT

SELECT C.Customer_ID,
       C.Customer_Name,
       COUNT(O.Order_ID) AS Total_Orders,
       SUM(O.Total_Amount) AS Total_Purchase,
       ROUND(AVG(O.Total_Amount), 2) AS Average_Order_Amount,
       MAX(O.Total_Amount) AS Highest_Order
FROM LenskartCustomer C
JOIN LenskartOrder O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
HAVING SUM(O.Total_Amount) >=
       (SELECT AVG(Total_Amount)
        FROM LenskartOrder)
ORDER BY Total_Purchase DESC;

