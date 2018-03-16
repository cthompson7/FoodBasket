/* Database created by Christian Thompson, Vijay Friedman, and Oliver Hanson */

CREATE DATABASE FoodBasket;
GO

USE FoodBasket;
GO

-- Create the tables
CREATE TABLE Customers(
CustomerID bigint NOT NULL PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
PhoneNumber varchar(50) NOT NULL,
EmailAddress varchar(50) NOT NULL);

CREATE TABLE CustomerOrders(
OrderID bigint NOT NULL PRIMARY KEY,
CustomerID bigint NOT NULL,
TotalAmount decimal(6,2) NOT NULL);

CREATE TABLE OrderLineItems(
OrderLineID bigint NOT NULL PRIMARY KEY,
OrderID bigint NOT NULL,
ProductID bigint NOT NULL,
OrderQuantity int NOT NULL,
LineTotal decimal(6,2) NOT NULL);

CREATE TABLE Products(
ProductID bigint NOT NULL PRIMARY KEY,
Name varchar(50) NOT NULL,
SupplierID bigint NOT NULL,
InStock varchar(20) NOT NULL,
UnitPrice decimal(6,2) NOT NULL);

CREATE TABLE Suppliers(
SupplierID bigint NOT NULL PRIMARY KEY,
Name varchar(50) NOT NULL);

-- Create the relationship: the first FK in CustomerOrders
ALTER TABLE CustomerOrders ADD CONSTRAINT FK_CustomerOrders_Customers
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
GO

-- Create the relationship: the first FK in OrderLineItems
ALTER TABLE OrderLineItems ADD CONSTRAINT FK_OrderLineItems_CustomerOrders
FOREIGN KEY (OrderID) REFERENCES CustomerOrders(OrderID);
GO

-- Create the relationship: the second FK in OrderLineItems
ALTER TABLE OrderLineItems ADD CONSTRAINT FK_OrderLineItems_Products
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
GO

-- Create the relationship: the first FK in Products
ALTER TABLE Products ADD CONSTRAINT FK_Products_Suppliers
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);
GO

INSERT INTO Customers(CustomerID, FirstName, LastName, PhoneNumber, EmailAddress) VALUES
(1, 'Angel', 'Jensen', '365-934-9771', 'ajensen@gmail.com'),
(2, 'Henry', 'Perry', '690-305-6817', 'hperry@gmail.com'),
(3, 'Dianne', 'Ellis', '422-778-8314', 'dellis@hotmail.com'),
(4, 'Patsy', 'Peters', '621-739-1984', 'ppeters@aol.com'),
(5, 'Benny', 'Padilla', '555-996-2863', 'bpadilla@aol.com'),
(6, 'Elbert', 'Andrews', '173-453-1161', 'eandrews@yahoo.com'),
(7, 'Emilio', 'Clark', '759-488-0210', 'eclark@yahoo.com'),
(8, 'Audrey', 'Day', '996-799-7305', 'aday@yahoo.com'),
(9, 'Byron', 'Webb', '113-323-2091', 'bwebb@gmail.com'),
(10, 'Ramona', 'Santiago', '527-278-2259', 'rsantiago@hotmail.com');

INSERT INTO CustomerOrders(OrderID, CustomerID, TotalAmount) VALUES
(1, 1, 8.58),
(2, 1, 9.34),
(3, 10, 17.94),
(4, 5, 28.86),
(5, 6, 56.43),
(6, 7, 15.15),
(7, 4, 39.47),
(8, 5, 10.66),
(9, 4, 4.92),
(10, 3, 11.30),
(11, 3, 17.97),
(12, 3, 11.37),
(13, 9, 30.44),
(14, 2, 23.92),
(15, 8, 6.04);

INSERT INTO Suppliers(SupplierID, Name) VALUES
(1, 'McLane Company Inc.'),
(2, 'Core-Mark Inc.'),
(3, 'Eby-Brown Company'),
(4, 'H.T. Hackney Company'),
(5, 'GSC Enterprises Inc.'),
(6, 'Farner Booken Company'),
(7, 'Arucon Distributing Company'),
(8, 'Liberty USA Inc.'),
(9, 'Garber Bros. Inc.'),
(10, 'Atlantic Dominion Distributors'),
(11, 'Pillsbury Company'),
(12, 'Pinnacle Foods Corp.');

INSERT INTO Products(ProductID, Name, SupplierID, InStock, UnitPrice) VALUES
(1, 'Mountain Dew 12-Pack', 1, 'Y', 3.79),
(2, 'Coca-Cola 12-Pack', 1, 'Y', 4.68),
(3, 'Frozen Chicken Breasts', 2, 'Y', 4.92),
(4, 'Avocado', 3, 'Y', 1.58),
(5, 'Banana', 4, 'Y', 0.56),
(6, 'Apple', 4, 'Y', 0.50),
(7, 'Pound of Ribeye Steak', 2, 'Y', 11.99),
(8, 'Frosted Flakes', 5, 'Y', 4.58),
(9, 'Whole Milk', 6, 'Y', 2.99),
(10, 'Orange Juice', 6, 'Y', 2.49),
(11, 'Brussel Sprout', 7, 'Y', 0.89),
(12, 'Chocolate Cake', 8, 'Y', 9.89),
(13, 'Cheez-Its', 9, 'Y', 2.99),
(14, 'Welchs Fruit Snacks', 10, 'Y', 5.98),
(15, 'Nature Valley Granola Bars', 8, 'Y', 3.78);

INSERT INTO OrderLineItems(OrderLineID, OrderID, ProductID, OrderQuantity, LineTotal) VALUES
(1, 1, 2, 1, 4.68),
(2, 1, 5, 2, 1.12),
(3, 1, 6, 2, 1.00),
(4, 1, 11, 2, 1.78),
(5, 2, 11, 4, 3.56),
(6, 2, 6, 4, 2.00),
(7, 2, 15, 1, 3.78),
(8, 3, 14, 3, 17.94),
(9, 4, 3, 2, 9.84),
(10, 4, 10, 2, 4.98),
(11, 4, 2, 3, 14.04),
(12, 5, 14, 2, 11.96),
(13, 5, 7, 2, 23.98),
(14, 5, 1, 1, 3.79),
(15, 5, 15, 4, 15.12),
(16, 5, 4, 1, 1.58),
(17, 6, 15, 1, 3.78),
(18, 6, 1, 3, 11.37),
(19, 7, 4, 3, 4.74),
(20, 7, 9, 4, 11.96),
(21, 7, 10, 2, 4.98),
(22, 7, 11, 3, 2.67),
(23, 7, 15, 4, 15.12),
(24, 8, 2, 1, 4.68),
(25, 8, 9, 2, 5.98),
(26, 9, 3, 1, 4.92),
(27, 10, 4, 1, 1.58),
(28, 10, 5, 4, 2.24),
(29, 10, 9, 2, 5.98),
(30, 10, 6, 3, 1.50),
(31, 11, 7, 1, 11.99),
(32, 11, 9, 2, 5.98),
(33, 12, 1, 3, 11.37),
(34, 13, 2, 2, 9.36),
(35, 13, 3, 3, 14.76),
(36, 13, 4, 4, 6.32),
(37, 14, 14, 4, 23.92),
(38, 15, 6, 1, 0.50),
(39, 15, 5, 1, 0.56),
(40, 15, 10, 2, 4.98);