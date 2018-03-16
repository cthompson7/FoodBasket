/* FoodBasket Project: By Christian Thompson, Vijay Friedman, and Oliver Hanson */

USE FoodBasket; /*Set current database*/

/* Displays all of the records from the Customers table */
SELECT *
FROM Customers

/* Displays all of the records from the CustomerOrders table */
SELECT *
FROM CustomerOrders

/* Displays all of the records from the Products table */
SELECT *
FROM Products

/* Displays all of the records from the Suppliers table */
SELECT *
FROM Suppliers

/* Displays all of the records from the OrderLineItems table */
SELECT *
FROM OrderLineItems

/* This query displays the names of the products at Food Basket and the total quantity of each product sold to the customers 
who shopped at FoodBasket. The query is sorted in descending order based on the total quantity of each product sold and then
alphabetically based on product name. */
SELECT P.Name, SUM(OLI.OrderQuantity) as QuantitySold
FROM OrderLineItems as OLI INNER JOIN Products as P ON 
OLI.ProductID = P.ProductID
GROUP BY P.Name
Order BY SUM(OLI.OrderQuantity) DESC, P.Name ASC;

/* This query displays the first name, last name, and the total number of orders each customer has placed at Food Basket. 
The query is sorted in descending order based on the total number of orders placed and then sorted alphabetically by 
customer last name. */
SELECT  C.FirstName, C.LastName, COUNT(CO.OrderID) as TotalNumberOfOrders
FROM CustomerOrders as CO INNER JOIN Customers as C ON
C.CustomerID = CO.CustomerID
GROUP BY C.FirstName, C.LastName
ORDER BY COUNT(CO.OrderID) DESC, C.LastName ASC;

/* This query displays all of the suppliers of Food Basket, regardless of whether they currently supply products to the 
store. We used a right outer join because it allowed us to preserve the unmatched rows from the InStock column. Since
Pillsbury Company and Pinnacle Foods Corp. did not supply products in FoodBasket, the right outer join helped us see their 
NULL values. */
SELECT S.Name, P.InStock
FROM Products as P RIGHT OUTER JOIN Suppliers as S ON
P.SupplierID = S.SupplierID;

/* This query reports the Order ID of those orders where the total due is greater than the average of the total dues of 
all the orders. */
SELECT OrderID, TotalAmount FROM CustomerOrders WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM CustomerOrders);