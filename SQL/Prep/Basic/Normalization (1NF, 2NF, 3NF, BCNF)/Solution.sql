-- 1. Violation:
-- This table is NOT in 1NF because it stores multiple products in one row.
-- Also, it’s not normalized beyond that (repetition of customer names, etc.)

-- 2. Convert to 3NF:

-- Step 1: Create Customers Table
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100)
);

-- Step 2: Create Orders Table
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Step 3: Create Products Table
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  price INT
);

-- Step 4: Create OrderItems Table (to link orders and products)
CREATE TABLE OrderItems (
  order_id INT,
  product_id INT,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

# Explanation:
# - Step 1 ensures atomicity (1NF): each row has one product.
# - Step 2 removes partial dependency (2NF): customer data is separated.
# - Step 3 and 4 remove transitive dependency (3NF): product data stored separately.
