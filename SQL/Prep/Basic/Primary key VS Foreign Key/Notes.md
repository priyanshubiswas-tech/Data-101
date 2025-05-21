## 📘 Short Notes: Primary Key vs Foreign Key

### 🔹 Primary Key
- A column (or set of columns) that **uniquely identifies** each row in a table.
- Cannot be `NULL` and must be **unique**.
- A table can have **only one primary key** (can be composite — multiple columns).

### 🔹 Foreign Key
- A column in one table that **references the primary key** of another table.
- Used to **enforce relationships** between tables.
- Can have **duplicate values** and can be `NULL` (unless restricted).

| Feature        | Primary Key           | Foreign Key                      |
|----------------|------------------------|-----------------------------------|
| Uniqueness     | Must be unique         | Can be duplicate                 |
| Null allowed   | No                     | Yes (unless restricted)          |
| Purpose        | Identify rows uniquely | Maintain referential integrity   |
| Location       | Same table             | References another table         |
