# 🤝 SQL JOINS: Types, Syntax, and Uses

## 🔗 What are JOINS?
- JOINS are used to combine rows from two or more tables based on a related column.

---

## 🧩 Types of JOINS

| Join Type      | Description |
|----------------|-------------|
| **INNER JOIN** | Returns only the matching rows from both tables |
| **LEFT JOIN**  | Returns all rows from the left table, and matching rows from the right |
| **RIGHT JOIN** | Returns all rows from the right table, and matching rows from the left |
| **FULL JOIN**  | Returns all rows when there is a match in one of the tables |
| **CROSS JOIN** | Returns Cartesian product of both tables (every row from A × every row from B) |
| **SELF JOIN**  | Join a table to itself using aliases |

---

## 🔠 Basic Syntax

```sql
-- INNER JOIN
SELECT a.*, b.*
FROM table_a a
INNER JOIN table_b b ON a.id = b.a_id;

-- LEFT JOIN
SELECT a.*, b.*
FROM table_a a
LEFT JOIN table_b b ON a.id = b.a_id;

-- RIGHT JOIN
SELECT a.*, b.*
FROM table_a a
RIGHT JOIN table_b b ON a.id = b.a_id;

-- FULL JOIN
SELECT a.*, b.*
FROM table_a a
FULL OUTER JOIN table_b b ON a.id = b.a_id;

-- CROSS JOIN
SELECT a.*, b.*
FROM table_a a
CROSS JOIN table_b b;
```

---

## 📌 When to Use

- Use **INNER JOIN** when you need only matching records
- Use **LEFT JOIN** when you want all from the left and matches from the right
- Use **RIGHT JOIN** (less common) for right table priority
- Use **FULL JOIN** when you need all rows from both tables
- Use **CROSS JOIN** for generating combinations (rare)
- Use **SELF JOIN** for hierarchical or recursive comparisons
