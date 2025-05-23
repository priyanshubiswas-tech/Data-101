## 🧠 Question: Employee & Department

You have two tables:

**Employees**

| emp_id | emp_name | dept_id |
|--------|----------|---------|
| 1      | Alice    | 10      |
| 2      | Bob      | 20      |
| 3      | Charlie  | NULL    |
| 4      | David    | 10      |

**Departments**

| dept_id | dept_name     |
|---------|---------------|
| 10      | Engineering   |
| 20      | HR            |
| 30      | Marketing     |

---

### 🎯 Task:
Write an SQL query to list all employees along with their department names. If an employee is not assigned to a department, show `NULL` for department name.
