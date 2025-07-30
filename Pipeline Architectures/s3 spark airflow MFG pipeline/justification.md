# Data Pipeline Architecture Overview

## 1. Store Systems (POS/Inventory)
**Tasks/Activities:**
- Collect real-time sales, inventory, and operational data.
- Format and serialize data for transmission (e.g., JSON).
- Connect to Kafka Producer API and transmit messages.

**Tool/Component:**  
Store’s internal application (custom code, POS vendor API, or middleware).

---

## 2. Apache Kafka (MSK or Kubernetes)
**Tasks/Activities:**
- Receives and buffers inbound messages from all store systems.
- Manages topics and partitions for scalability (e.g., one topic per use-case, or partition per store).
- Ensures message durability and availability.
- Handles producer authentication (SSL/TLS, SASL, Kerberos).

**Tool/Component:**  
Apache Kafka (deployed via AWS MSK or as pods on Kubernetes/EKS).

---

## 3. Apache Spark Streaming (Kubernetes/EKS)
**Tasks/Activities:**
- Consumes streaming data from Kafka topics.
- Processes data (e.g., transforms, aggregates, enriches).
- Writes results to S3 in batch intervals (micro-batches).
- Tracks progress via checkpoints.

**Tool/Component:**  
Apache Spark (running on Kubernetes via Spark pods or Operator).

---

## 4. Amazon S3
**Tasks/Activities:**
- Receives processed data from Spark (write).
- Stores data in Parquet, ORC, or CSV format under specified buckets/paths.
- Provides secure, scalable archive and serves as a data lake.

**Tool/Component:**  
Amazon S3 service.

---

## 5. Apache Airflow (Kubernetes/EKS)
**Tasks/Activities:**
- Orchestrates the lifecycle of Spark jobs (start, restart, stop).
- Monitors job completion and re-runs jobs on failure.
- Schedules workflows and can run auxiliary validation/cleanup scripts.

**Tool/Component:**  
Apache Airflow (deployed as pods on Kubernetes/EKS).

---

## 6. AWS IAM
**Tasks/Activities:**
- Provides secure authentication and authorization for service-to-service access (e.g., Spark pods to S3).
- Defines least-privilege policies for each service/component on EKS.

**Tool/Component:**  
AWS IAM roles and policies.

---

## 7. Monitoring: Prometheus & Grafana
**Tasks/Activities:**
- Scrapes operational and application metrics from Kafka, Spark, Airflow, and S3 endpoints.
- Visualizes pipeline health, job failures, throughput, and latency via dashboards.
- Sends alerts on predefined thresholds or failures.

**Tool/Component:**  
Prometheus (data scrapes/metrics), Grafana (visualization/UI).

---

## Summary Table

| Tool/Component       | Main Activities/Tasks                                    |
|----------------------|----------------------------------------------------------|
| **Store System**     | Capture/send data, Kafka produce                         |
| **Kafka (MSK/K8s)**  | Receive/buffer messages, topic management, security      |
| **Spark Streaming**  | Process/transform data, read from Kafka, write to S3     |
| **S3**               | Store processed/parquet data, archive                    |
| **Airflow**          | Start/monitor/schedule Spark jobs, workflow management   |
| **AWS IAM**          | Secure access management for services                    |
| **Prometheus/Grafana** | Metrics collection, visualization, and alerting        |

---

## Data Flow (In short):

[Store System] → Data creation & Kafka produce.
[Kafka] → Ingestion & buffering.
[Spark] → Processing & S3 writing.
[Airflow] → Orchestrating Spark, monitoring workflow.
[S3] → Storage.
[IAM] → Security everywhere.
[Prometheus/Grafana] → Monitoring/alerts.
