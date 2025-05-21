-- 1. Insert data into Sales table
INSERT INTO Sales (id, employee, region, amount) VALUES
(1, 'Alice', 'East', 1000),
(2, 'Bob', 'West', 2000),
(3, 'Alice', 'East', 1500),
(4, 'Diana', 'West', 3000),
(5, 'Bob', 'East', 500);

-- 2. Query with WHERE and HAVING
SELECT employee, SUM(amount) AS total_sales
FROM Sales
WHERE region = 'East'
GROUP BY employee
HAVING SUM(amount) > 1200;

# Explanation:
# - WHERE filters for only 'East' region rows before grouping.
# - GROUP BY groups rows by employee.
# - SUM(amount) computes total sales per employee.
# - HAVING filters out groups (employees) whose total sales <= 1200.
