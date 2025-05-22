# 🧠 Hadoop in Big Data — Complete Notes

---

## 📌 What is Hadoop?

> Apache Hadoop is an open-source **distributed computing framework** for storing and processing large datasets (Big Data) across clusters of computers using simple programming models.

- Handles **structured, semi-structured, and unstructured data**
- Designed to **scale horizontally**
- Fault-tolerant and cost-effective

---

## 🏗️ Hadoop High-Level Architecture (Flow)

```
                🧑‍💻 Client Applications
                         ⬇️
     +------------------------------------------+
     |           Hadoop Distributed File System |
     |        ➤ NameNode (Master)               |
     |        ➤ DataNodes (Slaves)              |
     +------------------------------------------+
                         ⬇️
     +------------------------------------------+
     |                YARN (Resource Mgmt)      |
     | ➤ ResourceManager  ➤ NodeManager         |
     +------------------------------------------+
                         ⬇️
     +------------------------------------------+
     |           MapReduce / Spark Engine       |
     +------------------------------------------+
```

---

## 🗃️ HDFS (Hadoop Distributed File System)

### 📦 What is HDFS?

HDFS is the **storage layer** of Hadoop, used to store large datasets reliably.

| Component  | Role |
|------------|------|
| **NameNode** | Stores metadata (file names, block locations) |
| **DataNode** | Stores actual data blocks                     |

### 🧩 Key Concepts:

- Files are split into **blocks** (default 128 MB or 256 MB)
- Each block is **replicated (default 3x)** for fault-tolerance
- NameNode manages filesystem namespace; DataNodes store blocks

### 🔧 HDFS Basic Commands

```bash
# Create directory
hdfs dfs -mkdir /mydir

# Upload file to HDFS
hdfs dfs -put myfile.txt /mydir

# Read a file
hdfs dfs -cat /mydir/myfile.txt

# List files
hdfs dfs -ls /mydir

# Remove file
hdfs dfs -rm /mydir/myfile.txt
```

---

## 🧠 MapReduce

MapReduce is Hadoop’s **processing engine** for batch data.

### ⚙️ MapReduce Flow

```
    Input Data (HDFS)
           ⬇️
         Mapper
     (Key-Value Pairs)
           ⬇️
     Shuffle & Sort
           ⬇️
         Reducer
    (Aggregated Results)
           ⬇️
     Output to HDFS
```

### 🧪 Example: Word Count (Pseudo Java Code)

```java
// Mapper
public void map(LongWritable key, Text value, Context context) {
    for (String word : value.toString().split(" ")) {
        context.write(new Text(word), new IntWritable(1));
    }
}

// Reducer
public void reduce(Text key, Iterable<IntWritable> values, Context context) {
    int sum = 0;
    for (IntWritable val : values) {
        sum += val.get();
    }
    context.write(key, new IntWritable(sum));
}
```

---

## 🔗 How to Begin a Hadoop Application (Java)

### 1️⃣ Setup Hadoop Environment
- Install Hadoop
- Configure `core-site.xml`, `hdfs-site.xml`, `mapred-site.xml`, `yarn-site.xml`

### 2️⃣ Compile Java Code
```bash
# Compile Java class
javac -classpath `hadoop classpath` -d wordcount_classes WordCount.java
```

### 3️⃣ Create JAR
```bash
jar -cvf wordcount.jar -C wordcount_classes/ .
```

### 4️⃣ Run Hadoop Job
```bash
hadoop jar wordcount.jar org.example.WordCount /input /output
```

### 5️⃣ View Results
```bash
hdfs dfs -cat /output/part-r-00000
```

---

## ⚔️ Hadoop vs Apache Spark

| Feature         | Hadoop (MapReduce)           | Apache Spark                     |
|-----------------|-------------------------------|----------------------------------|
| Processing      | Disk-based batch processing   | In-memory (faster)               |
| Languages       | Java                          | Scala, Python, Java, R           |
| Speed           | Slower                        | 10x–100x faster                  |
| Use Cases       | Batch jobs                    | Batch + Streaming + ML + Graph   |
| Ease of Use     | Verbose (Java code)           | Easy APIs                        |

---

## 🔥 Hadoop Ecosystem Overview

| Tool     | Function                             |
|----------|--------------------------------------|
| Hive     | SQL-like queries on HDFS             |
| Pig      | Data flow scripts (scripting layer)  |
| HBase    | NoSQL database on HDFS               |
| Sqoop    | RDBMS ↔️ Hadoop data transfer         |
| Flume    | Log ingestion into HDFS              |
| Oozie    | Workflow scheduler                   |
| Zookeeper| Coordination service                 |

---

## 🚀 Use Cases of Hadoop

✅ Clickstream analysis  
✅ Log processing  
✅ ETL pipelines  
✅ Machine learning (w/ Mahout)  
✅ Healthcare, genomics, finance

---

## 📝 Quick Summary

| ✅ Strengths                 | ⚠️ Limitations                  |
|-----------------------------|---------------------------------|
| Scalable (horizontal)       | Slower than Spark               |
| Fault-tolerant (HDFS)       | Complex setup/config            |
| Mature open-source tools    | Not ideal for real-time needs   |

---

