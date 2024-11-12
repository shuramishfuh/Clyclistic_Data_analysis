# Clyclistic_Data_analysis
 Case study: How does a bike-share navigate speedy success?
 
 # Get Data 
     https://divvy-tripdata.s3.amazonaws.com/index.html

 # Section 1: Ask

 Business Task
 
 Cyclistic, a bike-share company in Chicago, is focused on expanding its customer base by increasing the number of annual memberships. Currently, the company’s customers fall into two categories:
 	1.	Casual riders who purchase single-ride or full-day passes.
 	2.	Annual members who have committed to year-long memberships.
 
 The company’s director of marketing believes that converting casual riders into annual members will be key to sustainable growth. To support this objective, Cyclistic’s marketing team aims to understand how casual riders and annual members differ in their use of Cyclistic bikes. These insights will guide the development of a targeted marketing strategy focused on converting casual riders into annual members.
 
 Primary Question
 
 The primary question guiding this analysis is:
 	•	How do annual members and casual riders use Cyclistic bikes differently?
 
 Understanding this difference will highlight the unique needs, patterns, and behaviors of each user type, offering insights that could help the team tailor their messaging and outreach to casual riders, encouraging them to commit to an annual membership.
 
 Secondary Questions
 
 While the primary question is the main focus of the analysis, two secondary questions can provide additional context for the marketing strategy:
 	1.	Why would casual riders buy Cyclistic annual memberships? Understanding motivations and barriers will offer insights into potential incentives or messaging that might appeal to casual riders.
 	2.	How can Cyclistic use digital media to influence casual riders to become members? Exploring effective digital media strategies can guide marketing tactics, allowing Cyclistic to reach casual riders where they are most active and receptive.
 
 Key Stakeholders
 
 Key stakeholders for this analysis include:
 	•	Lily Moreno, Director of Marketing: Responsible for developing campaigns to promote the bike-share program, with a focus on increasing memberships.
 	•	Cyclistic Marketing Analytics Team: This team will use the insights to craft a data-driven marketing strategy aimed at casual riders.
 	•	Cyclistic Executive Team: This group, known for its attention to detail, will review the findings and decide whether to approve the recommended marketing approach.
 
 Deliverables for the Ask Phase
 
 The outcomes for this phase are:
 	•	A clear statement of the business task, which includes the primary question guiding the analysis and the intended goals of the marketing team.
 	•	An understanding of stakeholder needs and how the findings will support strategic decision-making.


  
# Section 2: Prepare

Data Source

To analyze the usage patterns of casual riders and annual members, we will use Cyclistic’s historical bike trip data. This dataset includes information about all bike trips taken with Cyclistic bikes over the past 12 months. This data is provided by Motivate International Inc., made publicly available under a license agreement that ensures it can be used for analysis purposes without infringing on data privacy or licensing terms.

The dataset can be accessed through this link: Divvy Trip Data.

Data Organization and Structure

The Cyclistic data is stored in multiple files corresponding to each month of bike trips. Each file contains data on individual rides, including attributes such as:
	•	Trip start and end times
	•	Station locations (start and end points)
	•	Type of user (casual rider or annual member)
	•	Ride ID and bike ID

These files are in CSV format, allowing for flexible use in spreadsheet applications, SQL databases, and R programming environments.

Data Privacy and Security Considerations

Cyclistic prioritizes the privacy and security of its users. To comply with data privacy requirements:
	•	Personally identifiable information (PII) has been excluded from the dataset. This ensures that user privacy is maintained, as there is no link between individual trips and personal information, such as credit card numbers or addresses.
	•	The data provided strictly includes non-identifiable trip details, which allows for behavior analysis without compromising individual privacy.

Data Credibility and Quality Assessment

To ensure that the analysis will be accurate and reliable, the dataset must meet the following credibility standards, encapsulated in the ROCCC framework:
	•	Reliable: The data is provided by Motivate International Inc., a reputable source known for maintaining data quality in bike-sharing systems.
	•	Original: The data comes directly from Cyclistic’s bike-share program, making it firsthand and relevant to the analysis.
	•	Comprehensive: The data spans a full year, offering a comprehensive view of usage patterns across different seasons.
	•	Current: The dataset includes the most recent 12 months, ensuring that the analysis reflects up-to-date rider behavior.
	•	Consistent: The monthly datasets are formatted similarly, facilitating easy consolidation and analysis.

