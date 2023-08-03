# Fraud Detection 
## Identifying potential fraudulent transactions 

In this review I wil be analyzing historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

** Note data was provided by data-provider. 

### Data Model

Using the data provided by the data-provider, reviewed the csv files and diagramed the tables along with their respective relationships. 

![Fraud Detection Database Relationship Diagram (DRD)](Pictures/Fraud_detection_ERD.png)

### Data Analysis

All data analysis was conducted in the Challenge.ipynb post creating a pgAdmin PostgreSQL database named "fraud_detection". The Data Model above was used to map out database schema for imported csv data provided by the data-provider.

Findings based on questions:
  Part 1
  - Analyze small transactions; specifically less than $2.00
      Isolated (or group) the transactions of each cardholder?
  
  Count the transactions that are less than $2.00 per cardholder.
  
  Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
  
  Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.
  What are the top 100 highest transactions made between 7:00 am and 9:00 am?
  
  Do you see any anomalous transactions that could be fraudulent?
  
  Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
  
  If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.
  
  What are the top 5 merchants prone to being hacked using small transactions?
  Create a view for each of your queries.

### Resources
- PostgreSQL 15 database
- Jupyter Lab
- UC Berkeley Fintech BootCamp resources and materials

### 
