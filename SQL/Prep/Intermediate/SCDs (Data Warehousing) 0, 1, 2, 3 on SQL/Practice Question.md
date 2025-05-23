## 🧪 Practice Question

You have a `customers` dimension table as follows:

| customer_id | name   | city     | start_date | end_date | is_current |
|-------------|--------|----------|------------|----------|------------|
| 201         | Alice  | Mumbai   | 2020-01-01 | NULL     | Y          |

Alice moves to Bangalore. Implement this using SCD Type 2 logic.

Write SQL to:
1. Expire the old record
2. Insert a new record with updated city
