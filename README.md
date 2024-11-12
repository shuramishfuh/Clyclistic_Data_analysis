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
	•	A combined and cleaned dataset ready for analysis, with added columns for ride length and day of the week.
	•	A description of data sources, including links and privacy considerations, ensuring transparency in the data preparation process.