Data Preparation Steps

To prepare the data for analysis, we will undertake the following steps:
	1.	Download and Organize Files: Download each of the 12 monthly CSV files and store them in a dedicated folder for organization.
	2.	Verify File Integrity: Open each file to check for any corrupted data, missing values, or format inconsistencies.
	3.	Combine and Standardize: Merge the monthly files into a single dataset, ensuring consistency across columns (e.g., aligning column headers for each file).
	4.	Create New Columns:
	•	Ride Length: Calculate the duration of each trip by subtracting the start time from the end time.
	•	Day of Week: Extract the day of the week for each ride to analyze patterns by day (e.g., weekday vs. weekend behavior).
	5.	Data Cleaning: Check for and handle any anomalies, such as negative ride lengths, missing station data, or duplicate entries.

Output for the Prepare Phase

The output for this phase will be:

#  Section 3: Process

Data Cleaning Documentation
	1.	Check for Missing Values
	•	Steps:
	•	Identify missing values in key columns, particularly ride_id, started_at, ended_at, and member_casual.
	•	Remove any rows where these essential columns contain missing data, as they are crucial for analysis.
	•	Purpose: Ensures that every record is complete with the necessary fields for calculating ride duration and identifying member types.
	•	Assumptions: Missing values in critical fields cannot be accurately filled or imputed, so they are removed to maintain data integrity.
	2.	Convert Date and Time Columns
	•	Steps:
	•	Convert started_at and ended_at columns to a consistent datetime format (YYYY-MM-DD HH:MM:SS).
	•	Purpose: Consistent datetime formatting allows accurate time calculations, like ride duration and day of the week.
	•	Assumptions: All dates and times are accurate in their original entries, and the conversion does not alter the intended data.
	3.	Calculate Ride Length
	•	Steps:
	•	Create a new column, ride_length, by subtracting started_at from ended_at.
	•	Filter out any records where ride_length is zero or negative, as these are likely data entry errors or test rides.
	•	Purpose: Ride length is a key variable for analyzing usage patterns, so it needs to be accurate. Removing negative and zero values ensures meaningful analysis.
	•	Assumptions: Negative or zero ride lengths are errors and do not represent valid rides.
	4.	Extract Day of the Week
	•	Steps:
	•	Create a day_of_week column derived from the started_at date, showing which day the ride began.
	•	Purpose: Enables analysis of riding patterns by day of the week (e.g., differences between weekday and weekend usage).
	•	Assumptions: The started_at column correctly represents the beginning of each ride.
	5.	Remove Duplicates
	•	Steps:
	•	Check for duplicate entries in the ride_id column.
	•	Remove any duplicates found, as each ride_id should be unique.
	•	Purpose: Ensures that each ride is counted only once in the analysis, preventing skewed results due to repeated entries.
	•	Assumptions: Duplicate ride_id entries are errors or duplications from data collection.
	6.	Standardize Categorical Variables
	•	Steps:
	•	In the member_casual column, standardize entries to lowercase to avoid discrepancies (e.g., Member vs. member).
	•	Ensure that all entries in member_casual match either “member” or “casual.”
	•	Verify consistency in rideable_type values to ensure valid bike types.
	•	Purpose: Standardizing these fields prevents mismatches and enables reliable aggregation and filtering of data.
	•	Assumptions: Any entries that do not match expected values (like “member” or “casual”) are errors and should be corrected or removed.
	7.	Validate and Filter Ride Lengths
	•	Steps:
	•	Review the distribution of ride_length values, filtering out any outliers that are implausibly long or short (e.g., rides over 24 hours).
	•	Purpose: Removing extreme outliers ensures that the analysis focuses on realistic, typical usage patterns.
	•	Assumptions: Extremely long or short ride durations are likely data errors rather than legitimate trips.
	8.	Cross-Reference Station Names and IDs
	•	Steps:
	•	Check for consistency between start_station_name and start_station_id (and similarly for end_station_name and end_station_id).
	•	Resolve any mismatches, if possible, or mark them for further review.
	•	Purpose: Consistency in station information is essential for analyzing popular routes and stations accurately.
	•	Assumptions: Each station ID should correspond to a unique station name, so any mismatch indicates a potential data entry issue.

	•	A combined and cleaned dataset ready for analysis, with added columns for ride length and day of the week.
	•	A description of data sources, including links and privacy considerations, ensuring transparency in the data preparation process.




 

