# 🏢 Data Warehousing for Data Engineering

---

## 📦 What is a Data Warehouse?

A **Data Warehouse (DW)** is a centralized repository that stores integrated, cleaned, and structured data from multiple sources to support **BI**, **analytics**, and **reporting**.

---

## 🔧 Why Use a Data Warehouse?

| Feature                  | Benefit                                     |
|--------------------------|---------------------------------------------|
| Centralized Storage      | All data in one place                       |
| Optimized for Read       | Fast querying and analytics                 |
| Historical Data Support  | Time-based analysis (snapshots, trends)     |
| Schema-Based             | Structured data (Star, Snowflake schemas)   |

---

## 🧱 Core Components of a Data Warehouse

| Component        | Description                                  |
|------------------|----------------------------------------------|
| **Staging Area** | Raw data loaded from sources                 |
| **ETL Layer**    | Extract-Transform-Load processes             |
| **DW Storage**   | Clean, integrated data (fact + dimension)    |
| **Presentation** | BI layer (dashboards, SQL tools)             |

---

## 🌐 Common Tools & Platforms

| Category       | Tools                                |
|----------------|--------------------------------------|
| Cloud DW       | Snowflake, Redshift, BigQuery        |
| ETL / Orchestration | DBT, Airflow, Glue, Matillion   |
| SQL Engines    | Presto, Hive, Trino                  |
| BI Tools       | Superset, Tableau, PowerBI           |

---

## 🧭 Popular Schemas

### ⭐ Star Schema
- Central **Fact Table** connected to **Dimension Tables**
- Simple, fast for querying

### ❄️ Snowflake Schema
- Dimensions are normalized into sub-dimensions
- Saves space, more complex joins

### 🔷 Data Mesh (Distributed Ownership)
- Each domain owns its own data product (decentralized)

---

## 🧱 Fact vs Dimension Tables

| Fact Table           | Dimension Table       |
|----------------------|-----------------------|
| Quantitative data    | Descriptive metadata  |
| Foreign keys only    | Primary keys          |
| e.g. Sales, Revenue  | e.g. Customer, Product|

---

## 📤 ETL vs ELT

| ETL                              | ELT                                 |
|----------------------------------|-------------------------------------|
| Transform before loading         | Load raw data, transform later      |
| Traditional DWs                  | Modern cloud DWs                    |
| Slower for large data            | Faster with powerful compute        |

---

## 🧩 Partitioning & Clustering

| Concept        | Use Case                                 |
|----------------|-------------------------------------------|
| Partitioning   | Divide data by date, region etc.          |
| Clustering     | Organize storage for fast query retrieval |

---

## 🔐 Data Governance in DW

| Practice           | Tools/Concepts                       |
|--------------------|--------------------------------------|
| Access Control      | Roles, Row-level security           |
| Data Quality Checks | DBT tests, Great Expectations       |
| Logging & Auditing  | Airflow logs, CloudWatch, etc.      |
