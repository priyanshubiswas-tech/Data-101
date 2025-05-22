# 🤖 Apache Spark MLlib (Machine Learning Library)

---

## 📌 What is MLlib?

> **MLlib** is Apache Spark’s scalable machine learning library for performing ML on distributed data using **DataFrames** and **Pipelines**.

### ✅ Why Use MLlib?

- Scalable: Works on distributed clusters
- High-level APIs in **Python, Java, Scala**
- Seamlessly integrated with Spark SQL & DataFrames
- Ready-to-use ML algorithms: Classification, Regression, Clustering, Recommendation

---

## 🧱 MLlib Architecture

```
        🔄 Input Data (Structured DataFrame)
                     ↓
       🔍 Feature Extraction / Transformation
                     ↓
        🏗️ Pipeline (Stages of processing)
                     ↓
           📊 Model Training & Evaluation
                     ↓
               ✅ Predictions
```

---

## 🧠 MLlib Components

| Category           | Examples                                              |
|--------------------|-------------------------------------------------------|
| **Algorithms**      | Logistic Regression, Decision Trees, KMeans           |
| **Feature Transformers** | StringIndexer, VectorAssembler, MinMaxScaler   |
| **Pipelines**       | Combine stages into repeatable flows                 |
| **Evaluators**      | Accuracy, RMSE, F1 Score                              |
| **Persistence**     | Save/load models and pipelines                       |

---

## ⚙️ Core Steps in MLlib

```
1️⃣ Load Data
2️⃣ Clean & Transform Features
3️⃣ Split into Train/Test
4️⃣ Build a Pipeline
5️⃣ Fit the Model
6️⃣ Evaluate & Predict
```

---

## 💻 PySpark MLlib Classification Example

### 🧪 Logistic Regression on a Titanic-style Dataset

```python
from pyspark.sql import SparkSession
from pyspark.ml.classification import LogisticRegression
from pyspark.ml.feature import VectorAssembler, StringIndexer
from pyspark.ml import Pipeline
from pyspark.ml.evaluation import BinaryClassificationEvaluator

spark = SparkSession.builder.appName("MLExample").getOrCreate()

# Load data
df = spark.read.csv("titanic.csv", header=True, inferSchema=True)

# Feature Engineering
indexer = StringIndexer(inputCol="Sex", outputCol="SexIndex")
assembler = VectorAssembler(inputCols=["Pclass", "Age", "SexIndex"], outputCol="features")

# Model
lr = LogisticRegression(featuresCol="features", labelCol="Survived")

# Pipeline
pipeline = Pipeline(stages=[indexer, assembler, lr])

# Split
train, test = df.randomSplit([0.7, 0.3], seed=42)

# Train
model = pipeline.fit(train)

# Predict
predictions = model.transform(test)

# Evaluate
evaluator = BinaryClassificationEvaluator(labelCol="Survived")
print("AUC:", evaluator.evaluate(predictions))
```

---

## 🔄 Common Transformers

| Transformer         | Purpose                          |
|---------------------|----------------------------------|
| `StringIndexer`     | Categorical → Numeric             |
| `OneHotEncoder`     | One-hot encode categorical       |
| `VectorAssembler`   | Combine features into vector     |
| `StandardScaler`    | Normalize features               |
| `MinMaxScaler`      | Scale between 0 and 1            |

---

## 🧠 Algorithms in MLlib

| Type         | Algorithm Examples                        |
|--------------|-------------------------------------------|
| Classification | Logistic Regression, Random Forest      |
| Regression     | Linear Regression, GBTRegressor         |
| Clustering     | KMeans                                   |
| Recommendation | ALS (Matrix Factorization)              |
| NLP             | Tokenizer, StopWordsRemover             |

---

## 📈 Evaluation Metrics

| Task           | Evaluator Class                       | Metric Name       |
|----------------|----------------------------------------|-------------------|
| Classification | `BinaryClassificationEvaluator`        | "areaUnderROC"    |
| Regression     | `RegressionEvaluator`                  | "rmse", "r2"      |
| Clustering     | Manual Silhouette Score (custom)       | N/A               |

---

## 🧪 Linear Regression Example

```python
from pyspark.ml.regression import LinearRegression

lr = LinearRegression(featuresCol="features", labelCol="price")
model = lr.fit(train_data)
predictions = model.transform(test_data)
```

---

## 🧱 Pipeline Structure

```
[Raw Data] 
   ↓
[StringIndexer] → [VectorAssembler] → [Model Estimator]
   ↓
[Trained Model + Predictions]
```

### Sample Pipeline Build

```python
from pyspark.ml import Pipeline
pipeline = Pipeline(stages=[indexer, assembler, lr])
model = pipeline.fit(train)
```

---

## 💾 Save and Load Models

```python
# Save
model.write().overwrite().save("logistic_model")

# Load
from pyspark.ml.pipeline import PipelineModel
model = PipelineModel.load("logistic_model")
```

---

## 🚀 Real-world MLlib Flow Example

```
🧾 Input: Customer Data (CSV / Hive / Parquet)
     ⬇️
🧹 Clean & Transform (StringIndexer, VectorAssembler)
     ⬇️
🤖 Train Model (e.g., Random Forest)
     ⬇️
📈 Evaluate (ROC, Accuracy)
     ⬇️
📤 Save Model or Predict New Data
```

---

## ✅ Summary

- **Spark MLlib** = Scalable ML for Big Data
- Use **DataFrames + Pipeline API**
- Supports many common algorithms
- Optimized for distributed training
- Save & reuse models in production