Section 4: Analyze

Objective

The primary objective of this analysis is to explore differences in bike usage patterns between casual riders and annual members. Key areas of focus include:
	1.	Ride duration
	2.	Ride frequency by day of the week
	3.	Popular stations and routes

Key Analysis Metrics

We’ll calculate and analyze the following metrics:
	1.	Average Ride Length: Compare average ride durations for casual riders and annual members.
	2.	Ride Frequency by Day of the Week: Analyze patterns in usage based on the day of the week for each rider type.
	3.	Most Popular Start and End Stations: Identify top stations where rides start and end, broken down by rider type.

SQL Queries for Analysis

1. Calculate Average Ride Length

This query calculates the average ride length for both casual riders and annual members, allowing us to see if there’s a significant difference in duration.

avg_ride_length <- dbGetQuery(conn, "
SELECT member_casual,
       AVG(ride_length) AS avg_ride_length
FROM bike_trips
GROUP BY member_casual;
")

print(avg_ride_length)

2. Ride Frequency by Day of the Week

This query returns the total number of rides for each day of the week, separated by rider type, to identify which days are most popular for casual riders vs. members.

ride_frequency_by_day <- dbGetQuery(conn, "
SELECT day_of_week,
       member_casual,
       COUNT(*) AS ride_count
FROM bike_trips
GROUP BY day_of_week, member_casual
ORDER BY day_of_week, member_casual;
")

print(ride_frequency_by_day)

3. Most Popular Start and End Stations

This query identifies the top 5 start and end stations for both casual riders and annual members.

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

4. Ride Frequency by Hour of the Day

This optional query examines when riders are most active throughout the day, which could be valuable for understanding peak usage times.

ride_frequency_by_hour <- dbGetQuery(conn, "
SELECT strftime('%H', started_at) AS hour,
       member_casual,
       COUNT(*) AS ride_count
FROM bike_trips
GROUP BY hour, member_casual
ORDER BY hour;
")

print(ride_frequency_by_hour)

Summarizing the Analysis

Using the above queries, we can derive insights on:
	•	Average Ride Length: Compare the average ride duration of casual riders and members. Typically, casual riders might have longer rides as they use the service more recreationally.
	•	Ride Frequency by Day: Identify if casual riders are more active on weekends, while annual members might have a more consistent weekday usage pattern.
	•	Popular Stations: Highlight top start and end stations for each group, which could guide marketing efforts at those locations.
	•	Ride Frequency by Hour: Understand peak times of use by hour, helping with resource allocation and scheduling.

Visualizations in R

Once the data is retrieved, you can create visualizations to support these findings. Here are examples of visualizations you might create using ggplot2:

# Load ggplot2 for visualization
library(ggplot2)

# Average Ride Length Plot
ggplot(avg_ride_length, aes(x = member_casual, y = avg_ride_length, fill = member_casual)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Ride Length by Rider Type", x = "Rider Type", y = "Average Ride Length (minutes)")

# Ride Frequency by Day Plot
ggplot(ride_frequency_by_day, aes(x = day_of_week, y = ride_count, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Ride Frequency by Day of the Week", x = "Day of the Week", y = "Ride Count")

# Most Popular Start Stations Plot
ggplot(popular_start_stations, aes(x = reorder(start_station_name, -start_count), y = start_count, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip() +
  labs(title = "Top 5 Start Stations by Rider Type", x = "Start Station", y = "Ride Count")

Interpretation of Results

After running the analysis and visualizing the data, summarize findings in a way that highlights actionable insights:
	•	Casual riders:
	•	Annual members : 
	•	Popular stations :



