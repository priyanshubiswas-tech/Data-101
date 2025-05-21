## 📘 Short Notes: SQL Constraints

### 🔹 What are Constraints?
Constraints are **rules applied to columns** in a table to **enforce data integrity** and ensure valid data entry.

### 🔹 Types of Constraints

1. **PRIMARY KEY**
   - Uniquely identifies each record.
   - Not `NULL`, and must be unique.
   - One per table (can be composite).

2. **FOREIGN KEY**
   - Creates a relationship between two tables.
   - Points to the primary key in another table.

3. **NOT NULL**
   - Ensures a column **cannot have NULL** values.

4. **UNIQUE**
   - Ensures all values in a column are different.
   - Multiple UNIQUE columns allowed per table.

5. **CHECK**
   - Validates values based on a condition.
   - E.g., `CHECK (salary > 0)`

6. **DEFAULT**
   - Assigns a **default value** if no value is provided.

7. **AUTO_INCREMENT / SERIAL (DB-specific)**
   - Automatically increases numeric values (e.g., `id` columns).

---

### 🔧 Syntax Examples

```sql
CREATE TABLE Employees (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  age INT CHECK (age >= 18),
  department_id INT,
  salary DECIMAL(10,2) DEFAULT 30000,
  FOREIGN KEY (department_id) REFERENCES Departments(id)
);
```
