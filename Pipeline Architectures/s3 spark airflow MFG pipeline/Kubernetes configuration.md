# Kubernetes Architecture for Retail Data Pipeline

## Cluster Overview: Amazon EKS
- **Cluster Name:** `retail-data-pipeline-eks`
- **Node Groups:** 3 node groups with different instance types for workload optimization
- **Total Pods:** 39-58 pods across 5 namespaces
- **Total Resources:** 47-79 CPU cores, 96-160Gi memory, 490Gi storage

## Namespace Structure

### 1. `kafka` Namespace
**Purpose:** Apache Kafka cluster and related components  
**Total Pods:** 8 pods

#### StatefulSets:
- **kafka-broker-0, kafka-broker-1, kafka-broker-2**
  - Replicas: 3 pods
  - Resources: 4 CPU, 8Gi memory each
  - Storage: 100Gi persistent volumes each
  - Ports: 9092 (internal), 9094 (external)

- **kafka-zookeeper-0, kafka-zookeeper-1, kafka-zookeeper-2**
  - Replicas: 3 pods
  - Resources: 2 CPU, 4Gi memory each
  - Storage: 20Gi persistent volumes each
  - Ports: 2181, 2888, 3888

#### Deployments:
- **kafka-schema-registry**
  - Replicas: 2 pods
  - Resources: 1 CPU, 2Gi memory each
  - Ports: 8081

#### Services:
- `kafka-headless-service` (ClusterIP None)
- `kafka-external-service` (LoadBalancer)
- `zookeeper-service` (ClusterIP)
- `schema-registry-service` (ClusterIP)

### 2. `spark` Namespace
**Purpose:** Apache Spark streaming applications  
**Total Pods:** 6-22 pods (auto-scaling)

#### Long-Running Pods:
- **retail-ingestion-driver** (Deployment)
  - Replicas: 1 active + 1 standby pod
  - Resources: 2 CPU, 4Gi memory each
  - Purpose: Main Spark application driver
  - Connects to: Kafka brokers, S3, Airflow

- **spark-operator** (Deployment)
  - Replicas: 1 pod
  - Resources: 1 CPU, 1Gi memory
  - Purpose: Manages Spark application lifecycle

#### Dynamic Pods:
- **retail-ingestion-exec-1, retail-ingestion-exec-2, ..., retail-ingestion-exec-N**
  - Replicas: 5-20 pods (HPA based on CPU > 70%)
  - Resources: 2 CPU, 4Gi memory each
  - Lifecycle: Created/destroyed by Spark driver
  - Purpose: Process Kafka data, write to S3

#### Services:
- `spark-driver-service` (ClusterIP)
- `spark-ui-service` (NodePort)

### 3. `airflow` Namespace
**Purpose:** Apache Airflow workflow orchestration  
**Total Pods:** 10 pods

#### Core Components:
- **airflow-webserver** (Deployment)
  - Replicas: 2 pods
  - Resources: 2 CPU, 4Gi memory each
  - Ports: 8080
  - Purpose: Web UI and REST API

- **airflow-scheduler** (Deployment)
  - Replicas: 2 pods
  - Resources: 2 CPU, 4Gi memory each
  - Purpose: Schedule and monitor DAGs

- **airflow-worker** (Deployment)
  - Replicas: 3 pods (can scale to 10 via HPA)
  - Resources: 4 CPU, 8Gi memory each
  - Purpose: Execute tasks including Spark job submissions

- **airflow-flower** (Deployment)
  - Replicas: 1 pod
  - Resources: 1 CPU, 2Gi memory
  - Ports: 5555
  - Purpose: Monitor Celery workers

#### Data Layer:
- **airflow-postgresql** (StatefulSet)
  - Replicas: 1 pod
  - Resources: 2 CPU, 4Gi memory
  - Storage: 50Gi persistent volume
  - Purpose: Metadata database

- **airflow-redis** (Deployment)
  - Replicas: 1 pod
  - Resources: 1 CPU, 2Gi memory
  - Purpose: Celery message broker

#### Services:
- `airflow-webserver-service` (LoadBalancer)
- `airflow-postgresql-service` (ClusterIP)
- `airflow-redis-service` (ClusterIP)
- `airflow-flower-service` (NodePort)

### 4. `monitoring` Namespace
**Purpose:** Observability and monitoring stack  
**Total Pods:** 5-8 pods

#### Monitoring Stack:
- **prometheus-server** (Deployment)
  - Replicas: 1 pod
  - Resources: 2 CPU, 8Gi memory
  - Storage: 100Gi persistent volume
  - Purpose: Metrics collection and storage

- **grafana** (Deployment)
  - Replicas: 1 pod
  - Resources: 1 CPU, 2Gi memory
  - Ports: 3000
  - Purpose: Metrics visualization and dashboards

- **kafka-exporter** (Deployment)
  - Replicas: 1 pod
  - Resources: 0.5 CPU, 1Gi memory
  - Purpose: Export Kafka metrics to Prometheus

