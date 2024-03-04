/* Operators in the WHERE clause
=		Equal to
<		Less than
>		Greater than
<=		Less than or equal to
>=		Greater than or equal to
<>		Not equal to
!=	    Not equal to
LIKE	Check if a value matches a pattern (case sensitive)
ILIKE	Check if a value matches a pattern (case insensitive)
AND		Logical AND
OR		Logical OR
IN		Check if a value is between a range of values
BETWEEN	Check if a value is between a range of values
IS NULL	Check if a value is NULL
NOT		Makes a negative result e.g. NOT LIKE, NOT IN, NOT BETWEEN
*/

SELECT * FROM cars
WHERE brand = 'Volvo';

SELECT * FROM cars
WHERE model <= 1975;

SELECT * FROM cars
WHERE brand <> 'Volvo';

SELECT * FROM cars
WHERE brand != 'Volvo';

SELECT * FROM cars
WHERE brand != 'Volvo';

SELECT * FROM cars
WHERE model ILIKE 'm%';

SELECT * FROM cars
WHERE brand = 'Volvo' AND year = 1968;

SELECT * FROM cars
WHERE brand = 'Volvo' OR year = 1975;

-- Return all records where the brand is present in this list: ('Volvo', 'Mercedes', 'Ford'):
SELECT * FROM cars
WHERE brand IN ('Volvo', 'Mercedes', 'Ford');

-- Return all records where the year is between 1970 and 1980 (include 1970 and 1980 as well.)
SELECT * FROM cars
WHERE year BETWEEN 1970 AND 1980;

SELECT * FROM cars
WHERE model IS NULL;

-- The NOT operator can be used together with LIKE, ILIKE, IN, BETWEEN, and NULL operators to reverse the truth of the operator.
SELECT * FROM cars
WHERE brand NOT LIKE 'B%';

-- Return all records where the brand is NOT present in this list: ('Volvo', 'Mercedes', 'Ford'):
SELECT * FROM cars
WHERE brand NOT IN ('Volvo', 'Mercedes', 'Ford');

-- The NOT BETWEEN operator excludes the from and to values, meaning that in the above example, the result would not include cars made in 1970 and 1980.
SELECT * FROM cars
WHERE year NOT BETWEEN 1970 AND 1980;

SELECT * FROM cars
WHERE model IS NOT NULL;



-- The SELECT DISTINCT statement is used to return only distinct (different) values.
SELECT DISTINCT country FROM customers;

SELECT COUNT(DISTINCT country) FROM customers;

--Sort Data
SELECT * FROM products
ORDER BY product_name DESC;

--Limit
SELECT * FROM customers

--Offset is used to specify where to start selecting the records to return.
SELECT * FROM customers
LIMIT 20 OFFSET 40;
LIMIT 20;

-- Functions
SELECT MIN(price)
FROM products;

SELECT MAX(price)
FROM products;

SELECT MIN(price) AS lowest_price
FROM products;

--Note: NULL values are not counted.
SELECT COUNT(customer_id)
FROM customers

SELECT SUM(quantity)
FROM order_details;

--Note: NULL values are ignored.
SELECT AVG(price)

--We can use the ::NUMERIC operator to round the average price to a number with 2 decimals:
SELECT AVG(price)::NUMERIC(10,2)
FROM products;
FROM products;
WHERE city = 'London';

/*
LIKE
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:

% The percent sign represents zero, one, or multiple characters
_ The underscore sign represents one, single character
*/

SELECT * FROM customers
WHERE customer_name LIKE '%A%';

/*ILIKE
Note: The LIKE operator is case sensitive, 
if you want to do a case insensitive search, 
use the ILIKE operator instead.*/

--Return all customers with a name that contains the letter 'A' or 'a':
SELECT * FROM customers
WHERE customer_name ILIKE '%A%';

--The Undescore _ Wildcard 
-- The _ wildcard represents a single character.

SELECT * FROM customers
WHERE city LIKE 'L_nd__';

--IN 
-- The IN operator allows you to specify a list of possible values in the WHERE clause.
-- The IN operator is a shorthand for multiple OR conditions.

SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');

--NOT IN
SELECT * FROM customers
WHERE country NOT IN ('Germany', 'France', 'UK');

--IN (SELECT)
--Return all customers that have an order in the orders table:
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

--NOT IN (SELECT)
SELECT * FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

--BETWEEN 
--The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 15;

SELECT * FROM Products
WHERE product_name BETWEEN 'Pavlova' AND 'Tofu';

SELECT * FROM Products
WHERE product_name BETWEEN 'Pavlova' AND 'Tofu'
ORDER BY product_name;

SELECT * FROM orders
WHERE order_date BETWEEN '2023-04-12' AND '2023-05-05';

--Aliases
SELECT customer_id AS id
FROM customers;

SELECT customer_id id
FROM customers;

--Concatenate Columns

SELECT product_name || unit AS product
FROM products;

SELECT product_name || ' ' || unit AS product
FROM products;

--Using Aliases With a Space Character
SELECT product_name AS "My Great Products"
FROM products;