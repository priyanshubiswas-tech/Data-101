-- Step 1: Mark old record as expired
UPDATE customers
SET end_date = CURRENT_DATE,
    is_current = 'N'
WHERE customer_id = 201 AND is_current = 'Y';

-- Step 2: Insert the updated row
INSERT INTO customers (customer_id, name, city, start_date, end_date, is_current)
VALUES (201, 'Alice', 'Bangalore', CURRENT_DATE, NULL, 'Y');

# Explanation:
# - SCD Type 2 requires historical tracking
# - Old record is marked inactive with end_date and is_current = 'N'
# - A new row with updated city is inserted and marked active (is_current = 'Y')
