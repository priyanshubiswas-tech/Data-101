-- ⭐ STAR SCHEMA DDL Example

CREATE TABLE sales_fact (
    sale_id INT,
    product_id INT,
    region_id INT,
    time_id INT,
    revenue DECIMAL
);

CREATE TABLE product_dim (
    product_id INT,
    product_name TEXT,
    category TEXT
);

CREATE TABLE region_dim (
    region_id INT,
    region_name TEXT
);

CREATE TABLE time_dim (
    time_id INT,
    date DATE,
    month TEXT,
    year INT
);

-- ❄️ SNOWFLAKE SCHEMA DDL Example

-- Sub-dimension for product
CREATE TABLE category_dim (
    category_id INT,
    category_name TEXT
);

CREATE TABLE product_dim (
    product_id INT,
    product_name TEXT,
    category_id INT
);

-- Fact table remains the same
-- Joins now involve more hops

# Explanation:
# - Star Schema → Simple joins, best for quick insights & BI
# - Snowflake Schema → More joins, but removes data duplication
# - Data Mesh → Not implemented in SQL, but in platform setup; teams manage their own pipelines and interfaces
