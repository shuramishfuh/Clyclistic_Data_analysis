# Cyclistic Data Analysis
**Case Study**: How Does a Bike-Share Navigate Speedy Success?

## Overview
This project analyzes data from Cyclistic, a bike-share company in Chicago, to understand the usage patterns of **casual riders** and **annual members**. The primary goal is to support Cyclistic’s marketing team in converting casual riders into annual members, thereby fostering sustainable growth.

## Business Objective
Cyclistic aims to increase its annual membership base by encouraging casual riders to commit to long-term memberships. By understanding the differences in bike usage between these two groups, the team can design more effective, targeted marketing strategies.

## Table of Contents
1. [Data Source](#data-source)
2. [Business Questions](#business-questions)
3. [Data Preparation](#data-preparation)
4. [Data Analysis](#data-analysis)
5. [Insights and Recommendations](#insights-and-recommendations)
6. [Next Steps](#next-steps)

---

## Data Source
The dataset used for this analysis includes Cyclistic’s historical bike trip data over the past 12 months. It is publicly available [here](https://divvy-tripdata.s3.amazonaws.com/index.html) and provided by Motivate International Inc., which ensures rider privacy by excluding any personally identifiable information (PII).

**Key features of the data include:**
- Trip start and end times
- Start and end station details
- Rider type (casual or member)
- Unique identifiers for rides and bikes

---

## Business Questions
To align with Cyclistic's goals, the following questions were formulated:

### Primary Question
- How do annual members and casual riders use Cyclistic bikes differently?

### Secondary Questions
1. Why might casual riders be encouraged to purchase annual memberships?
2. What digital media strategies could effectively promote memberships to casual riders?

These questions aim to reveal actionable insights that could inform marketing strategies focused on converting casual riders into annual members.

---

## Data Preparation

### Data Organization
The data is organized in monthly CSV files, with each file containing:
- Trip start and end times
- Start and end station names and IDs
- User type (member or casual)
- Unique identifiers for each ride and bike

### Cleaning and Preparation Steps
To ensure high data quality, the following steps were taken:
1. **Combine Monthly Files**: Consolidated all data files into one dataset.
2. **Handle Missing Values**: Removed incomplete records.
3. **Standardize Date and Time**: Ensured a uniform format for all date-time fields.
4. **Create New Columns**: Added fields for `ride_length` and `day_of_week` to facilitate detailed analysis.
5. **Remove Duplicates**: Verified the uniqueness of ride records.
6. **Categorical Standardization**: Unified text formats for rider types and bike types.
7. **Filter Outliers**: Removed extreme ride lengths to focus on typical usage patterns.

---

## Data Analysis

### Objectives
This analysis focused on identifying key differences in usage between casual riders and annual members across three main areas:
1. **Ride Duration**: Comparison of average ride lengths.
2. **Ride Frequency by Day of the Week**: Patterns of bike usage on weekdays vs. weekends.
3. **Popular Stations**: Top starting and ending stations for each rider type.

### Key Metrics
These metrics were used to uncover insights, such as identifying the days and times casual riders are most active and pinpointing popular stations frequented by casual riders. This information is instrumental for marketing planning.

---

## Insights and Recommendations

### Insights
1. **Casual Riders Tend to Take Longer Rides**: Casual riders generally have longer trip durations than members, indicating recreational use.
2. **Weekend Activity for Casual Riders**: Casual riders are more active on weekends, while annual members show a consistent pattern throughout the week, likely due to commuting.
3. **Popular Stations for Casual Riders**: Certain stations, especially those near recreational areas, attract more casual riders, which could be targeted for marketing initiatives.

### Recommendations
1. **Weekend Promotions**: Create promotions targeted at casual riders during weekends to encourage membership sign-ups.
2. **Targeted Advertising at Popular Stations**: Place ads or marketing materials at high-traffic stations for casual riders, highlighting the benefits of membership.
3. **Social Media Campaigns**: Develop digital campaigns focused on casual rider stories and membership benefits to increase awareness.
4. **Email Marketing**: Send personalized emails to casual riders, emphasizing the cost savings and advantages of annual membership.

---

## Next Steps

1. **Implement Campaigns**: Launch targeted weekend promotions, advertising at popular stations, and digital campaigns on social media.
2. **Monitor and Evaluate**: Track the performance of these initiatives by measuring membership sign-ups, especially from casual riders.
3. **Optimize Strategies**: Use insights from campaign performance to refine and focus on the most effective methods.

---
