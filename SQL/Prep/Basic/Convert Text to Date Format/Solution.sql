-- Example for MySQL:
SELECT 
  event_id,
  STR_TO_DATE(event_date_text, '%d-%b-%Y') AS event_date
FROM Events;

-- Example for PostgreSQL:
SELECT 
  event_id,
  TO_DATE(event_date_text, 'DD-Mon-YYYY') AS event_date
FROM Events;

-- Example for SQL Server:
SELECT 
  event_id,
  CONVERT(DATE, event_date_text, 106) AS event_date  -- 106 = dd mon yyyy format
FROM Events;

# Explanation:
# - STR_TO_DATE / TO_DATE parse string to DATE based on the format.
# - The format must match the text pattern exactly.
