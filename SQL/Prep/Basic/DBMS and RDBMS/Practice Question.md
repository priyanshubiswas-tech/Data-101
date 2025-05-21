## 🧠 SQL Practice Question: Customers with More Orders than the Average

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
| 104      | 3           |
| 105      | 3           |
| 106      | 3           |

---

### ❓ Task

Write an SQL query to find the names of customers who placed **more orders than the average number of orders** placed by all customers.
