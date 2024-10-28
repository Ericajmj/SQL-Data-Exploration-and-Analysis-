-- Query 1: Get all employees working at 'Common Grounds.
SELECT *
FROM employees
WHERE coffeeshop_id = 1;


-- Query 2: Get the names of all suppliers that provide Arabica coffee.
SELECT supplier_name
FROM suppliers
WHERE coffee_type = 'Arabica';


-- Query 3: Find the average salary of employees in each city.

SELECT l.city, AVG(e.salary) AS average_salary
FROM employees e
JOIN shops s ON e.coffeeshop_id = s.coffeeshop_id
JOIN locations l ON s.city_id = l.city_id
GROUP BY l.city;

-- Query 4: Get the names of employees hired after January 1, 2016, and working in a shop located in Los Angeles:

SELECT first_name, last_name, hire_date
FROM employees e
JOIN shops s ON e.coffeeshop_id = s.coffeeshop_id
JOIN locations l ON s.city_id = l.city_id
WHERE hire_date > '2016-01-01' AND l.city = 'Los Angeles';


-- Query 5: Identify the coffee shops with at least 3 different suppliers.

SELECT s.coffeeshop_name
FROM shops s
JOIN suppliers sup ON s.coffeeshop_id = sup.coffeeshop_id
GROUP BY s.coffeeshop_name
HAVING COUNT(DISTINCT sup.supplier_name) >= 3;

-- Query 6: Find the employee with the highest salary in each shop
SELECT s.coffeeshop_name, e.first_name, e.last_name, e.salary
FROM employees e
JOIN shops s ON e.coffeeshop_id = s.coffeeshop_id
WHERE (e.salary, e.coffeeshop_id) IN (
    SELECT MAX(salary), coffeeshop_id
    FROM employees
    GROUP BY coffeeshop_id
);

-- Query 7: Count the total number of employees by gender and city.

SELECT l.city, e.gender, COUNT(*) AS total_employess
FROM employees e
JOIN shops s ON e.coffeeshop_id = s.coffeeshop_id
JOIN locations l ON s.city_id = l.city_id
GROUP BY l.city, e.gender;



