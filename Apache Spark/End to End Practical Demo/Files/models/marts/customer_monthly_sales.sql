{{ config(materialized='incremental', unique_key='customer_month') }}

WITH monthly_sales AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', order_date) AS month,
    SUM(amount) AS total_sales
  FROM {{ ref('stg_orders') }}
  {% if is_incremental() %}
    WHERE order_date > (SELECT MAX(month) FROM {{ this }})
  {% endif %}
  GROUP BY customer_id, month
)
SELECT
  CONCAT(customer_id, '-', month) AS customer_month,
  customer_id,
  month,
  total_sales
FROM monthly_sales