- **node-exporter** (DaemonSet)
  - Replicas: 1 pod per node (3-6 pods total)
  - Resources: 0.2 CPU, 0.5Gi memory each
  - Purpose: Export node-level metrics

#### Services:
- `prometheus-service` (ClusterIP)
- `grafana-service` (LoadBalancer)
- `kafka-exporter-service` (ClusterIP)

### 5. `kube-system` Namespace
**Purpose:** EKS system components (AWS managed)  
**Total Pods:** ~10 pods

#### System Pods:
- **aws-load-balancer-controller** (2 pods)
- **cluster-autoscaler** (1 pod)
- **ebs-csi-controller** (2 pods)
- **coredns** (2 pods)
- **aws-node** (DaemonSet - 1 per node)
- **kube-proxy** (DaemonSet - 1 per node)

## Data Flow Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Store Systems │───▶│  Kafka Brokers   │───▶│ Spark Driver    │
│   (External)    │    │  (kafka ns)      │    │ (spark ns)      │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                                        │
┌─────────────────┐    ┌──────────────────┐           ▼
│   Airflow       │───▶│  Spark Executors │    ┌─────────────────┐
│   Workers       │    │  (spark ns)      │───▶│   Amazon S3     │
│   (airflow ns)  │    │  (auto-scaling)  │    │   (External)    │
└─────────────────┘    └──────────────────┘    └─────────────────┘
        ▲                       ▲
        │              ┌──────────────────┐
        │              │   Prometheus     │
        └──────────────│   (monitoring)   │
                       └──────────────────┘
```

## Resource Allocation Summary

| Namespace | Pod Count | CPU Request | Memory Request | Storage |
|-----------|-----------|-------------|----------------|---------|
| `kafka` | 8 pods | 16 CPU | 32Gi | 340Gi |
| `spark` | 6-22 pods | 12-44 CPU | 24-88Gi | - |
| `airflow` | 10 pods | 13 CPU | 25Gi | 50Gi |
| `monitoring` | 5-8 pods | 4.2 CPU | 11.5Gi | 100Gi |
| `kube-system` | ~10 pods | 2 CPU | 4Gi | - |
| **TOTAL** | **39-58 pods** | **47-79 CPU** | **96.5-160.5Gi** | **490Gi** |

## Auto-Scaling Configuration

### Horizontal Pod Autoscaler (HPA)
- **Spark Executors:** 5-20 pods (trigger: CPU > 70%)
- **Airflow Workers:** 3-10 pods (trigger: CPU > 80%)
- **Kafka Brokers:** Fixed at 3 pods (no auto-scaling)

### Cluster Autoscaler
- **Node Scaling:** 3-15 nodes based on pod resource requests
- **Instance Types:**
  - `m5.2xlarge` (general workloads)
  - `c5.4xlarge` (compute-intensive)
  - `r5.2xlarge` (memory-intensive)

## Key Implementation Details

### Spark on Kubernetes
- **Driver Pod:** Long-running in `spark` namespace
- **Executor Pods:** Dynamically created/destroyed by driver
- **Dynamic Allocation:** Enabled for cost optimization
- **Checkpoints:** Stored in S3 for fault tolerance
- **Job Submission:** Via SparkKubernetesOperator from Airflow

### Airflow Integration
- **Job Orchestration:** SparkKubernetesOperator submits jobs to K8s API
- **Monitoring:** Tracks Spark application status via K8s API
- **Failure Handling:** Automatic retry logic for failed jobs
- **DAG Management:** Continuous monitoring and scheduling

### Security Configuration
- **IRSA (IAM Roles for Service Accounts):** Each namespace has specific AWS IAM roles
- **Network Policies:** Restrict inter-pod communication
- **SSL/TLS:** All internal communication encrypted
- **RBAC:** Role-based access control for all components

### Storage Strategy
- **Kafka:** Persistent volumes for data durability
- **Spark:** Stateless executors, checkpoints in S3
- **Airflow:** PostgreSQL with persistent storage
- **Monitoring:** Prometheus data on persistent volumes

## Deployment Commands

### Namespace Creation
```bash
kubectl create namespace kafka
kubectl create namespace spark
kubectl create namespace airflow
kubectl create namespace monitoring
```

### Component Deployment
```bash
# Kafka (using Strimzi operator)
helm install kafka strimzi/strimzi-kafka-operator --namespace kafka

# Spark (using Spark operator)
helm install spark-operator spark-operator/spark-operator --namespace spark

# Airflow (using official Helm chart)
helm install airflow apache-airflow/airflow --namespace airflow

# Monitoring (using kube-prometheus-stack)
helm install monitoring prometheus-community/kube-prometheus-stack --namespace monitoring
```

This architecture provides a robust, scalable, and fault-tolerant data pipeline that can handle real-time ingestion from multiple retail stores while maintaining high availability and observability.
