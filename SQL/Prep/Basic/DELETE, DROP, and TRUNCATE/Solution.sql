-- 1. DDL: Create table
CREATE TABLE TempUsers (
  id INT PRIMARY KEY,
  username VARCHAR(50)
);

-- 2. DML: Insert data
INSERT INTO TempUsers (id, username) VALUES
(1, 'alice'),
(2, 'bob'),
(3, 'charlie');

-- 3. DML: DELETE specific row
DELETE FROM TempUsers WHERE username = 'bob';

-- 4. DDL: TRUNCATE the table (removes all rows)
TRUNCATE TABLE TempUsers;

-- 5. DDL: DROP the table (removes table definition itself)
DROP TABLE TempUsers;

# Explanation:
# - DELETE removes selected rows using WHERE.
# - TRUNCATE removes all rows efficiently, but retains structure.
# - DROP deletes the entire table and its structure.
