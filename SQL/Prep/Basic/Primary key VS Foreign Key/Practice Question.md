## 🧠 SQL Practice Question: Find Customers Who Placed Orders

You are given the following tables:

### `Customers`

| customer_id | name    |
|-------------|---------|
| 1           | Alice   |
| 2           | Bob     |
| 3           | Charlie |

### `Orders`

| order_id | customer_id |
|----------|-------------|
| 101      | 1           |
| 102      | 1           |
| 103      | 2           |

---

### ❓ Task

Write an SQL query to retrieve the names of all customers **who have placed at least one order**.

- Assume `customer_id` is the **primary key** in `Customers`.
- `customer_id` in `Orders` is a **foreign key** referencing `Customers`.
