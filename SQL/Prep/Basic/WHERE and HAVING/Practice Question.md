## 🧠 SQL Practice Question: Filter Rows and Groups

Given the `Sales` table:

```sql
CREATE TABLE Sales (
  id INT,
  employee VARCHAR(50),
  region VARCHAR(50),
  amount INT
);
```

### ❓ Task

1. Insert the following data:

```sql
(1, 'Alice', 'East', 1000)
(2, 'Bob', 'West', 2000)
(3, 'Alice', 'East', 1500)
(4, 'Diana', 'West', 3000)
(5, 'Bob', 'East', 500)
```

2. Write a query to:
   - Filter only rows from the 'East' region.
   - Group by employee.
   - Show total sales amount per employee.
   - Only include those whose total sales exceed 1200.
