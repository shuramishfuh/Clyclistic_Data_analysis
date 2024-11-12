# install.packages("RSQLite")
# install.packages("readr")

# Load libraries
library(RSQLite)
library(readr)

# Define the path to the SQLite database
db_path <- "cyclistic_bike_data.db"

# Step 1: Set Up the Database and Define the Table Structure
# Connect to the SQLite database (or create it if it doesn't exist)
conn <- dbConnect(SQLite(), dbname = db_path)

# Define the table structure
dbExecute(conn, "
CREATE TABLE IF NOT EXISTS bike_trips (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TEXT,
    ended_at TEXT,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat REAL,
    start_lng REAL,
    end_lat REAL,
    end_lng REAL,
    member_casual TEXT
);
")

# Disconnect after table creation
dbDisconnect(conn)

# Step 2: Define a Function to Import CSV Files into the Database
import_csv_to_db <- function(csv_folder_path, db_path = "cyclistic_bike_data.db") {
  # Connect to the SQLite database
  conn <- dbConnect(SQLite(), dbname = db_path)
  
  # List all CSV files in the specified directory
  csv_files <- list.files(path = csv_folder_path, pattern = "*.csv", full.names = TRUE)
  
  # Loop through each CSV file
  for (file_path in csv_files) {
    # Read the CSV file into a data frame
    df <- read_csv(file_path, col_types = cols(.default = "c"))  # Set default columns as character
    
    # Remove rows with duplicate ride_id that already exist in the database
    existing_ids <- dbGetQuery(conn, "SELECT ride_id FROM bike_trips")$ride_id
    df <- df[!df$ride_id %in% existing_ids, ]
    
    # Append non-duplicate data to the database
    if (nrow(df) > 0) {
      dbWriteTable(conn, name = "bike_trips", value = df, append = TRUE, row.names = FALSE)
      cat("Imported", basename(file_path), "into the database.\n")
    } else {
      cat("No new records to import from", basename(file_path), "due to duplicate ride_ids.\n")
    }
  }
  
  # Disconnect from the database
  dbDisconnect(conn)
}

# Step 3: Run the Function to Import Data
# Specify the path to your CSV folder
csv_folder_path <- ""

# Run the function to import data
import_csv_to_db(csv_folder_path)