# 🔍 Spark SQL & Query Optimization

---

## 📌 What is Spark SQL?

> **Spark SQL** is a module for structured data processing using SQL queries, DataFrames, and Datasets. It provides a distributed SQL engine that supports ANSI SQL syntax.

### 💡 Why Use It?
- Express complex logic using familiar **SQL**
- Optimized query execution with **Catalyst** & **Tungsten**
- Unified access to data from multiple sources (Hive, Parquet, JDBC, Kafka, etc.)

---

## 🧱 Spark SQL Architecture

```
         📥 Data Sources (CSV, Parquet, Hive, JDBC, Kafka)
                          ↓
               🔄 Spark Catalyst Optimizer
                          ↓
             Logical Plan → Optimized Plan → Physical Plan
                          ↓
                 🔧 Tungsten Execution Engine
                          ↓
                    🧪 Output (DataFrame/Result)
```

---

## 🧰 Common Syntax

### 📄 Read Data as DataFrame

```python
# CSV
df = spark.read.csv("file.csv", header=True, inferSchema=True)

# Parquet
df = spark.read.parquet("file.parquet")

# Hive Table
df = spark.sql("SELECT * FROM my_table")
```

### 🧪 Run SQL Queries

```python
df.createOrReplaceTempView("people")

result = spark.sql("""
    SELECT name, AVG(age) as avg_age
    FROM people
    WHERE city = 'Delhi'
    GROUP BY name
""")

result.show()
```

---

## 📘 Spark SQL Functions

| Category     | Functions                               |
|--------------|------------------------------------------|
| **String**   | `concat`, `substr`, `lower`, `upper`     |
| **Date/Time**| `current_date()`, `datediff()`, `month()`|
| **Agg**      | `count`, `avg`, `sum`, `min`, `max`      |
| **Window**   | `row_number()`, `rank()`, `dense_rank()` |

---

## ⚡ Performance Optimization Techniques

| Tip                                 | Benefit                                              |
|-------------------------------------|------------------------------------------------------|
| ✅ **Pushdown Filters**             | Reduces data read from disk                          |
| ✅ **Predicate Pushdown** (Parquet) | Filters early, less I/O                              |
| 🧠 **Broadcast Join**               | Avoids expensive shuffle when one table is small     |
| 📦 **Caching**                      | Stores intermediate data in memory                   |
| 🧼 **Partition Pruning**            | Skips reading unneeded partitions                    |
| 🧪 **Use Parquet/ORC**              | Columnar formats, faster for Spark                   |
| ⛓️ **Avoid UDFs**                  | Harder to optimize, use built-in functions instead   |
| 🎯 **Repartition smartly**          | Avoid skewed shuffles and too many small files       |
| 🔁 **Use Explain Plan**             | Analyze query plan with `.explain(True)`             |

---

## 🧠 Catalyst Optimizer (Spark's Brain)

> Catalyst is Spark’s extensible **query optimization engine**.

### Steps:
1. **Parse SQL** → Logical Plan
2. **Analyze** → Resolve attributes/types
3. **Optimize** → Constant folding, predicate pushdown, etc.
4. **Physical Plan** → Code generation

---

## 🔍 EXPLAIN Query Plan

```python
result.explain(True)
```

> Shows the full query execution plan — helps you understand how Spark executes your logic.

---

## 💾 Caching & Persistence

```python
df.cache()        # Stores in memory
df.persist()      # Use MEMORY_AND_DISK, etc.
df.unpersist()
```

> Great for iterative algorithms, reused DataFrames.

---

## 🧠 Broadcast Join

```python
from pyspark.sql.functions import broadcast

# Small table should be broadcasted
result = df1.join(broadcast(df2), "id")
```

✅ Use when one table is small → avoids shuffle → much faster

---

## 🔄 Partitioning Tips

```python
# Partitioned read
df = spark.read.option("basePath", "/data") \
     .parquet("/data/year=2024/month=05/")

# Repartition before large join
df = df.repartition("id")
```

---

## 🧪 Window Functions Example

```python
from pyspark.sql.window import Window
from pyspark.sql.functions import row_number

w = Window.partitionBy("dept").orderBy("salary")

df.withColumn("rank", row_number().over(w)).show()
```

---

## 📊 Real-world SQL Flow with Spark

```
1️⃣ Source: Hive / Kafka / Parquet
           ↓
2️⃣ Read into DataFrame (spark.read)
           ↓
3️⃣ Transform via SQL (views + spark.sql)
           ↓
4️⃣ Optimize (broadcast, cache, explain)
           ↓
5️⃣ Sink: Save to DW / Output to Dashboard
```

---

## 🔧 Useful Configurations

```python
spark.conf.set("spark.sql.shuffle.partitions", 200)
spark.conf.set("spark.sql.autoBroadcastJoinThreshold", 10*1024*1024)  # 10MB
```

---

## 🚀 Best Practices

| Best Practice                     | Why                                                   |
|----------------------------------|--------------------------------------------------------|
| Use `.explain(True)`             | Debug performance                                      |
| Reuse SparkSession               | Avoid overhead                                         |
| Avoid shuffling unnecessarily    | Reduces time/memory usage                              |
| Always cache reused DFs          | Speeds up iterative queries                            |
| Avoid complex UDFs               | Catalyst can't optimize them                           |

---

## ✅ Summary

- Spark SQL = Powerful SQL engine + Catalyst Optimizer
- Write SQL-like logic on distributed DataFrames
- Combine with Hive, Kafka, JDBC, Parquet, etc.
- Optimize with broadcast, caching, repartition, explain plans


