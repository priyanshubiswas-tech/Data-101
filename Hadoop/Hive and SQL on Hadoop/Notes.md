# 🐝 Apache Hive & SQL on Hadoop

---

## 📌 What is Hive?

> **Apache Hive** is a data warehouse infrastructure built on top of Hadoop. It provides **SQL-like interface (HiveQL)** to query data stored in **HDFS**.

- Originally developed by **Facebook**
- Converts SQL queries into **MapReduce**, **Tez**, or **Spark jobs**
- Ideal for **batch processing and analytics**

---

## 🧠 Why Use Hive?

| Feature               | Description                                      |
|------------------------|--------------------------------------------------|
| SQL-like Language      | HiveQL is similar to SQL (easy for analysts)     |
| Works on HDFS          | Query data directly from Hadoop Distributed FS   |
| Schema on Read         | Define schema during querying, not data load     |
| Extensible             | Supports UDFs, SerDes, and more                  |

---

## 🏗️ Hive Architecture (Flow)

```
          🧑‍💻 User
             ⬇️
        Hive CLI / Beeline / JDBC
             ⬇️
         HiveQL Parser
             ⬇️
     Compiler & Optimizer
             ⬇️
      Execution Engine
         (MapReduce / Tez / Spark)
             ⬇️
            HDFS
```

---

## 🧾 Hive vs RDBMS

| Feature         | Hive                        | RDBMS                     |
|------------------|-----------------------------|----------------------------|
| Language         | HiveQL                      | SQL                        |
| Storage          | HDFS                        | Disk (RDBMS files)         |
| Schema Type      | Schema-on-Read              | Schema-on-Write            |
| Transactions     | Limited (ACID on ORC only)  | Full support               |
| Processing       | Batch (MR/Tez/Spark)        | Row-based real-time        |
| Speed            | Slower                      | Faster for OLTP            |

---

## 🛠️ HiveQL Syntax Examples

### 📁 Database & Table

```sql
-- Create Database
CREATE DATABASE IF NOT EXISTS sales_db;

-- Create Table
CREATE TABLE sales (
  order_id INT,
  product STRING,
  quantity INT,
  price FLOAT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
```

### 📤 Load Data

```sql
-- Upload local file to HDFS first (CLI)
hdfs dfs -put sales.csv /user/hive/warehouse/sales_db.db/sales/

-- Load data into Hive table
LOAD DATA INPATH '/user/hive/warehouse/sales_db.db/sales/sales.csv'
INTO TABLE sales;
```

### 🔎 Querying Data

```sql
-- Basic Select
SELECT * FROM sales LIMIT 10;

-- Aggregation
SELECT product, SUM(quantity) AS total_sold
FROM sales
GROUP BY product
ORDER BY total_sold DESC;
```

---

## 📦 File Formats in Hive

| Format    | Features                              |
|-----------|----------------------------------------|
| TextFile  | Default, human-readable, inefficient   |
| ORC       | Optimized for Hive, supports indexing  |
| Parquet   | Columnar, great with Spark/Impala      |
| AVRO      | Row-based, good for schema evolution   |

---

## ⚙️ Execution Engines in Hive

| Engine       | Description                             |
|--------------|-----------------------------------------|
| **MapReduce**| Default (older)                         |
| **Tez**      | DAG-based engine, faster than MR        |
| **Spark**    | In-memory, fastest for iterative jobs   |

**How to switch execution engine:**

```sql
-- Set to Tez
SET hive.execution.engine=tez;

-- Set to Spark
SET hive.execution.engine=spark;
```

---

## 🔗 Connect Hive to Applications

| Tool        | Method              |
|-------------|---------------------|
| Beeline     | CLI with JDBC       |
| JDBC Driver | For Java, Python    |
| HiveServer2 | Enables client apps |
| ODBC        | For BI tools        |

### ▶️ Beeline Example

```bash
beeline -u jdbc:hive2://localhost:10000
```

---

## 📝 Sample Use Case Flow

```
1️⃣ Data Ingestion (CSV → HDFS)
2️⃣ Table Creation (in Hive)
3️⃣ Load Data into Table
4️⃣ Use HiveQL for querying/aggregates
5️⃣ Connect to BI tools via JDBC/ODBC
```

---

## ✅ When to Use Hive

✅ Analytical queries over big datasets  
✅ SQL users familiar with querying  
✅ Need to abstract away MapReduce logic  
🚫 Not suitable for low-latency needs (use Impala/Presto for that)

---

## 🛠️ Common Hive Commands Cheat Sheet

```sql
-- Show Databases
SHOW DATABASES;

-- Use a Database
USE sales_db;

-- Show Tables
SHOW TABLES;

-- Describe Table
DESCRIBE sales;

-- Drop Table
DROP TABLE IF EXISTS sales;
```
