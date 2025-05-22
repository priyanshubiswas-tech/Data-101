# 🔄 Spark SQL + DBT Transformation Flow

---

## 📌 What is DBT?

> **DBT (Data Build Tool)** is an open-source tool that lets you write modular SQL transformations, manage dependencies, and run your transformation workflows efficiently — all with **version control** and **testing** built-in.

### Why combine DBT with Spark SQL?

- Spark SQL powers big data processing
- DBT organizes and manages SQL transformation logic
- Enables maintainable, tested, and documented pipelines on Spark

---

## 🧱 How Spark SQL + DBT Work Together

```
1️⃣ Raw data → Spark reads data (CSV, Parquet, Hive, etc.)
      ↓
2️⃣ DBT Models (SQL files) run on Spark SQL engine
      ↓
3️⃣ Transformation logic managed by DBT:
    - Select
    - Joins
    - Aggregations
    - CTEs & Macros
      ↓
4️⃣ DBT Runs compile & execute SQL on Spark, materializing tables/views
      ↓
5️⃣ Transformed data stored in Data Warehouse / Data Lake (Delta, Parquet)
```

---

## ⚙️ DBT Key Concepts for Spark

| Concept           | Description                                    |
|-------------------|------------------------------------------------|
| Models            | SQL SELECT queries transformed and materialized |
| Seeds             | Static CSV data loaded into Spark tables       |
| Snapshots         | Track changes over time in source data          |
| Tests             | Assertions on data quality (unique, not null)  |
| Macros            | Reusable SQL snippets or Jinja templates        |
| Sources           | Definitions of upstream data sources             |

---

## 🔧 Setting Up DBT with Spark SQL

```bash
# 1. Install DBT Spark Adapter
pip install dbt-spark

# 2. Sample profiles.yml snippet for Spark Thrift Server
spark:
  target: dev
  outputs:
    dev:
      type: spark
      method: thrift
      host: <spark-thrift-host>
      port: 10001
      schema: default
      token: <optional-token-if-any>
      # or specify connection using "http_path" for Databricks
```

---

## 🧩 Typical DBT Model SQL Example

```sql
-- models/sales_agg.sql
WITH base AS (
    SELECT
        customer_id,
        order_date,
        amount
    FROM {{ source('raw', 'orders') }}
)
SELECT
    customer_id,
    DATE_TRUNC('month', order_date) AS month,
    SUM(amount) AS total_amount
FROM base
GROUP BY customer_id, month
```

---

## 🔄 Running DBT on Spark

```bash
dbt run --profiles-dir ./ --target dev
```

> DBT compiles models into Spark SQL and executes them, creating or replacing tables/views.

---

## 🛠️ DBT + Spark SQL Workflow Summary

| Step            | Description                                          |
|-----------------|------------------------------------------------------|
| Raw data load   | Data ingested and stored in data lake/warehouse      |
| Write SQL models| Use DBT to modularize SQL transformation logic       |
| Run DBT         | Compiles and executes SQL on Spark SQL engine        |
| Materialize     | Tables or views created as final transformed dataset |
| Test & Document | Use DBT testing & docs to validate and explain data  |

---

## 🧠 Best Practices

- Use **incremental models** for large datasets  
- Test data with **unique/not_null constraints**  
- Modularize complex logic with **CTEs and macros**  
- Schedule DBT runs via **Airflow or other orchestrators**  
- Use Spark native formats (Delta Lake) for better performance  

---

## 🧪 Simple Incremental Model Example

```sql
-- models/incremental_orders.sql
{{ config(materialized='incremental', unique_key='order_id') }}

SELECT
  order_id,
  customer_id,
  order_date,
  amount
FROM {{ source('raw', 'orders') }}

{% if is_incremental() %}
  WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}
```

---

## ✅ Summary

- Spark SQL is the execution engine  
- DBT manages SQL transformations and dependencies  
- Supports modular, tested, versioned data pipelines  
- Works seamlessly on large-scale Spark data  

