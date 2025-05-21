## 📘 Short Notes: Nth Highest Salary in SQL

### 🔹 Real-World Use Case
These questions test your understanding of:
- `LIMIT`, `OFFSET` (MySQL)
- `DENSE_RANK()`, `ROW_NUMBER()` (Standard SQL)
- Subqueries and CTEs

---

### 🔹 Approaches:
| Method        | Description                                       | Portability     |
|---------------|---------------------------------------------------|------------------|
| Subquery      | Simple and supported in most SQL flavors          | ✅ Good          |
| `LIMIT OFFSET`| Easy in MySQL/PostgreSQL                          | ✅ Good (MySQL)  |
| Window Functions | Best for clean, ranked results                  | ✅ Best (Standard SQL) |

---

### 🔹 Tip:
Always understand whether the question asks for:
- The **distinct Nth salary** (`DENSE_RANK`)
- The **Nth row in order** (`ROW_NUMBER`)
