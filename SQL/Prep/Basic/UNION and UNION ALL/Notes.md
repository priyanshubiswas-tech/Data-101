## 📘 Short Notes: UNION vs UNION ALL

### 🔹 What is UNION?
- Combines results from **two or more SELECT statements**.
- **Removes duplicate rows** by default.

### 🔹 What is UNION ALL?
- Same as `UNION`, but **includes all duplicates**.

---

### 🔑 Rules:
- All `SELECT` queries must have:
  - **Same number of columns**.
  - **Same data types** in corresponding columns.
  - **Same order** of columns.

---

### 🧠 Differences:

| Feature         | UNION            | UNION ALL       |
|-----------------|------------------|------------------|
| Duplicates      | Removed           | Included         |
| Speed           | Slower (due to sorting) | Faster          |
| Use case        | When unique results are needed | When full data (including duplicates) is needed |

---

### 📌 Syntax:

```sql
SELECT column1, column2 FROM table1
UNION
SELECT column1, column2 FROM table2;

-- vs

SELECT column1, column2 FROM table1
UNION ALL
SELECT column1, column2 FROM table2;
```
