## 🧠 SQL Practice Question: List Valid Employees

You are given a table `Employees` created with the following schema:

```sql
CREATE TABLE Employees (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INT CHECK (age >= 18),
  salary DECIMAL(10,2) DEFAULT 30000
);
```

### ❓ Task

Insert data into the `Employees` table. Then write an SQL query to retrieve all employees **whose age and salary both satisfy the constraints** (i.e., valid rows only).

Sample data:
```sql
INSERT INTO Employees (id, name, age, salary) VALUES
(1, 'Alice', 25, 50000),
(2, 'Bob', NULL, 40000),
(3, 'Charlie', 17, 35000),
(4, 'Diana', 30, NULL),
(5, 'Eve', 29, 45000);
```
