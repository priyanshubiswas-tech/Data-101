# 🤝 SQL JOINS: Types, Syntax, and Uses

## 🔗 What are JOINS?
- JOINS are used to combine rows from two or more tables based on a related column.

---

## 🧩 Types of JOINS with Visual Flow

### 1. 🔄 INNER JOIN  
✔️ Returns **only rows that have matching values in both tables**

```
   Table A           Table B
  +--------+        +--------+
  |   1    |        |   1    |
  |   2    |        |   2    |
  |   3    |        |   4    |
  +--------+        +--------+

     INNER JOIN (Only common values)
     Result → [ 1, 2 ]
```

```sql
SELECT a.*, b.*
FROM A a
INNER JOIN B b ON a.id = b.id;
```

---

### 2. ⬅️ LEFT JOIN  
✔️ All records from **Left Table** + Matching from Right

```
   Table A           Table B
  +--------+        +--------+
  |   1    |        |   1    |
  |   2    |        |   2    |
  |   3    |        |   4    |
  +--------+        +--------+

     LEFT JOIN (Keep all A)
     Result → [ (1,1), (2,2), (3,NULL) ]
```

```sql
SELECT a.*, b.*
FROM A a
LEFT JOIN B b ON a.id = b.id;
```

---

### 3. ➡️ RIGHT JOIN  
✔️ All records from **Right Table** + Matching from Left

```
   Table A           Table B
  +--------+        +--------+
  |   1    |        |   1    |
  |   2    |        |   2    |
  |   3    |        |   4    |
  +--------+        +--------+

     RIGHT JOIN (Keep all B)
     Result → [ (1,1), (2,2), (NULL,4) ]
```

```sql
SELECT a.*, b.*
FROM A a
RIGHT JOIN B b ON a.id = b.id;
```

---

### 4. 🔄 FULL OUTER JOIN  
✔️ All records from **both** tables with NULL where no match

```
   Table A           Table B
  +--------+        +--------+
  |   1    |        |   1    |
  |   2    |        |   2    |
  |   3    |        |   4    |
  +--------+        +--------+

     FULL JOIN (Keep All)
     Result → [ (1,1), (2,2), (3,NULL), (NULL,4) ]
```

```
