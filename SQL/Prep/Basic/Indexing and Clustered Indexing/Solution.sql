-- 1. Table already has clustered index on 'id' via PRIMARY KEY

-- 2. Create a non-clustered index on 'name'
CREATE NONCLUSTERED INDEX idx_name ON Employees(name);

-- 3. Insert data
INSERT INTO Employees (id, name, department) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'Engineering'),
(3, 'Charlie', 'Marketing'),
(4, 'Diana', 'HR'),
(5, 'Eve', 'Engineering');

-- 4. Query using indexed column
SELECT * FROM Employees WHERE name = 'Diana';

# Explanation:
# - The PRIMARY KEY on 'id' creates a clustered index by default.
# - We create a non-clustered index on 'name' to speed up name-based lookups.
# - When you search for 'Diana', the index is used to quickly locate the row.
