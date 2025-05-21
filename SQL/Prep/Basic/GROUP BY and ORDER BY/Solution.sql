-- 1. Insert data into Employees table
INSERT INTO Employees (id, name, department, salary) VALUES
(1, 'Alice', 'HR', 4000),
(2, 'Bob', 'Engineering', 6000),
(3, 'Charlie', 'Engineering', 7000),
(4, 'Diana', 'HR', 4500),
(5, 'Eve', 'Marketing', 5000);

-- 2. Query: Total salary by department, sorted descending
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department
ORDER BY total_salary DESC;

# Explanation:
# - GROUP BY groups rows based on department.
# - SUM aggregates salary per department.
# - ORDER BY sorts the result by total salary in descending order.
