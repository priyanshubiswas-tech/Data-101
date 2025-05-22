# 🐝 Hive + ⚒️ DBT for Data Transformation

---

## 📌 What is DBT?

> **DBT (Data Build Tool)** is a transformation tool that lets you **write SQL code to model, transform, and document your data**. It works by writing modular SQL scripts that run as version-controlled, testable transformations.

- Open-source tool popular in modern data stacks
- Uses SQL + Jinja templating
- Compatible with many data warehouses and engines (Hive, Spark, BigQuery, Snowflake, etc.)

---

## 🤝 Why Use DBT with Hive?

| Benefit                          | Description                                     |
|----------------------------------|-------------------------------------------------|
| ✅ SQL-first                     | Write transformations in HiveQL                |
| ✅ Modular architecture          | Build reusable models with dependencies        |
| ✅ Version control & CI/CD       | Git + dbt = deployable data pipelines          |
| ✅ Automated documentation        | Built-in docs with lineage graphs              |
| ✅ Easy Testing                  | Write tests for NULLs, uniqueness, etc.        |

---

## 🏗️ Hive + DBT: Architecture Flow

```
         🧑‍💻 Analyst writes SQL models
                    ⬇️
              DBT CLI runs models
                    ⬇️
         DBT compiles to HiveQL queries
                    ⬇️
             Queries run on Hive engine
                    ⬇️
         Tables/views created in Hive/HDFS
```

---

## 🧰 Setting Up DBT with Hive (via dbt-spark adapter)

### 🧾 Requirements

- Hive (or Hive on Spark, or Spark thrift server)
- Python + pip
- DBT (via pip)
- `dbt-spark` plugin

### 🛠️ Installation

```bash
# Install dbt with Spark adapter
pip install dbt-spark

# Initialize a dbt project
dbt init hive_project
```

### 🗂️ dbt_project.yml

```yaml
name: 'hive_project'
version: '1.0'
profile: 'hive_profile'
model-paths: ["models"]
```

---

## 🔧 `profiles.yml` Configuration (Spark with Hive)

```yaml
hive_profile:
  target: dev
  outputs:
    dev:
      type: spark
      method: thrift
      schema: default           # Hive database
      host: localhost
      port: 10001               # HiveServer2 port
      user: hive
      connect_timeout: 10
```

> 💡 Make sure your HiveServer2 (via Spark or Hive) is running and accessible.

---

## 🧪 Example DBT Model (SQL Transformation)

### File: `models/sales_summary.sql`

```sql
-- models/sales_summary.sql

SELECT
  product,
  SUM(quantity) AS total_quantity,
  SUM(quantity * price) AS total_revenue
FROM {{ ref('sales') }}
GROUP BY product
```

> The `ref('sales')` points to another model or a source table.

---

## ▶️ Running the DBT Project

```bash
# Compile SQL (optional)
dbt compile

# Run transformations (create tables/views in Hive)
dbt run

# View lineage graph
dbt docs generate
dbt docs serve
```

---

## 🔎 Testing & Documentation

### ✅ Test Example (add in `tests/`)

```yaml
version: 2

models:
  - name: sales_summary
    columns:
      - name: product
        tests:
          - not_null
      - name: total_quantity
        tests:
          - not_null
```

### 📖 Auto Documentation

```bash
dbt docs generate
dbt docs serve  # Opens browser with visual DAG and schema docs
```

---

## 📝 Best Practices

| Practice                  | Tip                                                                 |
|---------------------------|----------------------------------------------------------------------|
| 🔁 Use `ref()`            | For model dependencies                                               |
| 📁 Organize Models        | By staging, intermediate, marts                                      |
| 🧪 Write Tests            | Not null, uniqueness, relationships                                  |
| 📚 Document Everything    | Add descriptions in YAML for auto-docs                              |
| 🔍 Audit Logs             | Use dbt artifacts for tracking changes and job history               |

---

## 🚀 When to Use DBT + Hive?

✅ Batch pipelines  
✅ Transformations over HDFS data  
✅ SQL-based modeling with low overhead  
✅ Version-controlled transformation layers

---

## ⚠️ Limitations

| Limitation          | Note                                     |
|---------------------|------------------------------------------|
| Hive = slower       | Compared to Spark or Presto              |
| Not for streaming   | Use Spark Streaming for that             |
| Schema on Read      | Careful with malformed raw data          |

---

## 🧩 Suggested Project Layout

```
hive_project/
├── dbt_project.yml
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
├── tests/
├── macros/
└── target/
```

---

## 📘 Summary

> Using **DBT with Hive** gives you the power of **structured transformations** and **SQL workflow management** in a traditional Hadoop-based data lake.

---


