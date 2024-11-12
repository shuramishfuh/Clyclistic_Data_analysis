# Load necessary libraries
library(DBI)
library(RSQLite)

# Connect to the SQLite database
db_path <- "cyclistic_bike_data.db"
conn <- dbConnect(SQLite(), dbname = db_path)

# 1. Remove Rows with Missing Values in Essential Columns
dbExecute(conn, "
DELETE FROM bike_trips
WHERE ride_id IS NULL 
   OR started_at IS NULL 
   OR ended_at IS NULL 
   OR member_casual IS NULL;
")


# 2. Calculate Ride Length and Add as a New Column
# First, add the `ride_length` column if it does not exist
dbExecute(conn, "ALTER TABLE bike_trips ADD COLUMN ride_length REAL;")


# Calculate ride length in minutes, and store in `ride_length` column
dbExecute(conn, "
UPDATE bike_trips
SET ride_length = (julianday(ended_at) - julianday(started_at)) * 24 * 60;
")


# 3. Extract Day of the Week from `started_at` and Add as a New Column
# Add the `day_of_week` column if it does not exist
dbExecute(conn, "ALTER TABLE bike_trips ADD COLUMN day_of_week TEXT;")


# Populate the `day_of_week` column
dbExecute(conn, "
UPDATE bike_trips
SET day_of_week = strftime('%w', started_at);
")


# 4. Remove Duplicate Rows Based on `ride_id`
dbExecute(conn, "
DELETE FROM bike_trips
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM bike_trips
    GROUP BY ride_id
);
")



# 5. Standardize `member_casual` Column Values
# Convert entries in `member_casual` to lowercase
dbExecute(conn, "
UPDATE bike_trips
SET member_casual = LOWER(member_casual)
WHERE member_casual IS NOT NULL;
")



# Remove any rows where `member_casual` is not 'member' or 'casual'
dbExecute(conn, "
DELETE FROM bike_trips
WHERE member_casual NOT IN ('member', 'casual');
")



# 6. Validate and Filter `ride_length` Values
# Remove rows with ride lengths that are too short (<= 1 minute) or too long (> 1440 minutes)
dbExecute(conn, "
DELETE FROM bike_trips
WHERE ride_length <= 1 OR ride_length > 1440;
")



# 7. Cross-Reference Station Names and IDs for Consistency
# This query checks for mismatches in `start_station_id` and `start_station_name`
start_mismatches <- dbGetQuery(conn, "
SELECT start_station_id, start_station_name, COUNT(*)
FROM bike_trips
GROUP BY start_station_id, start_station_name
HAVING COUNT(DISTINCT start_station_name) > 1;
")



# This query checks for mismatches in `end_station_id` and `end_station_name`
end_mismatches <- dbGetQuery(conn, "
SELECT end_station_id, end_station_name, COUNT(*)
FROM bike_trips
GROUP BY end_station_id, end_station_name
HAVING COUNT(DISTINCT end_station_name) > 1;
")



# Display any station mismatches for further review
print("Start station mismatches:")
print(start_mismatches)

print("End station mismatches:")
print(end_mismatches)

# Disconnect from the database
dbDisconnect(conn)