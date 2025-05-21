-- 1. Insert data into Orders table
INSERT INTO Orders (id, customer, amount) VALUES
(1, 'Alice', 200),
(2, 'Bob', 500),
(3, 'Alice', 300),
(4, 'Charlie', 100),
(5, 'Bob', 700);

-- 2. Use aggregate functions
SELECT 
  customer,
  COUNT(*) AS order_count,
  SUM(amount) AS total_spent,
  AVG(amount) AS avg_order
FROM Orders
GROUP BY customer;

# Explanation:
# - COUNT(*) counts how many orders per customer.
# - SUM(amount) gives the total money spent by each customer.
# - AVG(amount) gives the average order value per customer.
# - GROUP BY ensures aggregation is done per customer.
