-- 1. Insert data
INSERT INTO Students_A (name) VALUES 
('Alice'), ('Bob'), ('Charlie');

INSERT INTO Students_B (name) VALUES 
('Bob'), ('David');

-- 2. Using UNION (removes duplicates)
SELECT name FROM Students_A
UNION
SELECT name FROM Students_B;

-- 3. Using UNION ALL (includes duplicates)
SELECT name FROM Students_A
UNION ALL
SELECT name FROM Students_B;

# Explanation:
# - UNION removes the duplicate "Bob", so it appears only once.
# - UNION ALL keeps both "Bob" entries.
