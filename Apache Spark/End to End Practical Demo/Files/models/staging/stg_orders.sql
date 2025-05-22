WITH renamed AS (
  SELECT
    order_id,
    customer_id,
    CAST(order_date AS DATE) AS order_date,
    amount
  FROM {{ source('raw', 'orders') }}
)
SELECT *
FROM renamed
WHERE order_date IS NOT NULL
