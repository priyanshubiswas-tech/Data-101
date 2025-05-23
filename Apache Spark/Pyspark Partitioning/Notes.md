# ⚙️ PySpark Partitioning

---

## 🧠 What is Partitioning?
Partitioning in PySpark is the way data is split across **multiple nodes/executors** in a cluster.

- Enables **parallelism**
- Controls how data is distributed during processing or writing

---

## 🔄 Types of Partitioning

| Type             | Used In                 | Purpose                              | How |
|------------------|--------------------------|--------------------------------------|-----|
| **Shuffle Partitioning** | DataFrames / Transformations | Re-partition during wide operations (joins, groupBy) | `repartition()` |
| **Hash Partitioning**    | DataFrames                | Distribute by a column hash         | `partitionBy()` in `write()` |
| **Range Partitioning**   | Bucketing (not directly exposed) | Split into ranges                 | Rarely used directly |
| **File Partitioning**    | File write (Parquet/CSV)   | Store data in partitioned folders   | `partitionBy()` on write |

---

## 📂 File Partitioning Example

```python
df.write.partitionBy("country", "year").parquet("output_path")
```

- Data will be saved like:
  ```
  output_path/country=IN/year=2023/part-0001.parquet
  ```

---

## 🛠 Useful Methods

| Method             | Use Case                              |
|--------------------|----------------------------------------|
| `df.repartition(n)`| Repartition to `n` partitions (shuffle)|
| `df.coalesce(n)`   | Reduce to `n` partitions (no shuffle)  |
| `partitionBy()`    | File system partitioning when writing  |
| `rdd.getNumPartitions()` | Check current partition count     |

---

## ⚠️ Best Practices

- Use `repartition()` before heavy operations (joins, groupBy)
- Use `coalesce()` before writing large files to reduce shuffle
- Always `partitionBy()` important columns when writing to Data Lake
