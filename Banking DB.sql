/*
====================================================
        BANKING MANAGEMENT SYSTEM
====================================================
*/

CREATE DATABASE BankingDB;
use BankingDB;

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    IFSC_Code VARCHAR(15) UNIQUE
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT CHECK (Age >= 18),
    City VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    JoinDate DATE
);

CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    AccountType VARCHAR(30),
    Balance DECIMAL(12,2) CHECK (Balance >= 0),
    OpenDate DATE,

    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID),

    FOREIGN KEY (BranchID)
    REFERENCES Branch(BranchID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(12,2),
    TransactionDate DATE,
    PaymentMode VARCHAR(20),

    FOREIGN KEY (AccountID)
    REFERENCES Account(AccountID)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(30),
    LoanAmount DECIMAL(12,2),
    InterestRate DECIMAL(5,2),
    LoanStatus VARCHAR(20),
    LoanDate DATE,

    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
);

INSERT INTO Branch VALUES
(1,'Main Branch','Nashik','BANK0001'),
(2,'City Branch','Pune','BANK0002'),
(3,'Central Branch','Mumbai','BANK0003'),
(4,'Market Branch','Akole','BANK0004'),
(5,'North Branch','Ahmednagar','BANK0005');

INSERT INTO Customer VALUES
(101,'Onkar','Talekar','Male',22,'Nashik','onkar@gmail.com','9876543210','2024-01-10'),
(102,'Rahul','Patil','Male',25,'Pune','rahul@gmail.com','9876543211','2024-02-15'),
(103,'Priya','Sharma','Female',24,'Mumbai','priya@gmail.com','9876543212','2024-03-20'),
(104,'Amit','Jadhav','Male',28,'Nashik','amit@gmail.com','9876543213','2024-04-12'),
(105,'Sneha','Deshmukh','Female',26,'Pune','sneha@gmail.com','9876543214','2024-05-18'),
(106,'Rohan','More','Male',30,'Mumbai','rohan@gmail.com','9876543215','2024-06-10'),
(107,'Pooja','Shinde','Female',23,'Akole','pooja@gmail.com','9876543216','2024-07-15'),
(108,'Kiran','Pawar','Male',32,'Ahmednagar','kiran@gmail.com','9876543217','2024-08-20'),
(109,'Neha','Kulkarni','Female',27,'Nashik','neha@gmail.com','9876543218','2024-09-10'),
(110,'Sagar','Kale','Male',29,'Pune','sagar@gmail.com','9876543219','2024-10-05'),
(111,'Anjali','Patil','Female',25,'Mumbai','anjali@gmail.com','9876543220','2024-11-12'),
(112,'Vikas','Shah','Male',35,'Nashik','vikas@gmail.com','9876543221','2024-12-15'),
(113,'Snehal','More','Female',22,'Akole','snehal@gmail.com','9876543222','2025-01-10'),
(114,'Akash','Bhosale','Male',31,'Pune','akash@gmail.com','9876543223','2025-02-15'),
(115,'Rutuja','Pawar','Female',24,'Mumbai','rutuja@gmail.com','9876543224','2025-03-20'),
(116,'Pratik','Shinde','Male',27,'Nashik','pratik@gmail.com','9876543225','2025-04-12'),
(117,'Komal','Jadhav','Female',29,'Pune','komal@gmail.com','9876543226','2025-05-18'),
(118,'Nikhil','Kale','Male',33,'Ahmednagar','nikhil@gmail.com','9876543227','2025-06-10'),
(119,'Pallavi','Patil','Female',26,'Mumbai','pallavi@gmail.com','9876543228','2025-07-15'),
(120,'Ganesh','More','Male',36,'Akole','ganesh@gmail.com','9876543229','2025-08-20');

INSERT INTO Account VALUES
(1001,101,1,'Savings',50000,'2024-01-15'),
(1002,102,2,'Current',75000,'2024-02-20'),
(1003,103,3,'Savings',65000,'2024-03-25'),
(1004,104,1,'Savings',40000,'2024-04-15'),
(1005,105,2,'Current',90000,'2024-05-20'),
(1006,106,3,'Savings',55000,'2024-06-15'),
(1007,107,4,'Savings',35000,'2024-07-20'),
(1008,108,5,'Current',80000,'2024-08-25'),
(1009,109,1,'Savings',60000,'2024-09-15'),
(1010,110,2,'Savings',45000,'2024-10-10'),
(1011,111,3,'Current',95000,'2024-11-15'),
(1012,112,1,'Savings',70000,'2024-12-20'),
(1013,113,4,'Savings',30000,'2025-01-15'),
(1014,114,2,'Current',85000,'2025-02-20'),
(1015,115,3,'Savings',52000,'2025-03-25'),
(1016,116,1,'Savings',48000,'2025-04-15'),
(1017,117,2,'Current',92000,'2025-05-20'),
(1018,118,5,'Savings',62000,'2025-06-15'),
(1019,119,3,'Savings',58000,'2025-07-20'),
(1020,120,4,'Current',78000,'2025-08-25');

