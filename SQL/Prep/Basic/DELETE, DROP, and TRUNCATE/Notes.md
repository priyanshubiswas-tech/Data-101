## 📘 Short Notes: DELETE vs DROP vs TRUNCATE

### 🔹 DELETE
- DML command.
- Deletes **specific rows** from a table.
- Can have a `WHERE` clause.
- Can be **rolled back** (if inside a transaction).
- Triggers are fired.

### 🔹 TRUNCATE
- DDL command.
- Deletes **all rows** from a table.
- **Faster** than DELETE (no row-by-row logging).
- Cannot use `WHERE`.
- **Cannot be rolled back** in many systems.
- Resets auto-increment counters.
- Triggers **not** fired.

### 🔹 DROP
- DDL command.
- **Removes the table structure and data** permanently.
- Cannot be rolled back.
- All dependent constraints, indexes, and relationships are removed.

---

| Feature              | DELETE                 | TRUNCATE                | DROP                     |
|----------------------|------------------------|--------------------------|---------------------------|
| Type                 | DML                    | DDL                      | DDL                       |
| Removes              | Rows                   | All rows                 | Entire table              |
| WHERE clause         | ✅ Yes                 | ❌ No                    | ❌ No                     |
| Rollback possible    | ✅ Yes (with transaction) | ❌ No (mostly)          | ❌ No                     |
| Affects structure    | ❌ No                  | ❌ No                    | ✅ Yes                    |
| Triggers fired       | ✅ Yes                 | ❌ No                    | ❌ No                     |
