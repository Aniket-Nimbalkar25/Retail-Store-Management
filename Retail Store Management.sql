create database store_retail_management



CREATE TABLE Customers ( cust_id INT  Identity(1,1), name VARCHAR(50) NOT NULL , email VARCHAR(50) NOT NULL , 
phone VARCHAR(12) NOT NULL , dob DATE NULL DEFAULT NULL , address VARCHAR(20) NOT NULL , 
postcode VARCHAR(15) NOT NULL, PRIMARY KEY (cust_id));




ALTER TABLE customers ADD UNIQUE(email);


--Products Table:
CREATE TABLE Products ( prod_id INT   Identity(1,1) , inventory_id INT NOT NULL , name VARCHAR(11) NOT NULL , 
price FLOAT(24) NULL , sale_price FLOAT(24) NULL , prod_desc VARCHAR(255) NULL DEFAULT NULL , 
mnf_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , exp_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , 
aisle_id INT  NOT NULL , PRIMARY KEY (prod_id)) ;

ALTER TABLE products ADD CONSTRAINT aisles_has_products FOREIGN KEY (aisle_id)
REFERENCES aisles(aisle_id) ON DELETE NO ACTION ON UPDATE NO ACTION;
--


ALTER TABLE products
ALTER COLUMN inventory_id INT NOT NULL;--

ALTER TABLE products ADD CONSTRAINT inventory_products FOREIGN KEY
(inventory_id) REFERENCES inventories(inventory_id) ON DELETE NO ACTION ON UPDATE NO ACTION;--


--Employees Table:
CREATE TABLE Employees ( emp_id INT  NOT NULL Identity(1,1) , name VARCHAR(50) NOT NULL , email VARCHAR(50) NOT NULL , 
phone VARCHAR(11) NOT NULL , position_id INT NOT NULL , joining_date DATE NULL , 
leaving_date DATE NULL , PRIMARY KEY (emp_id));

ALTER TABLE employees ADD CONSTRAINT employee_position_id FOREIGN KEY
(position_id) REFERENCES positions(position_id) ON DELETE NO ACTION ON UPDATE NO ACTION;--
 
--Positions Table:
CREATE TABLE Positions(Position_id int NOT NULL Identity(1,1),
Position_Name varchar(20) NOT NULL,Job_role varchar(30) NOT NULL,
PRIMARY KEY (Position_id)) ;


--Orders Table:
CREATE TABLE Orders ( order_id INT  NOT NULL Identity(1,1), cust_id INT  NOT NULL , 
emp_id INT NOT NULL , total_qty INT NOT NULL , price FLOAT NOT NULL , 
tax FLOAT NOT NULL , total_price FLOAT NOT NULL , order_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
PRIMARY KEY (order_id)) ;

ALTER TABLE orders ADD CONSTRAINT order_customers FOREIGN KEY (cust_id)
REFERENCES customers(cust_id) ON DELETE NO ACTION ON UPDATE NO ACTION; 

