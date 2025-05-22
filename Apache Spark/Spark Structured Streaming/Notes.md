# 🔄 Apache Spark Structured Streaming

---

## 📌 What is Spark Structured Streaming?

> **Structured Streaming** is Spark’s scalable and fault-tolerant stream processing engine that lets you work with streaming data using **DataFrame/Dataset API**, like a batch job.

💡 **Write batch-style code, Spark handles it as a stream!**

---

## 📊 Use Cases

| Use Case                      | Example                                      |
|-------------------------------|----------------------------------------------|
| Real-time dashboards          | Streaming sales/orders to dashboard          |
| Event detection               | Anomaly alerts in server logs                |
| Stream ETL pipelines          | Kafka → Clean → HDFS/Parquet                 |
| Real-time ML scoring          | Predict fraud on incoming transactions       |

---

## 🧱 Architecture

```
            🔁 Input Streams (Kafka, Socket, File, etc.)
                          ⬇️
         🔄 Spark Structured Streaming (DF API)
         ⬇️ Transformations (filter, agg, join, etc.)
                      ⬇️
               🔽 Output Sink (console, file, DB, Kafka)
```

---

## ⚙️ Key Concepts

| Term               | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| Input Source        | Kafka, socket, file directory, rate generator                              |
| Trigger             | Defines streaming interval (e.g. every 1 sec)                              |
| Watermarking        | Handles late data in event-time streams                                    |
| Output Modes        | Append, Update, Complete                                                   |
| Sink                | Console, files, Kafka, JDBC, memory, etc.                                  |

---

## 🧪 PySpark Structured Streaming: Example

### 📥 Stream from a File Source

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("StreamingExample") \
    .getOrCreate()

# Read CSV files continuously from directory
df = spark.readStream.option("header", True) \
    .schema("id INT, name STRING, value DOUBLE") \
    .csv("input_dir/")

# Transformation
agg_df = df.groupBy("name").sum("value")

# Output to console
query = agg_df.writeStream \
    .outputMode("complete") \
    .format("console") \
    .start()

query.awaitTermination()
```

---

## 🛠️ Streaming from Kafka

```python
df = spark.readStream \
    .format("kafka") \
    .option("kafka.bootstrap.servers", "localhost:9092") \
    .option("subscribe", "logs") \
    .load()

# Convert value from binary to string
from pyspark.sql.functions import col
df_string = df.selectExpr("CAST(value AS STRING)")

df_string.writeStream \
    .format("console") \
    .start() \
    .awaitTermination()
```

---

## ⏱️ Triggers (Controlling Frequency)

| Type                     | Syntax                                       |
|--------------------------|----------------------------------------------|
| Default (ASAP)          | `.trigger(processingTime="0 seconds")`       |
| Fixed interval          | `.trigger(processingTime="10 seconds")`      |
| One-time batch          | `.trigger(once=True)`                        |

---

## 🧪 Output Modes

| Mode      | Description                                          |
|-----------|------------------------------------------------------|
| **Append**| New rows only (default, fast)                        |
| **Update**| Updated aggregates since last trigger                |
| **Complete**| Recalculates full result every trigger             |

---

## 💦 Watermarking (Handling Late Data)

```python
from pyspark.sql.functions import window

# Add watermark
df = df.withWatermark("event_time", "10 minutes")

# Group by window
df.groupBy(
    window(df.event_time, "5 minutes")
).count()
```

> Ensures state cleanup for old data and prevents unbounded memory growth.

---

## 🗃️ Supported Sinks

| Sink Type   | Example                                |
|-------------|----------------------------------------|
| Console     | `.format("console")`                   |
| Files       | `.format("parquet").option("path", ...)` |
| Kafka       | `.format("kafka")`                     |
| JDBC        | `.format("jdbc")`                      |
| Memory (for test) | `.format("memory").queryName("q")` |

---

## 📦 File Sink with Checkpointing

```python
query = df.writeStream \
    .outputMode("append") \
    .format("parquet") \
    .option("checkpointLocation", "chkpt/") \
    .option("path", "output/") \
    .start()
```

> 🔐 **Checkpointing** ensures state recovery in case of failure.

---

## 🧠 Tips for Production

| Tip                          | Why It Matters                                       |
|------------------------------|------------------------------------------------------|
| ✅ Enable Checkpointing      | Fault tolerance, restarts from failure              |
| ⚠️ Monitor Latency           | Avoid backlogs in processing                        |
| 🧹 Use Watermark             | Prevent memory bloat on late data                   |
| 🚫 Avoid joins w/o watermark | Can cause memory leaks in long runs                 |
| 🔁 Partition output          | Better file management in sinks like HDFS           |

---

## 🚀 Example End-to-End Flow

```
📥 Kafka Topic ("clicks")
        ⬇️
🧠 Spark Streaming Job
  - Parse JSON clicks
  - Group by product_id
  - Aggregate count
        ⬇️
📤 Sink to PostgreSQL Table
```

---

## 🧪 Test Streaming Logic (Memory Sink)

```python
df.writeStream \
  .format("memory") \
  .queryName("my_table") \
  .start()

# You can query the stream like:
spark.sql("SELECT * FROM my_table").show()
```

---

## 📘 Summary

- Spark Structured Streaming lets you process **real-time data like batch**
- Use **DataFrames and SQL APIs** to write simple code
- Supports **Kafka, file, socket**, etc.
- Must handle **watermarking** and **checkpointing**
- Very useful for **real-time pipelines**, **dashboards**, **alerts**


