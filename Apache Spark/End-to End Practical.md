# 🚀 End-to-End Project: Spark SQL + DBT for Data Transformation

## 🧠 Use Case: Sales Analytics

We have a **raw orders dataset**, and we want to:
- Clean and transform the data
- Create monthly revenue reports per customer
- Build an incremental pipeline for efficiency

---

## 📂 Project Directory Structure

```
dbt-spark-sales/
├── models/
│   ├── staging/
│   │   └── stg_orders.sql
│   ├── marts/
│   │   └── customer_monthly_sales.sql
├── seeds/
│   └── customers.csv
├── dbt_project.yml
├── profiles.yml
└── README.md
```

---

## 🏗️ Step-by-Step Pipeline Overview

```
📁 Raw Data (Parquet/CSV/Hive)
     ⬇️
🧼 Stage: Clean data (dbt model)
     ⬇️
📊 Mart: Aggregate customer monthly sales
     ⬇️
✅ Test: Validate the output
     ⬇️
📦 Materialized as Tables in Spark
```

---

## 1️⃣ Project Setup

### 📄 `profiles.yml`

```yaml
# ~/.dbt/profiles.yml
spark:
  target: dev
  outputs:
    dev:
      type: spark
      method: thrift
      host: localhost
      port: 10001
      schema: analytics
      threads: 2
```

### 📄 `dbt_project.yml`

```yaml
name: 'dbt_spark_sales'
version: '1.0'
profile: 'spark'

model-paths: ["models"]
seed-paths: ["seeds"]

models:
  dbt_spark_sales:
    staging:
      materialized: view
    marts:
      materialized: table
```

---

## 2️⃣ Stage Model: Clean Orders Data

📄 `models/staging/stg_orders.sql`

```sql
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
```

---

## 3️⃣ Mart Model: Monthly Revenue per Customer

📄 `models/marts/customer_monthly_sales.sql`

```sql
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
```

---

## 4️⃣ Seeds: Static Data Load

📄 `seeds/customers.csv`

```csv
customer_id,customer_name
1,Alice
2,Bob
3,Charlie
```

```bash
dbt seed  # Loads static CSV into Spark
```

---

## 5️⃣ Sources: Link Raw Data

📄 `models/schema.yml`

```yaml
version: 2

sources:
  - name: raw
    tables:
      - name: orders

models:
  - name: stg_orders
    description: "Cleaned order data"
    columns:
      - name: order_id
        tests:
          - not_null
          - unique
  - name: customer_monthly_sales
    description: "Monthly sales per customer"
    columns:
      - name: total_sales
        tests:
          - not_null
```

---

## 6️⃣ Run the Pipeline

```bash
dbt run           # Compiles and runs transformations on Spark SQL
dbt test          # Runs data quality checks
dbt docs generate # Generates documentation site
dbt docs serve    # Serves interactive docs locally
```

---

## ✅ Expected Output

📄 Table: `analytics.customer_monthly_sales`

| customer_id | month     | total_sales |
|-------------|-----------|-------------|
| 1           | 2024-01-01| 2300.00      |
| 2           | 2024-01-01| 1800.00      |
| 3           | 2024-02-01| 1500.00      |

---

## 🧠 Explanation

### 🔄 Why Incremental?

- Large datasets can’t be recomputed each time.
- `is_incremental()` ensures only new data is processed.

### 🎯 Why DBT with Spark?

| Feature           | Benefit                               |
|------------------|----------------------------------------|
| Modularity        | Break SQL into reusable components     |
| Version Control   | Track transformations via Git          |
| Testing           | Assure quality with built-in tests     |
| Scheduling        | Works with Airflow/cron/dbt Cloud      |
| Scalability       | Leverages Spark’s distributed power    |

---

## 🧰 Bonus Tips

- Use `{{ this }}` → refers to current model in Spark
- Use Jinja logic to write dynamic SQL
- Schedule runs using Airflow or Dagster
- Materialize as `table`, `view`, or `incremental`


