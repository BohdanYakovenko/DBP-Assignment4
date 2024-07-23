import duckdb
import os

# Define the path to your project directory and data directory
project_dir = 'C:/Users/bohda/Documents/UNIVERSITY/KSE/Database Practice/Assignment 4/transportation_dwh'
data_dir = os.path.join(project_dir, 'data')
db_path = os.path.join(project_dir, 'dev.duckdb')

# Connect to DuckDB
conn = duckdb.connect(db_path)

# Drop existing tables if they exist
conn.execute("DROP TABLE IF EXISTS bookings")
conn.execute("DROP TABLE IF EXISTS customers")
conn.execute("DROP TABLE IF EXISTS routes")
conn.execute("DROP TABLE IF EXISTS staff")
conn.execute("DROP TABLE IF EXISTS vehicles")

# Load CSV files into DuckDB tables
conn.execute(f"CREATE TABLE bookings AS SELECT * FROM read_csv_auto('{os.path.join(data_dir, 'bookings.csv')}')")
conn.execute(f"CREATE TABLE customers AS SELECT * FROM read_csv_auto('{os.path.join(data_dir, 'customers.csv')}')")
conn.execute(f"CREATE TABLE routes AS SELECT * FROM read_csv_auto('{os.path.join(data_dir, 'routes.csv')}')")
conn.execute(f"CREATE TABLE staff AS SELECT * FROM read_csv_auto('{os.path.join(data_dir, 'staff.csv')}')")
conn.execute(f"CREATE TABLE vehicles AS SELECT * FROM read_csv_auto('{os.path.join(data_dir, 'vehicles.csv')}')")

conn.close()
