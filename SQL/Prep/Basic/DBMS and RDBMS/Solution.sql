SELECT c.name
FROM Customers c
JOIN (
    SELECT customer_id, COUNT(*) AS order_count
    FROM Orders
    GROUP BY customer_id
) o ON c.customer_id = o.customer_id
WHERE o.order_count > (
    SELECT AVG(order_count)
    FROM (
        SELECT customer_id, COUNT(*) AS order_count
        FROM Orders
        GROUP BY customer_id
    ) AS avg_orders
);

# Explanation:
# 1. Inner subquery: Calculates how many orders each customer placed.
# 2. AVG subquery: Finds the average of those order counts.
# 3. Join: Links order count to customer names.
# 4. WHERE: Filters customers with above-average order counts.
