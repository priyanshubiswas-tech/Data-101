-- 1. Create the view
CREATE VIEW HR_Employees AS
SELECT id, name, salary
FROM Employees
WHERE department = 'HR';

-- 2. Query the view
SELECT * FROM HR_Employees;

# Explanation:
# - The view filters employees from the HR department.
# - Querying the view returns only HR employees.
# - No data duplication, it runs the underlying query each time.