INSERT INTO Transactions VALUES
(1,1001,'Deposit',10000,'2026-01-01','UPI'),
(2,1001,'Withdrawal',2000,'2026-01-02','ATM'),
(3,1002,'Deposit',15000,'2026-01-03','NEFT'),
(4,1002,'Withdrawal',5000,'2026-01-04','UPI'),
(5,1003,'Deposit',12000,'2026-01-05','UPI'),
(6,1003,'Withdrawal',3000,'2026-01-06','ATM'),
(7,1004,'Deposit',8000,'2026-01-07','Cash'),
(8,1004,'Withdrawal',1000,'2026-01-08','UPI'),
(9,1005,'Deposit',20000,'2026-01-09','NEFT'),
(10,1005,'Withdrawal',4000,'2026-01-10','ATM'),
(11,1006,'Deposit',9000,'2026-01-11','UPI'),
(12,1006,'Withdrawal',2500,'2026-01-12','Cash'),
(13,1007,'Deposit',7000,'2026-01-13','UPI'),
(14,1007,'Withdrawal',1500,'2026-01-14','ATM'),
(15,1008,'Deposit',18000,'2026-01-15','NEFT'),
(16,1008,'Withdrawal',6000,'2026-01-16','UPI'),
(17,1009,'Deposit',11000,'2026-01-17','Cash'),
(18,1009,'Withdrawal',2000,'2026-01-18','ATM'),
(19,1010,'Deposit',13000,'2026-01-19','UPI'),
(20,1010,'Withdrawal',3500,'2026-01-20','Cash');

INSERT INTO Loans VALUES
(201,101,'Home Loan',2500000,8.5,'Approved','2025-01-10'),
(202,102,'Personal Loan',200000,11.5,'Approved','2025-02-15'),
(203,103,'Car Loan',800000,9.0,'Approved','2025-03-20'),
(204,104,'Home Loan',3000000,8.2,'Pending','2025-04-12'),
(205,105,'Personal Loan',150000,12.0,'Approved','2025-05-18'),
(206,106,'Education Loan',500000,7.5,'Approved','2025-06-10'),
(207,107,'Car Loan',600000,9.5,'Rejected','2025-07-15'),
(208,108,'Home Loan',3500000,8.0,'Approved','2025-08-20'),
(209,109,'Personal Loan',250000,11.0,'Pending','2025-09-10'),
(210,110,'Education Loan',400000,7.8,'Approved','2025-10-05'),
(211,111,'Car Loan',900000,9.2,'Approved','2025-11-12'),
(212,112,'Home Loan',4000000,8.3,'Pending','2025-12-15'),
(213,113,'Personal Loan',100000,12.5,'Rejected','2025-12-20'),
(214,114,'Education Loan',600000,7.2,'Approved','2025-12-25'),
(215,115,'Car Loan',750000,9.1,'Approved','2025-12-30'),
(216,116,'Home Loan',2800000,8.4,'Approved','2026-01-05'),
(217,117,'Personal Loan',180000,11.2,'Pending','2026-01-10'),
(218,118,'Car Loan',650000,9.3,'Approved','2026-01-15'),
(219,119,'Education Loan',450000,7.6,'Rejected','2026-01-20'),
(220,120,'Home Loan',3200000,8.1,'Approved','2026-01-25');


SHOW TABLES;

DESC Branch;

DESC Customer;

DESC Account;

DESC Transactions;

DESC Loans;


SELECT * FROM Branch;

SELECT * FROM Customer;

SELECT * FROM Account;

SELECT * FROM Transactions;

SELECT * FROM Loans;


SELECT COUNT(*) FROM Branch;
SELECT COUNT(*) FROM Customer;
SELECT COUNT(*) FROM Account;
SELECT COUNT(*) FROM Transactions;
SELECT COUNT(*) FROM Loans;

/*DML Operations*/
-- INSERT
INSERT INTO Customer
VALUES (121,'Aarav','Patil','Male',24,'Nashik',
'aarav@gmail.com','9876500000','2026-01-01');

-- UPDATE
UPDATE Account
SET Balance = 60000
WHERE AccountID = 1001;

-- DELETE
DELETE FROM Customer
WHERE CustomerID = 121;


/* DQL Operations */

-- SELECT
SELECT * FROM Customer;

-- WHERE
SELECT * FROM Customer
WHERE City = 'Nashik';

-- AND
SELECT * FROM Customer
WHERE City = 'Nashik' AND Gender = 'Male';

