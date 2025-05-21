-- Valid rows will only be those that satisfy NOT NULL and CHECK constraints
SELECT *
FROM Employees
WHERE age >= 18 AND name IS NOT NULL;

# Explanation:
# 1. The age must be at least 18 due to the CHECK constraint.
# 2. The name must not be NULL due to the NOT NULL constraint.
# 3. If salary is NULL, it may still be valid due to the DEFAULT constraint (if insert ignored it).
