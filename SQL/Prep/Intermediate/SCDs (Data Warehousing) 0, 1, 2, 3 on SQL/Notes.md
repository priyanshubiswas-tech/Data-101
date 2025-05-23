# 🗃️ SCD (Slowly Changing Dimensions)

## ✅ What is SCD?
SCD refers to **how dimensional data changes slowly over time** in a data warehouse. It tracks historical changes to dimension data.

---

## 🔢 SCD Types

| Type     | Behavior | History Maintained? | Use Case |
|----------|----------|---------------------|----------|
| SCD Type 0 | No change allowed | ❌ No | Immutable attributes (e.g., Date of Birth) |
| SCD Type 1 | Overwrite old data | ❌ No | Correcting errors, no need for history |
| SCD Type 2 | Add a new row | ✅ Yes | Full history tracking |
| SCD Type 3 | Add a new column for previous value | ✅ Partial | Limited history (current + previous) |

---

## 📘 Real-Life Example

| emp_id | name   | city     |
|--------|--------|----------|
| 101    | John   | Mumbai   |

Suppose John moves from Mumbai → Delhi.

- **Type 1**: Just update city to Delhi
- **Type 2**: Add new row with Delhi and mark old as expired
- **Type 3**: Add `previous_city` column to store Mumbai

---

## 🛠️ SQL Syntax Patterns

### 🔁 SCD Type 1 (Overwrite)
```sql
UPDATE employees
SET city = 'Delhi'
WHERE emp_id = 101;
```

---

### 🆕 SCD Type 2 (Insert New + Expire Old)
```sql
-- Step 1: Expire old record
UPDATE employees
SET is_current = 'N',
    end_date = CURRENT_DATE
WHERE emp_id = 101 AND is_current = 'Y';

-- Step 2: Insert new version
INSERT INTO employees (emp_id, name, city, start_date, end_date, is_current)
VALUES (101, 'John', 'Delhi', CURRENT_DATE, NULL, 'Y');
```

---

### 🔀 SCD Type 3 (Track Previous)
```sql
UPDATE employees
SET previous_city = city,
    city = 'Delhi'
WHERE emp_id = 101;
```

---

## 🧠 When to Use What?

| Use Case                        | Recommended SCD Type |
|----------------------------------|------------------------|
| Correcting data, no history      | Type 1                 |
| Tracking complete historical data| Type 2                 |
| Need to store just previous value| Type 3                 |
| No change allowed at all         | Type 0                 |

