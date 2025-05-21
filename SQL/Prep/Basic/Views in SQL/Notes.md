## 📘 Short Notes: Views in SQL

### 🔹 What is a View?
- A **virtual table** based on the result-set of a SQL query.
- Does **not store data physically**, just the query definition.
- Acts like a saved query that you can treat as a table.

---

### 🔹 Why Use Views?
- Simplify complex queries.
- Provide **data abstraction/security** (show limited columns).
- Reuse common query logic.
- Present data in a specific format without changing the underlying tables.

---

### 🔹 Types of Views
| Type              | Description                                    |
|-------------------|------------------------------------------------|
| Simple View       | Based on a single table, no aggregates.         |
| Complex View      | Uses joins, aggregates, group by, etc.          |

---

### 🔹 Syntax

```sql
-- Create a view
CREATE VIEW ViewName AS
SELECT column1, column2
FROM TableName
WHERE condition;

-- Query the view
SELECT * FROM ViewName;

-- Drop a view
DROP VIEW ViewName;
```

---

### ⚠️ Notes:
- Views are **read-only** by default in many DBMS, but some support **updatable views**.
- Changes to base tables reflect immediately in views.
- Views can improve security by restricting access to sensitive data.
