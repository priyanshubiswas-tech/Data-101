## 🧠 SQL Practice Question: Use of Aggregate Functions

Given the `Orders` table:

```sql
CREATE TABLE Orders (
  id INT,
  customer VARCHAR(50),
  amount INT
);
```

### ❓ Task

1. Insert the following data:

```sql
(1, 'Alice', 200)
(2, 'Bob', 500)
(3, 'Alice', 300)
(4, 'Charlie', 100)
(5, 'Bob', 700)
```

2. Write a query to show:
   - Number of orders per customer.
   - Total amount spent per customer.
   - Average order amount per customer.
