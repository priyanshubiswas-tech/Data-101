-- ✅ Approach 1: Using Subquery
SELECT MAX(salary) AS SecondHighest
FROM Employees
WHERE salary < (
  SELECT MAX(salary) FROM Employees
);

# Explanation:
# - First, find the highest salary: SELECT MAX(salary)
# - Then, get the max salary that is less than that → second highest

-- ✅ Approach 2: Using DENSE_RANK (Standard SQL)
SELECT salary
FROM (
  SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM Employees
) ranked
WHERE rnk = 2;

# Explanation:
# - DENSE_RANK assigns the same rank to duplicates.
# - We filter for rank = 2 to get second highest.
