-- 1. DDL: Create the table
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  price DECIMAL(10, 2)
);

-- 2. DDL: Add a new column
ALTER TABLE Products ADD category VARCHAR(50);

-- 3. DML: Insert records
INSERT INTO Products (product_id, product_name, price, category) VALUES
(1, 'Pen', 1.50, 'Stationery'),
(2, 'Notebook', 3.00, 'Stationery'),
(3, 'Mouse', 10.00, 'Electronics');

-- 4. DML: Update record
UPDATE Products SET price = 1.75 WHERE product_name = 'Pen';

-- 5. DML: Query with condition
SELECT product_name, category
FROM Products
WHERE price > 2;

# Explanation:
# - DDL is used to create and alter the table structure.
# - DML is used to insert, update, and select the data.
# - Final SELECT shows products with price greater than 2.
