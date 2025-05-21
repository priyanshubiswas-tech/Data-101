## 📘 Short Notes: Aggregate Functions in SQL

### 🔹 What are Aggregate Functions?
- Functions that operate on **a set of values** and return a **single summary value**.
- Commonly used with `GROUP BY`.

### 🔑 Common Aggregate Functions:

| Function     | Description                             |
|--------------|-----------------------------------------|
| `COUNT()`    | Counts the number of rows               |
| `SUM()`      | Adds all values in a column             |
| `AVG()`      | Calculates average of a numeric column  |
| `MAX()`      | Returns the maximum value               |
| `MIN()`      | Returns the minimum value               |

---

### 🧠 Notes:
- Can be used with or without `GROUP BY`.
- `NULL` values are **ignored** in `SUM()`, `AVG()`, `MAX()`, and `MIN()` (but not in `COUNT(*)`).
- You can alias results using `AS`.

**Example:**
```sql
SELECT department, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;
```
