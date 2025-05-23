SELECT 
    p.category,
    c.city,
    SUM(f.revenue) AS total_revenue
FROM 
    sales_fact f
JOIN 
    product_dim p ON f.product_id = p.product_id
JOIN 
    customer_dim c ON f.customer_id = c.customer_id
GROUP BY 
    p.category, c.city;

# Explanation:
# - `sales_fact` is the Fact Table → contains revenue (measurable metric)
# - `product_dim` and `customer_dim` are Dimension Tables → descriptive data
# - Query joins facts with dimensions and aggregates revenue by category & city
