CREATE TABLE Category (
      Category_ID NUMBER PRIMARY KEY,
      Category_Name VARCHAR2(50) NOT NULL UNIQUE
  );
INSERT INTO Category (Category_ID, Category_Name) VALUES (1, 'Eyeglasses');
INSERT INTO Category (Category_ID, Category_Name) VALUES (2, 'Sunglasses');
INSERT INTO Category (Category_ID, Category_Name) VALUES (3, 'Contact Lenses');
INSERT INTO Category (Category_ID, Category_Name) VALUES (4, 'Kids Eyewear');
SELECT
       c.Category_Name,
       p.Product_ID,
       p.Product_Name,
       p.Brand,
       p.Price,
       p.Stock
    FROM Category c
    JOIN Product p
   ON c.Category_ID = p.Category_ID
   ORDER BY c.Category_Name;