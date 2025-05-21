## 🧠 SQL Practice Question: Understanding Indexes

Given the `Employees` table:

```sql
CREATE TABLE Employees (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50)
);
```

### ❓ Task

1. Create a **non-clustered index** on the `name` column.
2. Insert the following data:

```sql
(1, 'Alice', 'HR')
(2, 'Bob', 'Engineering')
(3, 'Charlie', 'Marketing')
(4, 'Diana', 'HR')
(5, 'Eve', 'Engineering')
```

3. Write a query to find the employee(s) named 'Diana'.

> Assume the query planner will use the index to speed up lookup.
