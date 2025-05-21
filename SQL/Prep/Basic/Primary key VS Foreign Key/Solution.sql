SELECT DISTINCT c.name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

# Explanation:
# 1. Orders.customer_id is a foreign key referring to Customers.customer_id (the primary key).
# 2. We use JOIN to match customers with their orders.
# 3. DISTINCT ensures names are not repeated if customers placed multiple orders.