-- OR
SELECT * FROM Customer
WHERE City = 'Pune' OR City = 'Mumbai';

-- BETWEEN
SELECT * FROM Account
WHERE Balance BETWEEN 40000 AND 80000;

-- IN
SELECT * FROM Customer
WHERE City IN ('Nashik','Pune','Mumbai');

-- LIKE
SELECT * FROM Customer
WHERE FirstName LIKE 'A%';

-- DISTINCT
SELECT DISTINCT City FROM Customer;

-- ORDER BY
SELECT * FROM Account
ORDER BY Balance DESC;

-- LIMIT
SELECT * FROM Account
ORDER BY Balance DESC
LIMIT 5;

/* Aggregate Functions */

-- COUNT
SELECT COUNT(*) FROM Customer;

-- SUM
SELECT SUM(Balance) FROM Account;

-- AVG
SELECT AVG(Balance) FROM Account;

-- MAX
SELECT MAX(Balance) FROM Account;

-- MIN
SELECT MIN(Balance) FROM Account;

-- GROUP BY
SELECT City, COUNT(*)
FROM Customer
GROUP BY City;

-- HAVING
SELECT City, COUNT(*)
FROM Customer
GROUP BY City
HAVING COUNT(*) > 2;

/* Built-in Functions */

SELECT UPPER(FirstName) FROM Customer;

SELECT CONCAT(FirstName,' ',LastName)
FROM Customer;

SELECT ROUND(AVG(Balance),2)
FROM Account;

SELECT YEAR(JoinDate)
FROM Customer;

SELECT DATEDIFF(CURDATE(),JoinDate)
FROM Customer;

/* Window Functions */

-- ROW_NUMBER
SELECT AccountID, Balance,
ROW_NUMBER() OVER(ORDER BY Balance DESC) AS RowNum
FROM Account;

-- RANK
SELECT AccountID, Balance,
RANK() OVER(ORDER BY Balance DESC) AS Ranking
FROM Account;

-- DENSE_RANK
SELECT AccountID, Balance,
DENSE_RANK() OVER(ORDER BY Balance DESC) AS Ranking
FROM Account;

/* Joins */

-- INNER JOIN
SELECT C.FirstName, A.AccountID, A.Balance
FROM Customer C
INNER JOIN Account A
ON C.CustomerID = A.CustomerID;

-- LEFT JOIN
SELECT C.FirstName, L.LoanType
FROM Customer C
LEFT JOIN Loans L
ON C.CustomerID = L.CustomerID;

/* Subqueries */

-- Above Average Balance
SELECT *
FROM Account
WHERE Balance > (
    SELECT AVG(Balance)
    FROM Account
);

-- Highest Balance
SELECT *
FROM Account
WHERE Balance = (
    SELECT MAX(Balance)
    FROM Account
);

/* Views */

-- CREATE VIEW
CREATE VIEW CustomerDetails AS
SELECT C.FirstName, C.City, A.AccountID, A.Balance
FROM Customer C
JOIN Account A
ON C.CustomerID = A.CustomerID;

-- DISPLAY VIEW
SELECT * FROM CustomerDetails;

-- DROP VIEW
DROP VIEW CustomerDetails


/* Procedure */

DELIMITER //
CREATE PROCEDURE GetAllCustomers()
BEGIN
    SELECT * FROM Customer;
END //
DELIMITER ;
CALL GetAllCustomers();


-- Procedure with IN Parameter

DELIMITER //
CREATE PROCEDURE GetCustomerByID(IN C_ID INT)
BEGIN
    SELECT * FROM Customer
    WHERE CustomerID = C_ID;
END //
DELIMITER ;
CALL GetCustomerByID(101);

-- Procedure with Multiple Parameters

DELIMITER //
CREATE PROCEDURE GetCustomerDetails(
    IN C_City VARCHAR(50),
    IN C_Gender VARCHAR(10)
)
BEGIN
    SELECT *
    FROM Customer
    WHERE City = C_City
    AND Gender = C_Gender;
END //
DELIMITER ;
CALL GetCustomerDetails('Nashik', 'Male');

-- Procedure for Update

DELIMITER //
CREATE PROCEDURE UpdateBalance(
    IN A_ID INT,
    IN NewBalance DECIMAL(12,2)
)
BEGIN
    UPDATE Account
    SET Balance = NewBalance
    WHERE AccountID = A_ID;
END //
DELIMITER ;
CALL UpdateBalance(1001, 50000);

-- Procedure for Delete

DELIMITER //
CREATE PROCEDURE DeleteCustomer(IN C_ID INT)
BEGIN
    DELETE FROM Customer
    WHERE CustomerID = C_ID;
END //
DELIMITER ;
CALL DeleteCustomer(121);