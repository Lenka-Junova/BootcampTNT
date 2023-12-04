SELECT cust_name, CUST.city, SAL.name, commission
FROM customer CUST
JOIN salesman SAL
ON CUST.salesman_id = SAL.salesman_id;

SELECT SAL.salesman_id, SAL.city, CUST.customer_id, ord_no, purch_amt, ord_date, cust_name, grade, SAL.name, commission
FROM orders ORD
JOIN customer CUST
ON ORD.customer_id = CUST.customer_id
JOIN salesman SAL
ON CUST.salesman_id = SAL.salesman_id;

SELECT ord_no, purch_amt, CUST.cust_name, CUST.city
FROM orders ORD
JOIN customer CUST
ON ORD.customer_id = CUST.customer_id
WHERE purch_amt > 500 AND purch_amt < 2000;

SELECT ord_no, salesman_id
FROM orders
WHERE salesman_id =
    (SELECT salesman_id
    FROM salesman
    WHERE salesman.name = 'James Hoong');
    
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM orders
WHERE purch_amt = (
    SELECT AVG(purch_amt),
    FROM orders
    WHERE ord_date <= DATE '2012-10-10');