import logging

# Setup logging
logging.basicConfig(level=logging.INFO)

# Function to filter and process sales
def process_sales(data, region_filter, threshold):
    try:
        filtered = []
        count_above_threshold = 0
        total = 0

        for record in data:
            # Check if record belongs to the region
            if record["region"] == region_filter:
                filtered.append(record)
                total += record["amount"]

                if record["amount"] > threshold:
                    count_above_threshold += 1

        logging.info(f"Filtered Records: {filtered}")
        logging.info(f"Total Revenue: {total}")
        logging.info(f"Count Above Threshold: {count_above_threshold}")

        return total

    except KeyError as e:
        logging.error(f"Missing key in record: {e}")
        return None

# Sample usage
sales_data = [
    {"id": 1, "amount": 200, "region": "East"},
    {"id": 2, "amount": 150, "region": "West"},
    {"id": 3, "amount": 300, "region": "East"},
    {"id": 4, "amount": 100, "region": "South"}
]

# Call the function
process_sales(sales_data, "East", 250)

# Explanation:
# - Function takes parameters: data list, region filter, and amount threshold
# - Loops through each record using `for`
# - Uses `if` to filter and count
# - Returns the total
# - Logs each step for traceability
# - Handles missing keys gracefully with `try-except`
