# 🐍 Python Programming for Data Engineering

---

## 🔧 Core Concepts (Sequential Flow)

### 1. 🧩 Variables
- Used to **store data**
```python
count = 10
name = "data_engineer"
```

### 2. 🛠 Data Types
| Type     | Example        |
|----------|----------------|
| int      | 10             |
| float    | 12.5           |
| str      | "data"         |
| bool     | True, False    |
| list     | [1, 2, 3]      |
| dict     | {"a": 1}       |

---

### 3. 🔁 Control Flow (If-Else)
```python
if revenue > 1000:
    print("High revenue")
else:
    print("Low revenue")
```

---

### 4. 🔄 Loops

#### For Loop:
```python
for i in range(5):
    print(i)
```

#### While Loop:
```python
i = 0
while i < 5:
    print(i)
    i += 1
```

---

### 5. ⚙️ Functions

#### Syntax:
```python
def function_name(param1, param2):
    # logic
    return result
```

#### Example:
```python
def add(a, b):
    return a + b
```

✅ **Use:** Reusability, Modularity, Testing

---

### 6. 🧰 Common Built-In Functions
| Function    | Use Case              |
|-------------|------------------------|
| `len()`     | Get length             |
| `sum()`     | Sum of elements        |
| `type()`    | Check data type        |
| `str()`, `int()` | Convert types   |
| `sorted()`  | Sort a list            |

---

### 7. 📦 Working with Lists & Dicts

#### List:
```python
data = [10, 20, 30]
data.append(40)
```

#### Dictionary:
```python
info = {"name": "Alice", "age": 25}
print(info["name"])
```

---

### 8. 📁 File Reading & Writing

```python
with open("data.txt", "r") as f:
    lines = f.readlines()

with open("output.txt", "w") as f:
    f.write("Processed data")
```

---

### 9. ❗ Exception Handling

```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")
```

---

### 10. 💬 Logging (instead of print)

```python
import logging
logging.basicConfig(level=logging.INFO)
logging.info("This is a log message")
```

---

## 🧠 Why Python in Data Engineering?

| Reason                     | Benefit                                |
|----------------------------|----------------------------------------|
| Scripting/Automation       | Run ETL jobs, cron scripts             |
| Data Parsing               | Handle JSON, CSV, APIs                 |
| Integration                | Libraries like Pandas, PySpark         |
| Lightweight + Scalable     | Works well in pipelines, workflows     |
