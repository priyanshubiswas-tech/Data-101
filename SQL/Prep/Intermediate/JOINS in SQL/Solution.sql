SELECT
    e.emp_name,
    d.dept_name
FROM
    Employees e
LEFT JOIN Departments d
    ON e.dept_id = d.dept_id;

# Explanation:
# We use a LEFT JOIN because we want all employees,
# even if they do not belong to any department.
# The match is done on dept_id from both tables.
# If there's no match (e.g., Charlie), dept_name will be NULL.
