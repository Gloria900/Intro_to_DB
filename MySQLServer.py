import mysql.connector
import os

# Get database password from environment variable
DB_PASSWORD = os.getenv("DB_PASSWORD")

# Database connection details
mydb = {
  "host": "localhost",
  "user": "root", 
  "password": DB_PASSWORD,
  "database": "alx_book_store" 
}

# Initialize connection and cursor
connection = None
mycursor = None

try:
  # Connect to the database
  connection = mysql.connector.connect(**mydb)
  print(connection.server_info)
  mycursor = connection.cursor()

  # Execute SQL statements using the execute() method on the cursor
  # Check if database exists
  mycursor.execute("""
    CREATE DATABASE IF NOT EXISTS alx_book_store;
  """)

  print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
  # Error message to handle errors when failing to connect or execute
  print(f"Error connecting to the database or executing query: {err}")

finally:
  # Close connection to the database
  if mycursor:
    mycursor.close()
    print("Database cursor closed.")
  if connection and connection.is_connected():
    connection.close()
    print("Database connection closed.")