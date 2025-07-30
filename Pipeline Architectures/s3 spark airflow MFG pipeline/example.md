text
# Example Spark Streaming Script with Aggregation

Save this as `spark_streaming_agg.py`:

from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col, window, count
from pyspark.sql.types import StructType, StructField, StringType, DoubleType, TimestampType

schema = StructType([
StructField("store_id", StringType()),
StructField("sale_amount", DoubleType()),
StructField("timestamp", TimestampType())
])

spark = SparkSession.builder.appName("RetailIngestionAgg").getOrCreate()

Read from Kafka
df = spark.readStream.format("kafka")
.option("kafka.bootstrap.servers", "b-1.kafka-cluster.msk.amazonaws.com:9092")
.option("subscribe", "retail-store-data")
.load()

Parse JSON and select fields
json_df = df.select(from_json(col("value").cast("string"), schema).alias("data")).select("data.*")

Example aggregation: count sales per store per 5-minute window
agg_df = json_df.groupBy(
col("store_id"),
window(col("timestamp"), "5 minutes")
).agg(count("*").alias("transaction_count"))

agg_df.writeStream.format("parquet")
.option("path", "s3://your-bucket/aggregates/")
.option("checkpointLocation", "s3://your-bucket/agg_checkpoints/")
.outputMode("append")
.start()
.awaitTermination()


text

---

# Airflow DAG Using SparkSubmitOperator

Save this as `retail_stream_agg_dag.py` in your Airflow DAGs folder:

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
schedule_interval=None, # Or '@hourly', '@daily', etc.
start_date=datetime(2025, 7, 30),
catchup=False,
tags=["spark", "streaming", "retail"]
) as dag:


text
run_spark_streaming_agg = SparkSubmitOperator(
    task_id="run_spark_streaming_agg",
    application="/path/to/spark_streaming_agg.py",  # Path in worker or mounted volume
    conn_id="spark_default",                        # Configure this Airflow connection
    executor_cores=2,
    executor_memory="4g",
    num_executors=2,
    name="retail_stream_agg_job",
    verbose=True,
    conf={
        "spark.kubernetes.container.image": "your-spark-image:latest",  # For k8s, adjust accordingly
        # Add further Spark configs here
    },
    wait_for_completion=True,
    dag=dag,
)

# Optionally, add validation or S3 checks as downstream tasks here

text

---

## Key Points

- All aggregation logic stays in the Spark script (`spark_streaming_agg.py`).
- The Airflow DAG uses `SparkSubmitOperator` to run the Spark script on the cluster, monitor the job, and handle restarts/retries.
- Adapt the `application` path, `conn_id`, and Spark configuration (`conf`) to fit your deployment environment.
- This pattern cleanly separates processing logic in Spark scripts from orchestration logic in Airflow DAGs.
