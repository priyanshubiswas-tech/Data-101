## 📘 Short Notes: Convert Text to Date in SQL

### 🔹 Why Convert Text to Date?
- Dates stored as strings can’t be used for date functions or comparisons.
- Converting allows sorting, filtering, and calculations on dates.

---

### 🔹 Common Functions

| Database       | Function                              | Description                                  |
|----------------|-------------------------------------|----------------------------------------------|
| MySQL          | `STR_TO_DATE(string, format)`       | Converts string to date based on format      |
| PostgreSQL     | `TO_DATE(string, format)`            | Converts string to date                        |
| SQL Server     | `CAST(string AS DATE)` or `CONVERT(DATE, string, style)` | Converts string to date, style controls format |
| Oracle         | `TO_DATE(string, format)`            | Converts string to date                        |

---

### 🔹 Format Specifiers (Examples)

| Format Symbol | Meaning          | Example               |
|---------------|------------------|-----------------------|
| `%Y` or `YYYY`| 4-digit year     | 2025                  |
| `%m` or `MM`  | 2-digit month    | 05                    |
| `%d` or `DD`  | 2-digit day      | 22                    |
| `%H` or `HH`  | 2-digit hour     | 13                    |
| `%i` or `mm`  | 2-digit minute   | 45                    |
| `%s` or `ss`  | 2-digit second   | 30                    |

---

### 🔹 Example Formats

| Example Date String | Format String (MySQL)    | Format String (PostgreSQL/Oracle) |
|---------------------|-------------------------|------------------------------------|
| `2025-05-22`        | `%Y-%m-%d`              | `YYYY-MM-DD`                       |
| `05/22/2025`        | `%m/%d/%Y`              | `MM/DD/YYYY`                      |
| `22-May-2025`       | `%d-%b-%Y`              | `DD-Mon-YYYY`                    |

