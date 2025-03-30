CREATE DATABASE QLBH;
USE QLBH;
GO

-- Tạo bảng Suppliers 
CREATE TABLE Suppliers 
(
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(100) NOT NULL,
    ContactName NVARCHAR(50),
    Address NVARCHAR(100),
    City NVARCHAR(50),
    Region NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    Phone NVARCHAR(20),
    Fax NVARCHAR(20),
    Email NVARCHAR(100)
);
GO
INSERT INTO Suppliers (SupplierName, ContactName, Address, City, Region, PostalCode, Country, Phone, Fax, Email)
VALUES 
('Supplier A', 'John Doe', '123 Main St', 'New York', 'NY', '10001', 'USA', '123-456-7890', '123-456-7891', 'john@example.com'),
('Supplier B', 'Jane Smith', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA', '987-654-3210', '987-654-3211', 'jane@example.com');
GO 
-- Tạo bảng Products 
CREATE TABLE Products 
(
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    SupplierID INT,
    CategoryID INT,
    UnitPrice MONEY DEFAULT 0,
    UnitsInStock INT DEFAULT 0,
    UnitsOnOrder INT DEFAULT 0,
    ReorderLevel INT DEFAULT 0,
    Discontinued BIT DEFAULT 0,
    Description NVARCHAR(MAX),
    CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
GO
INSERT INTO Products (ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, Description)
VALUES 
	('Product 1', 1, NULL, 12.50, 100, 0, 10, 0, 'Description for Product 1'),
	('Product 2', 1, NULL, 15.00, 50, 0, 5, 0, 'Description for Product 2'),
	('Product 3', 2, NULL, 8.00, 200, 0, 20, 0, 'Description for Product 3'),
	('Product 4', 2, NULL, 20.00, 0, 0, 0, 1, 'Description for Product 4'),
INSERT INTO Products (ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, Description)
VALUES 
('Product A', 1, 1, 10.00, 100, 50, 10, 0, 'Description for Product A'),
('Product B', 1, 2, 15.00, 200, 30, 20, 0, 'Description for Product B'),
('Product C', 2, 1, 20.00, 150, 25, 15, 0, 'Description for Product C'),
('Product D', 2, 2, 25.00, 80, 10, 5, 0, 'Description for Product D');
GO 

-- Tạo bảng Customers 
CREATE TABLE Customers (
    CustomerID NCHAR(5) PRIMARY KEY,
    CompanyName NVARCHAR(100) NOT NULL,
    ContactName NVARCHAR(50),
    ContactTitle NVARCHAR(50),
    Address NVARCHAR(100),
    City NVARCHAR(50),
    Region NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    Phone NVARCHAR(20),
    Fax NVARCHAR(20),
    Email NVARCHAR(100)
);

GO
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, Email)
VALUES 
	('C001', 'Company A', 'Alice Johnson', 'Manager', '789 Pine St', 'London', NULL, 'E1 6AN', 'UK', '020-1234-5678', NULL, 'alice@example.com'),
	('C002', 'Company B', 'Bob Brown', 'Director', '321 Oak St', 'Boise', NULL, '83701', 'USA', '208-987-6543', '208-987-6544', 'bob@example.com'), 
	('C003', 'Company C', 'Charlie Green', 'Sales Associate', '123 Cherry St', 'Paris', NULL, '75001', 'France', '01-23-45-67-89', NULL, 'charlie@example.com'),
	('C004', 'Company D', 'Diana Prince', 'Marketing Manager', '456 Maple Ave', 'Lyon', NULL, '69001', 'France', '04-56-78-90-12', '04-56-78-90-13', 'diana@example.com'),
	('C005', 'Company E', 'Ethan Hunt', 'Director', '789 Oak St', 'Boise', NULL, '83702', 'USA', '208-555-1234', NULL, 'ethan@example.com'),
	('C006', 'Company F', 'Fiona Apple', 'CEO', '321 Pine St', 'London', NULL, 'E1 6AN', 'UK', '020-555-5678', '020-555-5679', 'fiona@example.com'),
	('C007', 'Company G', 'George Clooney', 'Actor', '654 Elm St', 'New York', NULL, '10001', 'USA', '212-555-9876', NULL, 'george@example.com'), 
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, Email)
VALUES 	
	('C008', 'Company V', 'Alice Johnson', 'Manager', '123 Main St', 'New York', NULL, '10001', 'USA', '212-555-1234', NULL, 'alice@example.com'),
	('C009', 'Company H', 'Bob Brown', 'Director', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA', '310-555-5678', '310-555-5679', 'bob@example.com'),
	('C0010', 'Company K', 'Charlie Green', 'Sales Associate', '789 Pine St', 'Paris', NULL, '75001', 'France', '01-23-45-67-89', NULL, 'charlie@example.com'),
	('C0011', 'Company L', 'Diana Prince', 'Marketing Manager', '321 Oak St', 'Lyon', NULL, '69001', 'France', '04-56-78-90-12', '04-56-78-90-13', 'diana@example.com');
GO 
CREATE TABLE Employees 
(
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Address NVARCHAR(100),
    City NVARCHAR(50),
    Region NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    HomePhone NVARCHAR(20),
    Extension NVARCHAR(10),
    Notes NVARCHAR(MAX),
    ReportsTo INT,
    CONSTRAINT FK_Employees_Employees FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);
GO
INSERT INTO Employees (LastName, FirstName, Title, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Notes, ReportsTo)
VALUES 
('Johnson', 'Alice', 'Sales Representative', '1985-05-15', '2020-01-10', '123 Main St', 'New York', NULL, '10001', 'USA', '212-555-1234', '101', NULL, NULL),
('Smith', 'Bob', 'Sales Manager', '1980-03-20', '2019-06-15', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA', '310-555-5678', '102', NULL, NULL),
('Brown', 'Charlie', 'Marketing Specialist', '1990-07-30', '2021-03-01', '789 Oak St', 'Chicago', NULL, '60601', 'USA', '312-555-8765', '103', NULL, 1),
('Davis', 'Diana', 'HR Manager', '1975-11-25', '2018-05-20', '321 Pine St', 'Houston', NULL, '77001', 'USA', '713-555-4321', '104', NULL, NULL);
GO

--- tạo bảng Oders 
CREATE TABLE Orders 
(
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID NCHAR(5),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight MONEY DEFAULT 0,
    ShipName NVARCHAR(100),
    ShipAddress NVARCHAR(100),
    ShipCity NVARCHAR(50),
    ShipRegion NVARCHAR(50),
    ShipPostalCode NVARCHAR(20),
    ShipCountry NVARCHAR(50),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES 
('C001', 1, '1997-01-15', '1997-07-20', NULL, 1, 5.00, 'Alice Johnson', '123 Main St', 'New York', NULL, '10001', 'USA'),
('C002', 2, '1997-07-10', '1997-07-15', NULL, 2, 10.00, 'Bob Brown', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA'),
('C003', 1, '1997-08-01', '1997-08-05', NULL, 1, 7.50, 'Charlie Green', '789 Pine St', 'Paris', NULL, '75001', 'France'),
('C004', 2, '1997-01-25', '1997-07-30', NULL, 2, 12.00, 'Diana Prince', '321 Oak St', 'Lyon', NULL, '69001', 'France'),
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES 
('C006', 1, '1997-07-15', '1997-07-20', NULL, 1, 5.00, 'Alice Johnson', '123 Main St', 'New York', NULL, '10001', 'USA'),
('C007', 2, '1997-07-10', '1997-07-15', NULL, 2, 10.00, 'Bob Brown', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA'),
('C008', 1, '1997-08-01', '1997-08-05', NULL, 1, 7.50, 'Charlie Green', '789 Pine St', 'Paris', NULL, '75001', 'France'),
('C009', 2, '1997-07-25', '1997-07-30', NULL, 2, 12.00, 'Diana Prince', '321 Oak St', 'Lyon', NULL, '69001', 'France');
GO
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES 
('C001', 1, '1996-07-15', '1996-07-20', '1996-07-16', 1, 5.00, 'Alice Johnson', '123 Main St', 'New York', NULL, '10001', 'USA');
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES 
('C001', 1, '1997-07-01', '1997-07-05', NULL, 1, 5.00, 'Alice Johnson', '123 Main St', 'New York', NULL, '10001', 'USA'),
('C002', 1, '1997-07-02', '1997-07-06', NULL, 1, 10.00, 'Bob Brown', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA'),
('C003', 2, '1997-07-03', '1997-07-07', NULL, 2, 7.50, 'Charlie Green', '789 Pine St', 'Paris', NULL, '75001', 'France'),
('C004', 2, '1997-07-04', '1997-07-08', NULL, 2, 12.00, 'Diana Prince', '321 Oak St', 'Lyon', NULL, '69001', 'France');
Go 
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES 
('C001', 1, '2023-10-01', '2023-10-05', NULL, 1, 5.00, 'Alice Johnson', '123 Main St', 'Madrid', NULL, '28001', 'Spain');
Go
---- Tạo bảng Order_Details 
CREATE TABLE Order_Details 
(
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    UnitPrice MONEY NOT NULL DEFAULT 0,
    Quantity INT NOT NULL DEFAULT 1,
    Discount FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Order_Details PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT FK_Order_Details_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_Order_Details_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
INSERT INTO Order_Details (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES 
(1, 1, 12.50, 2, 0),  -- OrderID 1, ProductID 1
(1, 2, 15.00, 1, 0),  -- OrderID 1, ProductID 2
(2, 3, 8.00, 5, 0),   -- OrderID 2, ProductID 3
(3, 1, 12.50, 3, 0),  -- OrderID 3, ProductID 1
(4, 2, 15.00, 2, 0);  -- OrderID 4, ProductID 2

INSERT INTO Order_Details (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES 
(5, 1, 12.50, 2, 0),  -- OrderID 5, ProductID 1
(5, 2, 15.00, 1, 0),  -- OrderID 5, ProductID 2
(6, 1, 12.50, 1, 0),  -- OrderID 6, ProductID 1
(6, 3, 8.00, 3, 0),   -- OrderID 6, ProductID 3
(7, 2, 15.00, 2, 0),  -- OrderID 7, ProductID 2
(7, 4, 20.00, 1, 0);  -- OrderID 7, ProductID 4
GO

------------------------ TUẦN 5 ---------------------------------------------------
--- Câu 1 (Tuần 5)
Select *
from Products 
--- Câu 2
Select CustomerID,CompanyName,City,Phone
from Customers 
--- Câu 3
Select ProductId, ProductName, UnitPrice
from Products
--- Câu 4
Select
    EmployeeID, 
    LastName + ' ' + FirstName AS 'EmployeeName' , 
    HomePhone AS 'Phone' , 
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
from Employees
--- Câu 5
Select  CustomerID, CompanyName, ContactName, ContactTitle 
from Customers 
where ContactTitle LIKE 'O%';
--- Câu 6
Select  CustomerID, CompanyName, City
from Customers 
where City IN  ('LonDon', 'Boise', 'Paris')
--- Câu 7
Select  CustomerID, CompanyName, City
from Customers 
where CompanyName LIKE 'V%' AND City = 'Lyon'
--- Câu 8
Select CustomerID, CompanyName, Fax 
from Customers 
where Fax IS NULL OR Fax = ''
--- Câu 9
Select CustomerID, CompanyName, Fax 
from Customers 
where Fax IS NOT NULL OR Fax <> '';
--- Câu 10
Select ProductID, ProductName, UnitPrice
from Products 
where UnitPrice LIKE ' %Boxes% ';
--- Câu 11
Select ProductID, ProductName, UnitPrice
from Products 
where UnitPrice > 10 and UnitPrice < 15;
--- Câu 12
Select OrderID, CustomerID, OrderDate
from Orders 
where OrderDate >= '1996-09-01' AND OrderDate < '1996-10-01' 
ORDER BY CustomerID, OrderDate DESC;
---- Câu 13
Select OrderID, CustomerID, OrderDate 
from Orders 
where OrderDate >= '1996-09-01' AND OrderDate < '1996-10-01' 
ORDER BY CustomerID, OrderDate DESC;
--- Câu 14
SELECT OrderID, OrderDate, CustomerID, EmployeeID 
FROM Orders 
WHERE OrderDate >= '1997-10-01' AND OrderDate < '1998-01-01' 
ORDER BY MONTH(OrderDate);
--- Câu 15
SELECT OrderID, OrderDate, CustomerID, EmployeeID,
    DATEPART(WEEKDAY, OrderDate) AS WeekDayOfOrderDate 
FROM Orders 
WHERE OrderDate >= '1997-12-01' AND OrderDate < '1998-01-01' 
    AND (DATEPART(WEEKDAY, OrderDate) = 7 OR DATEPART(WEEKDAY, OrderDate) = 1); 
--- Câu 16
SELECT ProductID, ProductName, UnitPrice, (UnitsInStock * UnitPrice) AS TotalAccount 
FROM Products 
ORDER BY TotalAccount DESC;
--- Câu 17
SELECT TOP 5 CustomerID, CompanyName, City 
FROM Customers 
WHERE City LIKE 'M%';
--- Câu 18
SELECT TOP 2 EmployeeID, LastName + ' ' + FirstName AS EmployeeName, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age 
FROM Employees 
ORDER BY BirthDate ASC; 
--- Câu 19
SELECT ProductID, ProductName, UnitsInStock 
FROM Products 
WHERE UnitsInStock < 5;
--- Câu 20
SELECT od.OrderID, od.ProductID, od.Quantity, od.UnitPrice, od.Discount, (od.Quantity * od.UnitPrice - 0.2 * od.Discount) AS Total 
FROM Order_Details od;

----------------TUẦN 6-----------------------------------------------
---- Câu 1
SELECT c.CustomerID, c.CompanyName, c.Address, o.OrderID, o.OrderDate 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '1997-07-01' AND o.OrderDate < '1997-08-01'
ORDER BY c.CustomerID, o.OrderDate DESC;

--- Câu 2
SELECT c.CustomerID, c.CompanyName, c.Address, o.OrderID, o.OrderDate 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '1997-07-01' AND o.OrderDate < '1997-07-30'
ORDER BY c.CustomerID, o.OrderDate;

--- Câu 3
SELECT p.ProductID, p.ProductName,
    SUM(od.Quantity) AS CountOfOrders  
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName  
ORDER BY CountOfOrders DESC;  

--- Câu 4
SELECT c.CustomerID, c.CompanyName,
    COUNT(o.OrderID) AS CountOfOrder
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY CountOfOrder DESC;

---- Câu 5
SELECT e.EmployeeID, e.FirstName, e.LastName,
    COUNT(o.OrderID) AS CountOfOrders,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalAmount
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
LEFT JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY CountOfOrders DESC;

--- Câu 6
SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
FORMAT(o.OrderDate, 'yyyy-MM') AS Month_Salary,
SUM(od.Quantity * od.UnitPrice) * 0.10 AS Salary
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1996
GROUP BY e.EmployeeID, e.FirstName, e.LastName, FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY 
    Month_Salary, Salary DESC;

--- Câu 7
SELECT c.CustomerID, c.CompanyName, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= '1996-01-01' AND o.OrderDate <= '1998-01-01'  
GROUP BY c.CustomerID, c.CompanyName
HAVING SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) > 2.0  
ORDER BY TotalAmount DESC;  

---- Câu 8
SELECT 
    c.CustomerID,
    c.CompanyName,
    COUNT(o.OrderID) AS TotalOrders,  
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalAmount  
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= '1996-12-31' AND o.OrderDate <= '1998-01-01' 
GROUP BY c.CustomerID, c.CompanyName
HAVING SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) > 2.0  
ORDER BY c.CustomerID, TotalAmount DESC;  

---- Câu 9 
SELECT p.CategoryID,
    COUNT(*) AS Total_UnitsInStock,  
    AVG(p.UnitPrice) AS Average_UnitPrice  
FROM Products p
GROUP BY p.CategoryID
HAVING SUM(p.UnitsInStock) > 300 AND AVG(p.UnitPrice) < 25  
ORDER BY p.CategoryID;  

--- Câu 10
SELECT p.CategoryID,
    COUNT(p.ProductID) AS TotalOfProducts  
FROM Products p
GROUP BY p.CategoryID
HAVING COUNT(p.ProductID) < 10 
ORDER BY p.CategoryID;  
--- Câu 11
SELECT p.ProductID, p.ProductName,
    SUM(od.Quantity) AS SumofQuantity 
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= '1996-01-01' AND o.OrderDate <= '1998-03-31' 
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity) > 2  
ORDER BY p.ProductID;

--- Câu 12
SELECT c.CustomerID, c.CompanyName,
    FORMAT(o.OrderDate, 'yyyy-MM') AS Month_Year,
    SUM(od.UnitPrice * od.Quantity) AS Total 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, FORMAT(o.OrderDate, 'yyyy-MM')  
ORDER BY c.CustomerID, Month_Year;

---- Câu 13
SELECT e.EmployeeID, e.FirstName,e.LastName,
    COALESCE(SUM(od.UnitPrice * od.Quantity), 0) AS TotalSales
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID 
	AND MONTH(o.OrderDate) = 7 AND YEAR(o.OrderDate) = 1997
LEFT JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC;  

---- Câu 14
SELECT c.CustomerID, c.CompanyName,
    COUNT(o.OrderID) AS TotalOrders 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 1996 
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalOrders DESC  
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;  

--- Câu 15
SELECT e.EmployeeID, e.LastName, e.FirstName,
    COUNT(o.OrderID) AS CountOfOrderID,  
    SUM(od.UnitPrice * od.Quantity) AS SumOfTotal 
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= '1997-01-01' AND o.OrderDate < '1997-12-01' 
GROUP BY e.EmployeeID, e.LastName, e.FirstName
HAVING SUM(od.UnitPrice * od.Quantity) > 4  
ORDER BY e.EmployeeID;



------------------------- TUẦN 7-----------------------
--- Câu 1
SELECT o.OrderID, o.OrderDate,
    SUM(od.Quantity * od.UnitPrice) AS TotalAccount
FROM Orders o
JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.OrderDate
ORDER BY o.OrderID;





--- Câu 2
SELECT 
    o.OrderID,
    o.OrderDate,
    SUM(od.Quantity * od.UnitPrice) AS TotalAccount
FROM Orders o
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.ShipCity = 'Madrid'
GROUP BY o.OrderID, o.OrderDate, o.ShipCity,o.ShipCountry
ORDER BY o.OrderID;




--- Câu 3
SELECT TOP 1
    p.ProductID, p.ProductName,
    SUM(od.Quantity) AS CountOfOrders
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY CountOfOrders DESC



--- Câu 4
SELECT c.CustomerID, c.CompanyName,
    COUNT(o.OrderID) AS CountOfOrder
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY c.CustomerID;
--- Câu 5
SELECT e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    COUNT(o.OrderID) AS CountOfOrder,
    SUM(od.Quantity * od.UnitPrice) AS TotalOrderValue 
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
LEFT JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY e.EmployeeID;
--- Câu 6 (SỬA ĐỀ LƯƠNG THÁNG CỦA CÁC NĂM 1996,1997,1998)
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    MONTH(o.OrderDate) AS Month_Salary,
    SUM(od.Quantity * od.UnitPrice) * 0.10 AS Salary
FROM 
    Employees e
JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
JOIN 
    Order_Details od ON o.OrderID = od.OrderID
WHERE 
    YEAR(o.OrderDate) IN (1996,1997,1998)

GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName, MONTH(o.OrderDate)
ORDER BY 
    Month_Salary, Salary DESC;

--- Câu 7
SELECT c.CustomerID, c.CompanyName,
    SUM(od.Quantity * od.UnitPrice) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-01-01' AND '1998-01-01' 
GROUP BY c.CustomerID, c.CompanyName
HAVING SUM(od.Quantity * od.UnitPrice) > 20  
ORDER BY TotalAmount DESC

--- Câu 8
SELECT c.CustomerID,
	COUNT(o.OrderID) AS TotalOrders,
	SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-12-31' AND '1998-01-01'
GROUP BY c.CustomerID
HAVING SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) > 20
ORDER BY c.CustomerID, TotalAmount DESC;

--- Câu 9: 
SELECT p.CategoryID,
    COUNT(p.ProductID) AS Total_Products,
    SUM(p.UnitsInStock) AS Total_UnitsInStock,
    AVG(p.UnitPrice) AS Average_UnitPrice
FROM Products p
GROUP BY p.CategoryID
HAVING SUM(p.UnitsInStock) > 300 AND AVG(p.UnitPrice) < 25; 

--- Câu 10
SELECT p.CategoryID,
    COUNT(p.ProductID) AS TotalOfProducts
FROM Products p 
GROUP BY p.CategoryID
HAVING COUNT(p.ProductID) < 10 
ORDER BY TotalOfProducts DESC;

--- câu 11
SELECT od.ProductID, p.ProductName, 
    SUM(od.Quantity) AS SumofQuantity
FROM Order_Details od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate >= '1995-01-01' AND o.OrderDate < '1997-10-01'
GROUP BY od.ProductID, p.ProductName
HAVING SUM(od.Quantity) > 0;

---- Câu 12
SELECT c.CustomerID, c.CompanyName, 
    FORMAT(o.OrderDate, 'yyyy-MM') AS Month_Year, 
    SUM(od.UnitPrice * od.Quantity) AS Total
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, 
    FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY c.CustomerID, Month_Year;

--- Câu 13
SELECT TOP 1 e.EmployeeID, e.FirstName, e.LastName, 
    SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= '1996-09-01' AND o.OrderDate < '1996-10-01'
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC

--- Câu 14
SELECT top 3 c.CustomerID, c.CompanyName, 
    COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '1996-01-01' 
AND o.OrderDate < '1997-01-01'  
GROUP BY c.CustomerID, c.CompanyName
ORDER BY NumberOfOrders DESC
---- Câu 15
SELECT e.EmployeeID, e.LastName, e.FirstName, 
    COUNT(o.OrderID) AS countofOrderID, 
    SUM(od.UnitPrice * od.Quantity) AS sumoftotal
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= '1996-09-01' AND o.OrderDate < '1996-10-01'  
GROUP BY e.EmployeeID, e.LastName, e.FirstName
HAVING SUM(od.UnitPrice * od.Quantity) > 40
ORDER BY sumoftotal DESC;

-----------------------------TUẦN 8---------------------------------------------
----Câu 1
SELECT p.ProductID, p.ProductName, od.UnitPrice
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
WHERE od.UnitPrice > (SELECT AVG(UnitPrice) FROM Order_Details)
GROUP BY p.ProductID, p.ProductName, od.UnitPrice;
--- Câu 2
SELECT p.ProductID, p.ProductName, od.UnitPrice
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
WHERE od.UnitPrice > (
		
		SELECT AVG(od2.UnitPrice)
        FROM Products p2
        JOIN Order_Details od2 ON p2.ProductID = od2.ProductID
        WHERE p2.ProductName LIKE 'P%')
GROUP BY p.ProductID, p.ProductName, od.UnitPrice;

--- Câu 3
SELECT p1.ProductID, p1.ProductName, p1.UnitPrice
FROM Products p1
WHERE p1.ProductName LIKE 'P%' AND p1.UnitPrice > 
(
        SELECT MAX(p2.UnitPrice)
        FROM Products p2
        WHERE p2.ProductID <> p1.ProductID
 );

 --- Cau 4
SELECT p.ProductID, p.ProductName, od.UnitPrice
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName, od.UnitPrice;

--- Caua 5
SELECT p.ProductID, p.ProductName, p.UnitPrice
FROM Products p
WHERE p.UnitPrice > 
	(
        SELECT MIN(UnitPrice) 
        FROM Products
    );
--- Câu 6
SELECT o.OrderID, o.OrderDate, o.CustomerID
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City IN ('London', 'Madrid');

--- Câu 7
SELECT p.ProductID, p.ProductName, p.UnitPrice AS PurchasePrice
FROM Products p
WHERE p.ProductName LIKE '%P%'
    AND p.UnitPrice < 
	(
        SELECT AVG(UnitPrice) FROM Products
    );

--- Câu 8
SELECT p.ProductID, p.ProductName, 
    SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity) = 
	(
        SELECT MAX(TotalQuantity)
        FROM 
		(
            SELECT SUM(Quantity) AS TotalQuantity
            FROM Order_Details
            GROUP BY ProductID
        ) AS SubQuery
    );
--- Câu 9
---Sử dụng NOT EXISTS
SELECT CustomerID, CompanyName
FROM Customers c
WHERE NOT EXISTS 
(
    SELECT 1
    FROM Orders o
    WHERE c.CustomerID = o.CustomerID
);
--- sử dụng left join
SELECT c.CustomerID, c.CompanyName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

--- sử dụng not in
SELECT CustomerID, CompanyName
FROM Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM Orders
);
--- Câu 10
SELECT p.ProductID, p.ProductName, p.UnitPrice AS PurchasePrice
FROM Products p
WHERE p.ProductName LIKE '%P%'  AND p.UnitPrice = 
	(
        SELECT MAX(UnitPrice)
        FROM Products
        WHERE ProductName LIKE '%P%' 
    );
--- Câu 11
SELECT p.ProductID, p.ProductName, p.UnitPrice
FROM Products p
WHERE p.UnitPrice > 
	(
        SELECT AVG(UnitPrice)
        FROM Products
        WHERE ProductID <= 5
    );
--- Câu 12
SELECT p.ProductID, p.ProductName, 
    SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING 
    SUM(od.Quantity) > 
	(
        SELECT AVG(TotalQuantity)
        FROM 
		(
            SELECT SUM(Quantity) AS TotalQuantity
            FROM Order_Details
            GROUP BY ProductID
        ) AS SubQuery
    );

--- Câu 13
SELECT DISTINCT c.CustomerID, c.CompanyName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
WHERE o.OrderID NOT IN 
	(
        SELECT o2.OrderID
        FROM Orders o2
        JOIN Order_Details od2 ON o2.OrderID = od2.OrderID
        WHERE od2.ProductID < 3
    );
--- câu 14
SELECT od.ProductID, p.ProductName
FROM Order_Details od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= '1996-09-01' AND o.OrderDate <= '1996-11-30'
GROUP BY od.ProductID, p.ProductName
HAVING COUNT(od.OrderID) > 0;
--- Câu 15
SELECT p.ProductID, p.ProductName
FROM Products p
WHERE p.ProductID NOT IN 
	(
        SELECT od.ProductID
        FROM Order_Details od
        JOIN Orders o ON od.OrderID = o.OrderID
        WHERE o.OrderDate >= '1996-06-01' AND o.OrderDate < '1996-07-01'
    );
---- Câu 16
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
WHERE e.EmployeeID NOT IN 
	(
        SELECT o.EmployeeID
        FROM Orders o
        WHERE CAST(o.OrderDate AS DATE) = CAST(GETDATE() AS DATE)  
    );
--- câu 17
SELECT c.CustomerID, c.CompanyName
FROM Customers c
WHERE c.CustomerID NOT IN 
	(
        SELECT o.CustomerID
        FROM Orders o
        WHERE YEAR(o.OrderDate) = 1997  
    );
--- Câu 18
SELECT C.CustomerID, C.CompanyName, p.ProductID,p.ProductName
FROM Customers c
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
INNER JOIN Order_Details OD ON O.OrderID = OD.OrderID
INNER JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName LIKE '1%' 
    AND MONTH(O.OrderDate) = 9;
---Câu 19
SELECT City, COUNT(CustomerID) AS CustomerCount
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) >= 2;
--- Câu 20
SELECT ProductId, ProductName, UnitPrice 
FROM [Products]
WHERE UnitPrice > ALL (SELECT UnitPrice FROM [Products] WHERE ProductName LIKE 'B%')
--Câu hỏi: Liệt kê các sản phẩm có giá lớn hơn tất cả các sản phẩm có tên bắt đầu bằng chữ 'B'.

SELECT ProductId, ProductName, UnitPrice 
FROM [Products]
WHERE UnitPrice > ANY (SELECT UnitPrice FROM [Products] WHERE ProductName LIKE 'B%')
-- Liệt kê các sản phẩm có giá lớn hơn ít nhất một sản phẩm có tên bắt đầu bằng chữ 'B'.


SELECT ProductId, ProductName, UnitPrice 
FROM [Products]
WHERE UnitPrice = ANY (SELECT UnitPrice FROM [Products] WHERE ProductName LIKE 'B%')
 Liệt kê các sản phẩm có giá bằng với ít nhất một sản phẩm có tên bắt đầu bằng chữ 'B'.

