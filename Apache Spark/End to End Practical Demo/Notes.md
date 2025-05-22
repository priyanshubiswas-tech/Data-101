# 🚀 Spark SQL + DBT End-to-End Pipeline (With Step-by-Step Links)

---

## 🧠 Use Case: Sales Analytics Pipeline

Goal:
- Read raw orders data
- Clean & transform using DBT on Spark SQL
- Aggregate customer revenue monthly
- Output a reliable, scalable dataset

---

## 📂 Project Structure

```
dbt-spark-sales/
├── models/
│   ├── staging/
│   │   └── stg_orders.sql         # Clean raw data
│   ├── marts/
│   │   └── customer_monthly_sales.sql # Aggregate data
├── seeds/
│   └── customers.csv              # Static dimension data
├── models/schema.yml             # Source + test definitions
├── dbt_project.yml               # DBT project settings
├── profiles.yml                  # Connection to Spark
```

---

## 1️⃣ `profiles.yml` → **Connection to Spark**

```yaml
spark:
  target: dev
  outputs:
    dev:
      type: spark
      method: thrift
      host: localhost
      port: 10001
      schema: analytics
```

✅ **Why Needed**:  
This tells DBT how to connect to your **Spark environment**. All subsequent `dbt run`, `test`, and `seed` commands use this configuration.

---

## 2️⃣ `dbt_project.yml` → **Project Configuration**

```yaml
name: 'dbt_spark_sales'
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

✅ **Why Needed**:  
This sets up the **folder structure and model behavior**. It links to `profiles.yml` and ensures DBT knows where to look for SQL models.

---

## 3️⃣ `models/schema.yml` → **Sources + Tests**

```yaml
version: 2

sources:
  - name: raw
    tables:
      - name: orders

models:
  - name: stg_orders
    columns:
      - name: order_id
        tests:
          - not_null
          - unique
```

✅ **Why Needed**:  
Defines where **raw data comes from** (e.g., Hive table `raw.orders`) and sets up **tests** on your models. This connects your SQL to real upstream data.

---

## 4️⃣ `models/staging/stg_orders.sql` → **Data Cleaning Layer**

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

✅ **Why Needed**:  
Pulls from the raw table and performs basic cleaning.  
🔁 **Feeds into**: the next model (`customer_monthly_sales.sql`) using `{{ ref('stg_orders') }}`.

---

## 5️⃣ `models/marts/customer_monthly_sales.sql` → **Aggregated Report Layer**

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

✅ **Why Needed**:  
Takes **cleaned data from staging layer**, performs aggregation, and materializes a **monthly sales report**.  
Uses **incremental logic** to scale for large datasets.

---

## 6️⃣ `seeds/customers.csv` → **Static Dimension Table**

```csv
customer_id,customer_name
1,Alice
2,Bob
3,Charlie
```

```bash
dbt seed
```

✅ **Why Needed**:  
Loads static CSV data as a Spark table.  
Can be joined with your sales mart later for reporting or enrichment.

---

## 7️⃣ `dbt run` → **Runs the Pipeline**

```bash
dbt run
```

✅ **Why Needed**:  
- Compiles all models
- Executes them in dependency order
- Applies materialization logic (table, view, incremental)

---

## 8️⃣ `dbt test` → **Validates Your Data**

```bash
dbt test
```

✅ **Why Needed**:  
- Ensures model data is accurate and clean
- Enforces constraints like `not_null`, `unique`

---

## 9️⃣ `dbt docs generate` → **Auto Documentation**

```bash
dbt docs generate
dbt docs serve
```

✅ **Why Needed**:  
- Generates a browsable site of your data model
- Helps new team members or analysts understand your transformations

---

## 🔄 Flow Summary Diagram

```
RAW ORDERS TABLE (Hive / Spark Table)
        ↓
schema.yml --> Source definition: {{ source('raw', 'orders') }}
        ↓
stg_orders.sql --> Clean and filter data
        ↓
customer_monthly_sales.sql --> Aggregation logic (monthly revenue)
        ↓
DBT run --> Executes all in dependency order
        ↓
DBT test --> Tests data quality
        ↓
Final: analytics.customer_monthly_sales (Table in Spark)
```

---

## 🧠 Final Notes

- Every SQL model is **linked via ref()** to the previous stage.
- DBT ensures models run in the **correct dependency order**.
- Spark executes the heavy lifting — DBT organizes, tests, and tracks logic.

---

## ✅ Output Example

| customer_id | month     | total_sales |
|-------------|-----------|-------------|
| 1           | 2024-01   | 2000        |
| 2           | 2024-02   | 1500        |

