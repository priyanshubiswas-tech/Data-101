## 📘 Short Notes: WHERE vs HAVING Clause in SQL

### 🔹 WHERE Clause
- Filters **rows** **before** any grouping or aggregation.
- Can be used with any SELECT, UPDATE, DELETE query.
- Cannot be used with aggregate functions like `SUM()`, `AVG()`, etc.

**Syntax:**
```sql
SELECT * FROM table
WHERE condition;
```

---

### 🔹 HAVING Clause
- Filters **groups** **after** `GROUP BY` is applied.
- Can be used **only with GROUP BY** or aggregates.
- Can filter on aggregate functions like `COUNT()`, `SUM()`, etc.

**Syntax:**
```sql
SELECT column, AGG_FUNC(column)
FROM table
GROUP BY column
HAVING AGG_FUNC(column) condition;
```

---

### 🔁 Summary

| Feature        | WHERE                        | HAVING                      |
|----------------|-------------------------------|------------------------------|
| Filters        | Rows (before grouping)        | Groups (after grouping)      |
| Used with      | SELECT, UPDATE, DELETE        | SELECT + GROUP BY            |
| Aggregate use  | ❌ Not allowed                 | ✅ Allowed                   |
