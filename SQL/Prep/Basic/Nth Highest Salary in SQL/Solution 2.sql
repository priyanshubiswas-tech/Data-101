-- 🔁 Parameterized version (replace N = 3 as needed)
WITH RankedSalaries AS (
  SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM Employees
)
SELECT salary
FROM RankedSalaries
WHERE rnk = 3;

# Explanation:
# - Assign DENSE_RANK to each distinct salary.
# - Filter by rnk = N to get the Nth highest salary.
# - Works even if there are ties.
