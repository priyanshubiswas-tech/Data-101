## 📘 Short Notes: Indexing and Clustered Indexing

### 🔹 What is Indexing?
- Indexes are data structures used to **speed up data retrieval** in a table.
- Think of them like a **book's index**: they point to data locations.

---

### 🔹 Types of Indexes

| Type             | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| **Clustered Index** | Sorts and stores the **actual table data** in the index itself.            |
| **Non-clustered Index** | Contains a **pointer to the data** instead of storing data directly.       |

---

### 🔹 Clustered Index
- Each table **can have only one** clustered index.
- The data is **physically sorted** based on the index key.
- Usually created on **Primary Key** by default.

### 🔹 Non-clustered Index
- A separate structure from the table.
- You can create **multiple** non-clustered indexes.
- Contains the indexed column + **row pointer** to actual data.

---

### 🧠 Why Use Indexes?
- Speeds up `SELECT` queries.
- Helps with sorting (`ORDER BY`) and filtering (`WHERE`).
- Slows down `INSERT`, `UPDATE`, `DELETE` slightly (due to maintenance).

---

### 📌 Syntax

```sql
-- Clustered Index (auto with PRIMARY KEY)
CREATE TABLE Employees (
  id INT PRIMARY KEY,  -- creates a clustered index automatically
  name VARCHAR(50)
);

-- Non-clustered Index
CREATE NONCLUSTERED INDEX idx_name ON Employees(name);
```
