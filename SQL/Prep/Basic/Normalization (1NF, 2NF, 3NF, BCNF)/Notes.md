## 📘 Short Notes: Normalization in SQL

### 🔹 What is Normalization?
- A process of organizing data to **reduce redundancy** and **improve data integrity**.
- Breaks large, complex tables into smaller, related ones using **keys**.
- Each level is called a **Normal Form (NF)**.

---

### 🔹 1NF (First Normal Form)
✅ Rules:
- Atomic values only (no arrays, lists).
- Each record must be **uniquely identifiable**.

❌ Violation:
```text
Customer: John, Phones: 12345, 67890 ← multiple values in one column
```

---

### 🔹 2NF (Second Normal Form)
✅ Rules:
- Must be in 1NF.
- No **partial dependency** on part of a **composite primary key**.

❌ Violation:
```text
(roll_no, subject) → marks  ✅ OK  
roll_no → student_name      ❌ student_name depends only on part of the key
```

---

### 🔹 3NF (Third Normal Form)
✅ Rules:
- Must be in 2NF.
- No **transitive dependency** (non-key depends on another non-key).

❌ Violation:
```text
student_id → dept_id  
dept_id → dept_name  
Then: student_id → dept_name = ❌
```

---

### 🔹 BCNF (Boyce-Codd Normal Form)
✅ Rules:
- Must be in 3NF.
- Every determinant must be a **candidate key**.

⚠️ Even some 3NF tables may not be in BCNF if:
```text
X → Y, but X is not a candidate key
```

---

### 🧠 Why Normalize?
- Prevents **anomalies**: insert, update, delete.
- Improves data consistency and structure.

---

### ⚠️ Trade-Off:
- Too much normalization = more joins = slower queries.
- Often a balance between **3NF/BCNF** and **performance** is needed.
