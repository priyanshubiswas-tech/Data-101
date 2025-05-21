## 📘 Short Notes: DDL vs DML in SQL

### 🔹 DDL (Data Definition Language)
- Deals with the **structure/schema** of database objects.
- Affects the table **definition**, not the data.
- Auto-commits (can’t be rolled back in many systems).

#### 🛠 Common DDL Commands:
- `CREATE` – creates new tables/databases.
- `ALTER` – modifies existing tables.
- `DROP` – deletes tables/databases.
- `TRUNCATE` – deletes all data in a table but not the table itself.
- `RENAME` – renames a table.

---

### 🔹 DML (Data Manipulation Language)
- Deals with the **data** inside tables.
- Can be **rolled back** if inside a transaction.

#### 📥 Common DML Commands:
- `SELECT` – retrieves data.
- `INSERT` – adds
