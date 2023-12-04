--creating tables
CREATE TABLE salesman (
    salesman_id NUMBER(5) PRIMARY KEY,
    name VARCHAR(30),
    city VARCHAR(15),
    commission NUMBER(5,2)
);

CREATE TABLE orders (
    ord_no NUMBER(5) PRIMARY KEY,
    purch_amt NUMBER(8,2),
    ord_date DATE,
    customer_id NUMBER(5),
    salesman_id NUMBER(5) 
    );
    
CREATE TABLE customer (
    customer_id NUMBER(5) PRIMARY KEY,
    cust_name VARCHAR(30),
    city VARCHAR(15),
    grade NUMBER(3),
    salesman_id NUMBER(5)
    );

--adding FK
ALTER TABLE orders
    ADD CONSTRAINT FK_salesman_id FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);
    
ALTER TABLE orders
    ADD CONSTRAINT FK_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

--table customer
INSERT INTO customer
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);

INSERT INTO customer
VALUES (3007, 'Brad Davis', 'New York', 200, 5001);

INSERT INTO customer
VALUES (3005, 'Graham Zusi', 'California', 200, 5002);

INSERT INTO customer
VALUES (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO customer
VALUES (3004, 'Fabian Johnson', 'Paris', 300, 5006);

INSERT INTO customer
VALUES (3009, 'Geoff Cameron', 'Berlin', 100, 5003);

INSERT INTO customer
VALUES (3003, 'Jozy Altidor', 'Moscow', 200, 5007);

--table salesman
INSERT INTO salesman
VALUES (5001, 'James Hoong', 'New York', 0.15);

INSERT INTO salesman
VALUES (5002, 'Nail Knite', 'Paris', 0.13);

INSERT INTO salesman
VALUES (5005, 'Pit Alex', 'London', 0.11);

INSERT INTO salesman
VALUES (5006, 'Mc Lyon', 'Paris', 0.14);

INSERT INTO salesman
VALUES (5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO salesman
VALUES (5003, 'Lauson Hen', 'San Jose', 0.12);

--table orders
INSERT INTO orders
VALUES (70001, 150.5, DATE '2012-10-05', 3005, 5002)
;

INSERT INTO orders
VALUES (70009, 270.65, DATE '2012-09-10', 3002, 5005)
;

INSERT INTO orders
VALUES (70002, 65.26, DATE '2012-10-05', 3002, 5001)
;

INSERT INTO orders
VALUES (70004, 110.5, DATE '2012-08-17', 3009, 5003)
;
INSERT INTO orders
VALUES (70007, 948.5, DATE '2012-09-10', 3005, 5002)
;

INSERT INTO orders
VALUES (70005, 2400.6, DATE '2012-07-27', 3007, 5001)
;

INSERT INTO orders
VALUES (70008, 5760, DATE '2012-09-10', 3002, 5001)
;

INSERT INTO orders
VALUES (70010, 1983.43, DATE '2012-10-10', 3004, 5006)
;

INSERT INTO orders
VALUES (70003, 2480.4, DATE '2012-10-10', 3009, 5003)
;

INSERT INTO orders
VALUES (70012, 250.45, DATE '2012-06-27', 3008, 5002)
;

INSERT INTO orders
VALUES (70011, 75.29, DATE '2012-08-17', 3003, 5007)
;

INSERT INTO orders
VALUES (70013, 3045.6, DATE '2012-04-25', 3002, 5001)
;

--zadání 1 (pozn. k výsledku u zadání Brad Guzan ve zdrojových datech není)
SELECT cust_name, CUST.city, SAL.name, commission
FROM customer CUST
JOIN salesman SAL
ON CUST.salesman_id = SAL.salesman_id;

--zadání 2
SELECT SAL.salesman_id, SAL.city, CUST.customer_id, ord_no, purch_amt, ord_date, cust_name, grade, SAL.name, commission
FROM orders ORD
JOIN customer CUST
ON ORD.customer_id = CUST.customer_id
JOIN salesman SAL
ON CUST.salesman_id = SAL.salesman_id;

--zadání 3
SELECT ord_no, purch_amt, CUST.cust_name, CUST.city
FROM orders ORD
JOIN customer CUST
ON ORD.customer_id = CUST.customer_id
WHERE purch_amt > 500 AND purch_amt < 2000;

--zadání 4
SELECT ord_no, salesman_id
FROM orders
WHERE salesman_id =
    (SELECT salesman_id
    FROM salesman
    WHERE salesman.name = 'James Hoong');

--zadání 5
SELECT *
FROM orders
WHERE purch_amt >
(SELECT AVG(purch_amt)
    FROM orders
    WHERE ord_date <= DATE '2012-10-10');
