# Example Spark Streaming Script with Aggregation and Airflow DAG to Run It

## 1. Example Spark Streaming Script with Aggregation (e.g., windowed count)
Save this as `spark_streaming_agg.py`:

```python
from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col, window, count
from pyspark.sql.types import StructType, StructField, StringType, DoubleType, TimestampType

schema = StructType([
    StructField("store_id", StringType()),
    StructField("sale_amount", DoubleType()),
    StructField("timestamp", TimestampType())
])

spark = SparkSession.builder.appName("RetailIngestionAgg").getOrCreate()

# Read from Kafka
df = spark.readStream.format("kafka") \
    .option("kafka.bootstrap.servers", "b-1.kafka-cluster.msk.amazonaws.com:9092") \
    .option("subscribe", "retail-store-data") \
    .load()

# Parse JSON and select fields
json_df = df.select(from_json(col("value").cast("string"), schema).alias("data")).select("data.*")

# Example aggregation: count sales per store per 5-minute window
agg_df = json_df.groupBy(
    col("store_id"),
    window(col("timestamp"), "5 minutes")
).agg(count("*").alias("transaction_count"))

agg_df.writeStream.format("parquet") \
    .option("path", "s3://your-bucket/aggregates/") \
    .option("checkpointLocation", "s3://your-bucket/agg_checkpoints/") \
    .outputMode("append") \
    .start() \
    .awaitTermination()
```

## 2. Airflow DAG Using SparkSubmitOperator
Save this as `retail_stream_agg_dag.py` in your Airflow DAGs folder:

```python
from airflow import DAG
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
from datetime import datetime, timedelta

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "email_on_failure": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=10),
}

with DAG(
    dag_id="retail_store_stream_aggregation",
    default_args=default_args,
    description="Run Spark streaming job with aggregation from Kafka to S3",
    schedule_interval=None,  # Or '@hourly', '@daily', etc.
    start_date=datetime(2025, 7, 30),
    catchup=False,
    tags=["spark", "streaming", "retail"]
) as dag:

    run_spark_streaming_agg = SparkSubmitOperator(
        task_id="run_spark_streaming_agg",
        application="/path/to/spark_streaming_agg.py",  # Path in worker or mounted volume
        conn_id="spark_default",  # Configure this Airflow connection
        executor_cores=2,
        executor_memory="4g",
        num_executors=2,
        name="retail_stream_agg_job",
        verbose=True,
        conf={
            "spark.kubernetes.container.image": "your-spark-image:latest",  # For k8s, adjust accordingly
            # Add further Spark configs here
        },
        # Set to False if you want the task to succeed regardless of job completion
        wait_for_completion=True,
        dag=dag,
    )

    # Optionally, add validation or S3 checks as downstream tasks here
```

## Key Points
- All aggregation logic stays in the **Spark script** (`spark_streaming_agg.py`).
- The **Airflow DAG** (`retail_stream_agg_dag.py`) uses SparkSubmitOperator to run that script on the cluster, monitor the job, and handle restarts/retries.
- Adapt application, conn_id, and Spark configuration in the DAG to fit your specific deployment environment.
- This pattern encapsulates business logic in Spark scripts, while Airflow manages orchestration and job lifecycle.
