# Retail Store Real-Time Data Ingestion Architecture

## Sequential Table of APIs, Services, Platforms, and Tools

| Sequence | Name                     | Type/Category          | Role / Description                                           |
|----------|--------------------------|------------------------|--------------------------------------------------------------|
| 1        | Kafka Producer API       | API                   | Interface for stores (POS/inventory) to send real-time data to Kafka. Supports multiple languages (Java, Python, etc.).            |
| 2        | HTTP/REST API (Optional) | API                   | Middleware gateway API (e.g., AWS API Gateway + Lambda) to forward store data to Kafka using HTTP calls.                            |
| 3        | Apache Kafka             | Service / Platform     | Distributed streaming platform for ingesting and buffering real-time data streams from stores. Deployed on AWS MSK or Kubernetes.   |
| 4        | Kubernetes API           | API                   | Kubernetes orchestration API to deploy and manage Kafka, Spark, Airflow, Prometheus pods, etc., on EKS or other clusters.            |
| 5        | Helm Charts              | Tool                   | Package manager for Kubernetes to deploy Kafka operators, Spark operator, Airflow, etc.                                              |
| 6        | Kafka REST Proxy (Optional) | API               | RESTful interface to Kafka allowing HTTP-based message production/consumption.                                                       |
| 7        | Spark Streaming API      | API                   | Spark's streaming interface to read from Kafka, perform transformations/aggregations, and write results to S3.                      |
| 8        | Apache Spark             | Service / Platform     | Distributed data processing engine running streaming batch jobs in Kubernetes pods.                                                   |
| 9        | Apache Spark-on-K8s Operator | Tool/API          | Kubernetes operator to deploy and manage Spark applications on Kubernetes.                                                             |
| 10       | Amazon S3 API            | API                   | Interface to store processed data output, checkpoints, and aggregates securely on AWS S3 buckets.                                      |
| 11       | Apache Airflow           | Service / Orchestration Tool | Workflow orchestration platform running on Kubernetes to schedule, monitor, and restart Spark jobs and manage pipelines.           |
| 12       | SparkSubmitOperator (Airflow) | Airflow Operator    | Airflow operator to submit and manage Spark jobs lifecycle via Kubernetes API.                                                         |
| 13       | AWS IAM API              | API/Service           | Identity and access management for securely assigning permissions to Kubernetes pods (Spark, Airflow) for accessing S3, Kafka, etc.  |
| 14       | Kafka Admin API          | API                   | Administrative interface to manage Kafka topics, brokers, and monitor health.                                                          |
| 15       | Prometheus API           | Monitoring API        | Metrics collection and scraping API, used to gather metrics from Kafka, Spark, Airflow, etc.                                            |
| 16       | Grafana                  | Monitoring / Visualization Tool | Visualizes metrics scraped by Prometheus in dashboards for latency, throughput, and health monitoring.                            |

## Architecture Flow Summary

This table represents the sequential flow of data and the role of each component in a comprehensive retail store real-time data ingestion pipeline:

1. **Data Ingestion Layer** (1-3): Store systems push data through APIs to Kafka
2. **Infrastructure Layer** (4-6): Kubernetes and tooling manage the platform
3. **Processing Layer** (7-9): Spark processes streaming data from Kafka
4. **Storage Layer** (10): Processed data stored in S3
5. **Orchestration Layer** (11-12): Airflow manages workflow scheduling
6. **Security Layer** (13-14): IAM and admin APIs handle security and management
7. **Monitoring Layer** (15-16): Prometheus and Grafana provide observability
