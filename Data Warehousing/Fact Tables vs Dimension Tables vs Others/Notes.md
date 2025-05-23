# 🧮 Fact Tables vs Dimension Tables vs Others

---

## 📊 FACT TABLE

### ➕ What is it?
- Contains **measurable, quantitative data** (metrics)
- Surrounded by dimension tables

### 💡 Examples:
- `sales_amount`, `units_sold`, `transaction_count`, `profit`

### 📐 Structure:
- Foreign keys to dimensions
- Numeric, additive data

| sale_id | product_id | customer_id | revenue | quantity |
|---------|------------|-------------|---------|----------|

---

## 🧱 DIMENSION TABLE

### ➕ What is it?
- Describes the **"who, what, when, where"** of facts
- Contains descriptive attributes (textual or categorical)

### 💡 Examples:
- Customer details, product info, store locations, dates

| product_id | product_name | category  |
|------------|--------------|-----------|

| customer_id | name   | gender | city     |
|-------------|--------|--------|----------|

---

## 🧩 OTHER TABLE TYPES

| Table Type     | Purpose                                   | Example                             |
|----------------|-------------------------------------------|-------------------------------------|
| Bridge Table   | Resolves **many-to-many** relationships   | customer-product relationship       |
| Junk Dimension | Combines unrelated flags/attributes       | `is_returned`, `is_gift_wrapped`    |
| Degenerate Dim | Attributes in fact table (e.g. invoice #) | `order_number` in `sales_fact`      |
| Role-Playing   | Same dim used in multiple roles           | Date (order date, ship date, etc.)  |

---

## 🎯 Relationships

```
[Product Dim]     [Customer Dim]     [Time Dim]
      |                  |                  |
      +---------+--------+--------+---------+
                          ↓
                    [Sales Fact Table]
```

---

## 🚦 Fact Table Types

| Type             | Description                         | Example                   |
|------------------|-------------------------------------|---------------------------|
| Transaction Fact | Event-level data (most common)      | Each sale, click, etc.    |
| Snapshot Fact    | Data at regular intervals           | Daily balance             |
| Accumulating Fact| Tracks process (with lifecycle)     | Order from creation to delivery |

---

## 🛠 Tools to Use

| Task                | Tools                             |
|---------------------|-----------------------------------|
| Create tables       | SQL DDL, DBT                      |
| Populate facts      | ETL tools (Airflow, Spark, dbt)   |
| BI Reporting        | Tableau, Power BI, Superset       |
