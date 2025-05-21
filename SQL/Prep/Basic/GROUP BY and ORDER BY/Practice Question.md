## 🧠 SQL Practice Question: Employee Department Summary

Given the `Employees` table:

```sql
CREATE TABLE Employees (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);
```

### ❓ Task

1. Insert the following data:

```sql
(1, 'Alice', 'HR', 4000)
(2, 'Bob', 'Engineering', 6000)
(3, 'Charlie', 'Engineering', 7000)
(4, 'Diana', 'HR', 4500)
(5, 'Eve', 'Marketing', 5000)
```

2. Write a query to:
   - Find total salary paid per department.
   - Sort departments by total salary in descending order.
