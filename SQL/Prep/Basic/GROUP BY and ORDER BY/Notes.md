## 📘 Short Notes: GROUP BY and ORDER BY in SQL

### 🔹 GROUP BY
- Used to **group rows** that have the same values in specified columns.
- Often used with **aggregate functions** like `SUM()`, `AVG()`, `COUNT()`, etc.
- Returns one row per group.

**Syntax:**
```sql
SELECT column, AGG_FUNC(column)
FROM table
GROUP BY column;
```

---

### 🔹 ORDER BY
- Used to **sort the result set** by one or more columns.
- Can sort in **ascending (`ASC`)** or **descending (`DESC`)** order.
- Default is `ASC`.

**Syntax:**
```sql
SELECT column1, column2
FROM table
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC];
```

---

### 🔁 Use Together
You can use `GROUP BY` and `ORDER BY` in the same query.

```sql
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
ORDER BY emp_count DESC;
```
