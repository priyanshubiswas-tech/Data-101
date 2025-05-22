# ⚡ Apache Spark — Big Data Engine for Fast Processing

---

## 📌 What is Apache Spark?

> **Apache Spark** is an open-source, distributed data processing engine designed for **speed**, **ease of use**, and **general-purpose analytics** on big data.

- Created at UC Berkeley
- Runs **100x faster** than Hadoop MapReduce in memory
- Supports: Batch, Streaming, ML, Graph processing
- Can run on Hadoop clusters via **YARN**, standalone, Mesos, or Kubernetes

---

## ⚙️ Spark Core Concepts

| Component    | Description                                                     |
|--------------|-----------------------------------------------------------------|
| **RDD**      | Resilient Distributed Dataset (low-level data abstraction)      |
| **DataFrame**| Distributed collection of tabular data with schema (like SQL)   |
| **Dataset**  | Typed DataFrames (Scala/Java)                                   |
| **Spark SQL**| SQL engine for querying structured data                         |
| **Spark MLlib** | Machine learning library                                     |
| **Spark Streaming** | Real-time stream processing                              |
| **GraphX**   | Graph processing framework                                      |

---

## 🏗️ Apache Spark Architecture

```
                🧑‍💻 Driver Program
                      |
         ----------------------------
         |          SparkContext     |
         ----------------------------
                   ⬇️
       Schedulers / DAG / Task division
                   ⬇️
            Workers/Executors
              ⬇️        ⬇️
           Tasks     Cache/Storage
```

- **Driver Program**: The main controller (runs your code)
- **SparkContext**: Connects driver to cluster manager
- **Cluster Manager**: YARN, Standalone, Mesos, Kubernetes
- **Executors**: Workers that run tasks and store data

---

## ⚡ Spark vs Hadoop

| Feature            | Apache Spark                         | Hadoop MapReduce                      |
|--------------------|--------------------------------------|----------------------------------------|
| Speed              | In-memory (very fast)                | Disk-based (slower)                    |
| API                | High-level (PySpark, SQL, MLlib)     | Low-level (Java-based)                 |
| Ease of Use        | Simple with Python, Scala            | Verbose Java                           |
| Fault Tolerance    | Yes (RDD lineage)                    | Yes (data replication)                 |
| Real-Time Support  | Yes (Spark Streaming)                | No                                     |

---

## 🧪 Writing Spark Code — PySpark Basics

### 🔧 Starting Spark Shell

```bash
pyspark  # starts interactive Python shell
```

### 🛠️ PySpark Script Example

```python
from pyspark.sql import SparkSession

# Initialize Spark
spark = SparkSession.builder \
    .appName("SalesSummary") \
    .getOrCreate()

# Load data
df = spark.read.csv("sales.csv", header=True, inferSchema=True)

# Transformation
summary = df.groupBy("product") \
    .agg({"quantity": "sum", "price": "avg"})

# Show result
summary.show()

# Stop Spark
spark.stop()
```

---

## 🗃️ Data Abstractions Comparison

| Type        | Description                   | Use case                      |
|-------------|-------------------------------|-------------------------------|
| **RDD**     | Low-level, object-oriented    | Custom functions, complex ops |
| **DataFrame**| Tabular with schema          | SQL-like transformations      |
| **Dataset** | Typed + compiled              | Scala/Java only               |

---

## 💡 Common PySpark Operations

```python
# Read JSON
df = spark.read.json("data.json")

# Filter
df.filter(df.age > 25).show()

# Select columns
df.select("name", "age").show()

# Create Temp View
df.createOrReplaceTempView("people")

# SQL Query
spark.sql("SELECT * FROM people WHERE age > 30").show()
```

---

## 🔄 Data Processing Flow in Spark

```
1️⃣ Data Source (CSV, JSON, DB, Kafka, HDFS)
          ↓
2️⃣ SparkSession reads into DataFrame
          ↓
3️⃣ Transform (filter, group, join, SQL)
          ↓
4️⃣ Action (show, write, collect)
          ↓
5️⃣ Data Sink (write to DB, file, HDFS)
```

---

## 🔌 Cluster Setup Modes

| Mode         | Description                                |
|--------------|--------------------------------------------|
| Local        | Runs on a single machine                   |
| Standalone   | Cluster managed by Spark itself            |
| YARN         | Hadoop-based cluster manager               |
| Mesos        | General-purpose cluster manager            |
| Kubernetes   | Container orchestration engine             |

---

## 🧱 Deploying a Spark Job

### Step-by-Step Example

1. 📄 Save your PySpark script as `job.py`
2. 🚀 Submit it to Spark cluster:

```bash
spark-submit \
  --master yarn \
  --deploy-mode cluster \
  job.py
```

---

## 🔧 File Formats Supported

| Format    | Feature                    |
|-----------|----------------------------|
| CSV       | Simple, but large size     |
| JSON      | Nested structure supported |
| Parquet   | Columnar, fast, compressed |
| ORC       | Optimized for Hive         |
| Avro      | Schema evolution support   |

---

## ✅ When to Use Spark

- Huge datasets (billions of rows)
- Streaming + batch analytics
- Machine learning at scale
- ETL pipelines for data lakes

---

## ⚠️ When NOT to Use Spark

- Small data (< 1GB) → Use Pandas or SQL
- Low-latency apps → Use Presto or Druid
- Real-time apps → Use Spark + Kafka carefully

---
