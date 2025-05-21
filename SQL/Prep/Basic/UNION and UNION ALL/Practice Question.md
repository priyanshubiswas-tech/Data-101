## 🧠 SQL Practice Question: UNION vs UNION ALL

Given two tables:

```sql
CREATE TABLE Students_A (
  name VARCHAR(50)
);

CREATE TABLE Students_B (
  name VARCHAR(50)
);
```

### ❓ Task:

1. Insert the following data:

**Students_A**
- Alice
- Bob
- Charlie

**Students_B**
- Bob
- David

2. Write queries using:
   - `UNION` to combine both student lists.
   - `UNION ALL` to include all students (including duplicates).

3. Explain the difference in output.
