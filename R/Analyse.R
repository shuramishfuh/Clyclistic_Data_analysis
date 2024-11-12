# Load necessary libraries
library(DBI)
library(RSQLite)
library(ggplot2)
library(scales)

# Connect to the SQLite database
db_path <- "cyclistic_bike_data.db"
conn <- dbConnect(SQLite(), dbname = db_path)
day_labels <- c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat")

avg_ride_length <- dbGetQuery(conn, "
SELECT member_casual,
       AVG(ride_length) AS avg_ride_length
FROM bike_trips
GROUP BY member_casual;
")

print(avg_ride_length)

# Average Ride Length Plot
ggplot(avg_ride_length, aes(x = member_casual, y = avg_ride_length, fill = member_casual)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Ride Length by Rider Type", x = "Rider Type", y = "Average Ride Length (minutes)")



# Connect to the SQLite database
db_path <- "cyclistic_bike_data.db"
conn <- dbConnect(SQLite(), dbname = db_path)


ride_frequency_by_day <- dbGetQuery(conn, "
SELECT day_of_week,
       member_casual,
       COUNT(*) AS ride_count
FROM bike_trips
GROUP BY day_of_week, member_casual
ORDER BY day_of_week, member_casual;
")


# Plot with custom formatting
ggplot(ride_frequency_by_day, aes(x = factor(day_of_week, labels = day_labels), y = ride_count, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Ride Frequency by Day of the Week", x = "Day of the Week", y = "Ride Count (Thousands)") +
  scale_y_continuous(labels = comma) +
  theme_minimal()



# Connect to the SQLite database
db_path <- "cyclistic_bike_data.db"
conn <- dbConnect(SQLite(), dbname = db_path)

# Most popular start stations
popular_start_stations <- dbGetQuery(conn, "
SELECT start_station_name,
       member_casual,
       COUNT(*) AS start_count
FROM bike_trips
GROUP BY start_station_name, member_casual
ORDER BY start_count DESC
LIMIT 5;
")

print("Top 5 Start Stations by Rider Type")
print(popular_start_stations)

# Most popular end stations
popular_end_stations <- dbGetQuery(conn, "
SELECT end_station_name,
       member_casual,
       COUNT(*) AS end_count
FROM bike_trips
GROUP BY end_station_name, member_casual
ORDER BY end_count DESC
LIMIT 5;
")

print("Top 5 End Stations by Rider Type")
print(popular_end_stations)


popular_start_stations_filtered <- popular_start_stations %>%
  filter(!is.na(start_station_name))

# Create a histogram for the top 5 start stations by rider type
ggplot(popular_start_stations_filtered, aes(x = reorder(start_station_name, -start_count), y = start_count, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Top 5 Start Stations by Rider Type", x = "Start Station", y = "Ride Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