ALTER TABLE orders ADD CONSTRAINT order_employees FOREIGN KEY (emp_id) 
REFERENCES employees(emp_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--Order Products Table:
CREATE TABLE Order_Products ( order_prod_id INT NOT NULL Identity(1,1), 
price FLOAT NOT NULL , qty INT NOT NULL , prod_id INT NOT NULL ,
order_id INT  NOT NULL , PRIMARY KEY (order_prod_id));

ALTER TABLE order_products ADD CONSTRAINT op_product FOREIGN KEY (prod_id)
REFERENCES products(prod_id) ON DELETE NO ACTION ON UPDATE NO ACTION; --

ALTER TABLE order_products ADD CONSTRAINT op_order FOREIGN KEY (order_id) REFERENCES
orders(order_id) ON DELETE NO ACTION ON UPDATE NO ACTION;--


--Payments Table:
CREATE TABLE Payments ( payment_id INT NOT NULL Identity(1,1), order_id INT  NOT NULL , price FLOAT NOT NULL , 
descr VARCHAR(255) NOT NULL ,
status VARCHAR(50) NOT NULL , method VARCHAR(50) NOT NULL , updated_at DATETIME
NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (payment_id));


ALTER TABLE payments ADD CONSTRAINT order_payments FOREIGN KEY (order_id) REFERENCES orders(order_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION;



--Suppliers Table:
CREATE TABLE Suppliers ( supplier_id  INT NOT NULL Identity(1,1), name VARCHAR(50) NOT NULL , phone varchar(20) NOT NULL , 
email VARCHAR(50) NOT NULL , address VARCHAR(255) NOT NULL , 
PRIMARY KEY (supplier_id)) ;
 

ALTER TABLE suppliers ADD CONSTRAINT supplier_inventories FOREIGN KEY
(supplier_id) REFERENCES inventories(supplier_id) ON DELETE NO ACTION ON UPDATE NO ACTION;


--Inventories Table:
CREATE TABLE Inventories ( inventory_id INT NOT NULL Identity(1,1),
qty INT NOT NULL , in_stock INT NOT NULL , 
supplier_id INT  NOT NULL , PRIMARY KEY (inventory_id));

ALTER TABLE inventories
ADD inventory_id INT IDENTITY(1,1) NOT NULL;


ALTER TABLE inventories ADD CONSTRAINT supplier_inventories FOREIGN KEY (supplier_id) 
REFERENCES suppliers(supplier_id) ON DELETE NO ACTION ON UPDATE NO ACTION;



--Aisles Table:
CREATE TABLE Aisles ( aisle_id INT NOT NULL Identity(1,1), aisle_no INT  NOT NULL , 
descr VARCHAR(255) NOT NULL , PRIMARY KEY (aisle_id)) ;

ALTER TABLE aisles
ADD aisle_id INT IDENTITY(1,1) NOT NULL;


Customers:

INSERT INTO customers
(cust_id,name,email,phone,dob,address,postcode)
VALUES
(001,'Rohan', 'rohan@mail.com','09925647412','1997-04-25','sec-10,Panvel','410206'),
(002, 'Nikhil', 'nikhil@mail.com','08564712360','1991-07-09','sec-11,Panvel','410206'),
(003, 'Shankar', 'shankar@mail.com','06945782014','1996-06-04','sec-09,Panvel','410206'),
(004, 'Sandesh', 'sandesh@mail.com','08542369714','1999-08-05','sec-10,Panvel','410206'),
(005, 'Divesh', 'divesh@mail.com','07145856932','1999-01-02','sec-10,Panvel','410206'),
(006, 'Sumit', 'sumit@mail.com','0123654740','1993-02-07','sec-08,Panvel','410206'),
(007, 'Prashant', 'prashant@mail.com','0878545678','1994-06-03','sec-11,Panvel','410206'),
(008,'Darsh', 'darshan@mail.com','0776545678','1998-12-02','sec-12,Panvel','410206'),
(009,'Akshay', 'akshay@mail.com','0876515678','1990-07-07','sec-16,Panvel','410206'),
(010, 'Paresh', 'paresh@mail.com','7456788237','1990-04-17','sec-01,Panvel', '410206');



Products:
INSERT INTO products
(prod_id,inventory_id,name,price,sale_price,prod_desc,mnf_date,exp_date,aisle_id)
VALUES
(765, 1, 'Rice',126.0,99.0,'Kohinoor Rice','2022-01-01','2022-01-21', 1),
(234, 2, 'Cheese',310.0,248.0,'GO Cheese','2022-01-01','2022-01-21', 2),
(147, 3, 'Biscuits',99.0,68.0,'Parle G Biscuits','2022-01-01','2022-01-21', 3),
(546, 4, 'Milk',74.0,70.0,'Gokul Milk','2022-01-02','2022-01-11', 2),
(789, 5, 'Chocolate',65.0,61.0,'Dairy Milk chocolate','2022-01-02','2022-01-12',3),
(124, 6, 'Butter',136.0,112.0,'Amul butter','2022-01-03','2022-01-13', 3),
(367, 7, 'Tea',367.0,299.0,'10 tea bags','2022-01-03','2022-01-14', 3),
(421, 8, 'Coffee',112.0,89.0,'Nescafe coffee','2022-01-04','2022-01-15', 3),
(258, 9, 'Oats',349.0,320.0,'Kellogs Oats','2022-01-04','2022-01-16', 3),
(369, 10, 'Curd',49.0,45.0,'Amul Curd','2022-01-04','2022-01-11',2);

SET IDENTITY_INSERT  employees ON;
SET IDENTITY_INSERT   positions OFF;

Employees:
INSERT INTO employees
(emp_id,name,email,phone,position_id,joining_date,leaving_date)
VALUES
(234, 'Employee 1', 'employee1@test.com', 0123456789, 1, '2010-01-01', '2021-01-01'),
(345, 'Employee 2', 'employee2@test.com', 0123236789, 2, '2014-01-01', '2019-04-12'),
(321, 'Employee 3', 'employee3@test.com', 0127656789, 3, '2012-01-01', '2016-06-09');


Orders:
INSERT INTO orders
(order_id,cust_id,emp_id,total_qty,price,tax,total_price,order_datetime)
VALUES
(1, 001, 234, 12, 678.0, 0.00, 678.0, '2021-01-01 12:56:59'),
(2, 008, 345, 9, 549.0, 0.00, 549.0, '2019-04-12 10:16:10'),
(4, 002, 345, 5, 225.0, 0.00, 225.0, '2016-06-09 16:45:20'),
(5, 008, 234, 4,1196.0 , 0.00, 1196.0, '2016-06-09 16:45:20'),
(3, 009, 234, 10, 610.0, 0.00, 610.0, '2016-06-09 16:45:20'),
(6, 004, 345, 11, 1239.0, 0.00, 1239.0, '2016-06-09 16:45:20'),
(7,006, 345, 7,673.0 , 0.00, 673.0, '2016-06-09 16:45:20'),
(8, 005, 234, 10, 1201.0, 0.00, 1201.0, '2016-06-09 16:45:20'),
(9, 003, 345, 6,429.0, 0.00, 429.0, '2016-06-09 16:45:20'),
(10, 002, 234,5,1121.0, 0.00,1121.0 , '2016-06-09 16:45:20'),
(11, 010, 234, 10, 650.0, 0.00, 650.0, '2016-06-09 16:45:20');


--Order Products:
INSERT INTO order_products
(order_prod_id,price,qty,prod_id,order_id)
VALUES
(879, 310.0, 4, 234, 1),
(986, 74.0, 1, 546, 2),
(160, 49.0, 9,369, 3),
(456,126.0 , 3, 765, 1),
(147, 112.0, 2, 421, 1),
(159, 65.0, 3, 789, 1),
(743, 136.0, 8, 124, 2),
(852, 99.0, 9, 147, 2),
(357, 112.0, 8, 421, 3),
(761, 74.0, 9, 546, 3);


Payment:
INSERT INTO payments
(payment_id,order_id,price,descr,status,method,updated_at)
VALUES
(987, 1, 678.0, 'pending from bank', 'pending', 'Debit/Credit Card', '2021-01-01 12:56:59'),
(876, 2, 549.0, 'completed from bank', 'completed', 'Debit/Credit Card', '2021-01-01 12:56:59'),
(159, 4, 225.0, 'mismatched cash', 'pending', 'Cash', '2021-01-01 12:56:59'),
(324, 5, 1196.0, 'mismatched cash', 'pending', 'Cash', '2021-01-01 12:56:59'),
(678, 3, 610.0, 'completed from bank', 'completed', 'Debit/Credit Card', '2021-01-01 12:56:59'),
(879, 6, 1239.0, 'completed from bank', 'completed', 'Debit/Credit Card', '2021-01-01 12:56:59'),
(142, 7, 673.0, 'pending from bank', 'pending', 'Debit/Credit Card', '2021-01-01 12:56:59'),
(168, 8, 1201.0, 'mismatched cash', 'pending', 'Cash', '2021-01-01 12:56:59'),
(357, 9, 429.0, 'pending from bank', 'pending', 'Debit/Credit Card', '2021-01-01 12:56:59'),
(569, 10, 1121.0, 'mismatched cash', 'pending', 'Cash', '2021-01-01 12:56:59'),
(852, 11, 650.0, 'pending from bank', 'pending', 'Debit/Credit Card', '2021-01-01 12:56:59');


Supplier:
INSERT INTO suppliers
(supplier_id,name,phone,email,address)
VALUES
(1, 'Supplier 1','0123567876', 'supplier1@test.com', 'Navi Mumbai'),
(2, 'Supplier 2','9765678988', 'supplier2@test.com', 'Navi Mumbai'),
(3, 'Supplier 3','4675678769', 'supplier3@test.com', 'Panvel'),
(4, 'Supplier 4','4675678769', 'supplier4@test.com', 'New Panvel'),
(5, 'Supplier 5','4675678769', 'supplier5@test.com', 'Mumbai'),
(6, 'Supplier 6','4675678769', 'supplier6@test.com', 'Panvel'),
(7, 'Supplier 7','4675678769', 'supplier7@test.com', 'Panvel'),
(8, 'Supplier 8','4675678769', 'supplier8@test.com', 'Navi Mumbai'),
(9, 'Supplier 9','4675678769', 'supplier9@test.com', 'Panvel'),
(10, 'Supplier 10','4675678769', 'supplier10@test.com', 'Mumbai');


Inventory:
INSERT INTO inventories
(inventory_id,qty,in_stock,supplier_id)
VALUES
(788, 230, 1, 1),
(987, 120, 1, 2),
(546, 421, 0, 3),
(457, 1000, 1, 4),
(359, 800,1, 5),
(614, 900,1, 6),
(736, 650,1, 7),
(852, 430,1, 8),
(913, 959,1, 9),
(710, 642,1, 10);

Aisles:
INSERT INTO aisles
(aisle_id,aisle_no,descr)
VALUES
(098, 1,'Aisle 1'),
(076, 2,'Aisle 2'),
(061, 3,'Aisle 3'),
(014, 4,'Aisle 4'),
(032, 5,'Aisle 5'),
(096, 6,'Aisle 6'),
(047, 7,'Aisle 7'),
(085, 8,'Aisle 8'),
(041, 9,'Aisle 9'),
(067, 10,'Aisle 10');

Positions:
INSERT INTO positions (position_id, position_name, job_role) VALUES
(1, 'staff', 'Retail_Assistance'),
(2, 'staff', 'Cashier'),
(3, 'Manager', 'Staff_Management');






select *from Customers;
select *from Products;
select *from Employees;
select *from orders;
select *from order_products;
select *from payments;
select *from suppliers;
select *from inventories;
select *from aisles;
select *from positions;

--Query 1
select * from customers Inner JOIN orders on customers.cust_id=orders.cust_id Inner JOIN

order_products on orders.order_id=order_products.order_id ORDER BY name DESC


--Query2
select DISTINCT position_name from positions;
--Query3
SELECT SUM(total_price) FROM orders;

--Query4
CREATE UNIQUE INDEX random_index_name ON customers (name);

--query5
SELECT c.cust_id,c.name,c.email,c.phone FROM customers c inner join orders o on 
c.cust_id= o.cust_id WHERE o.total_price = (SELECT MAX(total_price) FROM orders);

--Query6
SELECT c.cust_id, c.name, c.email, c.phone, o.order_id, o.total_price  from customers c inner join orders o on c.cust_id = o.cust_id order by o.total_price desc;

--Query7
SELECT AVG(total_price) FROM orders;

--Query8
SELECT i.inventory_id, s.name, s.phone, s.email, s.address from inventories i join suppliers s on i.supplier_id = s.supplier_id;





