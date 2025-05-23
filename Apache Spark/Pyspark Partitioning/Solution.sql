# Step 1: Repartition into 10 partitions
sales_df = sales_df.repartition(10)

# Step 2: Write as partitioned Parquet files
sales_df.write.partitionBy("country", "year").parquet("output/sales_data")

# Step 3: Check number of partitions
print(sales_df.rdd.getNumPartitions())

# Explanation:
# - repartition(10): creates 10 partitions for parallel processing
# - partitionBy(): organizes files in directories by country/year
# - getNumPartitions(): confirms the DataFrame partition count
