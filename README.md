# 📌 Project Overview

This project implements a Healthcare Data Warehouse using Microsoft SQL Server.
It demonstrates an end-to-end data warehousing pipeline that loads healthcare data from CSV files, validates and transforms the data, and prepares it for analytical reporting using a 3-layer architecture: Bronze, Silver, and Gold.

The project focuses on healthcare entities such as patients, doctors, appointments, treatments, and billing transactions.

# 🏗️ Data Warehouse Architecture

## The project follows a Medallion-style architecture:

Source CSV Files → Bronze Layer → Silver Layer → Gold Layer

##Bronze Layer:

The Bronze layer stores the raw data as it is received from the source CSV files.

## Source files:

• patients.csv
• doctors.csv
• appointments.csv
• treatments.csv
• billing.csv

The raw data is loaded using SQL Server BULK INSERT through a stored procedure.

## Silver Layer:

The Silver layer contains cleaned and transformed data.

## Examples of transformations include:

• Standardizing gender values (M/F → male/female)
• Trimming unwanted spaces
• Extracting day, month, and year from dates
• Calculating patient age
• Validating primary keys and data quality
• Preparing cleaned data for the analytical layer

## Gold Layer:

The Gold layer is designed for analytics and reporting.

## It contains:

• dim_patients
• dim_doctors
• dim_appointment
• dim_treatments
• dim_date
• dact_billing (billing fact view)

The model follows a Star Schema where the billing fact is connected to the relevant dimensions.

# ⭐ Star Schema

## The main fact view is the billing fact, which connects billing transactions with:

• Patient
• Doctor
• Appointment
• Treatment
• Date

## Fact:

Billing Fact

• bill_key
• appointment_key
• doctor_key
• patient_key
• treatment_key
• bill_date_key
• bill_id
• payment_method
• payment_status
• amount

## Dimensions:

Patient Dimension

• Patient information
• Gender
• Date of birth
• Age
• Contact information
• Insurance information

## Doctor Dimension:

• Doctor information
• Specialization
• Years of experience
• Hospital branch
• Contact information

## Appointment Dimension:

• Appointment information
• Patient and doctor IDs
• Appointment date and time
• Reason for visit
• Appointment status

## Treatment Dimension:

• Treatment information
• Treatment type
• Description
• Cost
• Treatment date

## Date Dimension:

• Full date
• Year
• Quarter
• Month
• Month name
• Week number
• Day
• Day name
• Weekend indicator

# 🔄 ETL Process

## The project follows these main steps:

1. Create the database and schemas
  • Create heathcareDB
  • Create bronze, silver, and gold schemas
2. Create Bronze tables
  • Create raw staging tables for all source datasets
3. Load raw data
  • Use bronze.load_raw_data
  • Load CSV files using BULK INSERT
4. Perform data quality checks
  • Check for null primary keys
  • Check for duplicate IDs
  • Check for unwanted spaces
  • Inspect distinct categorical values
5. Create Silver tables
  • Store cleaned and transformed data
6. Transform and load Silver
  • Standardize values
  • Extract date components
  • Calculate patient age
  • Load cleaned records
7. Create Gold dimensions
  • Generate surrogate keys using ROW_NUMBER()
  • Create analytical dimension views
8. Create Date Dimension
  • Generate a calendar from 2023-01-01 to 2023-12-31
9. Create Billing Fact
  • Join billing data with the required dimensions
  • Build the analytical billing view

## 🧰 Technologies Used

• Microsoft SQL Server
• T-SQL
• SQL Server BULK INSERT
• Stored Procedures
• Views
• CTEs
• Window Functions (ROW_NUMBER)
• Data Quality Checks
• Star Schema
• CSV Files

# 📂 Project Structure

```text
SQL-datawarehouse-healthcare-project/
│
├── appointments.csv
├── billing.csv
├── doctors.csv
├── patients.csv
├── treatments.csv
│
├── haelthcare project DB and schemas (3 layers) creation.sql
├── ddl_bronze_layer_creation_healthcare_project.sql
├── ddl_silver_layer_creation_healthcare_project.sql
│
├── stored procedure bronze layer (bulk insert).sql
├── stored-procedure-silver-layer-healthcare-project.sql
├── the-2-stored-procedures-healthcare-project.sql
│
├── check-patients-and-treatments.sql
├── checking-bronze.doctors.sql
├── checking-data-quality-of-bronze.billing.sql
├── check_the_data_quality_of_each_column_in_the_bronze_layer.sql
│
├── insert-cleaned-data-into-silver.billing.sql
├── insert-into-silver.doctors.sql
├── insert-into-silver.patients.sql
├── insert-into-silver.treatments.sql
├── insert_cleaned_data_after_checking_in_the_silver_appointments.sql
│
├── create_dim_appointments.sql
├── create_dim_date.sql
├── create_dim_doctors.sql
├── create_dim_patients.sql
├── create_dim_treatment.sql
├── create_fact_billing.sql
│
├── healthcare_architecture.png
└── README.md
```

## ▶️ How to Run the Project

1. Create the Database and Schemas

Run:

```sql
haelthcare project DB and schemas (3 layers) creation.sql
```

This creates the database and the three schemas:

```text
bronze
silver
gold
```

2. Create Bronze Tables

Run:

```text
ddl_bronze_layer_creation_healthcare_project.sql
```

3. Create the Bronze Loading Procedure

Run:

```text
stored procedure bronze layer (bulk insert).sql
```

Update the CSV file paths inside the procedure to match the location on your machine.

Then execute:

```sql
EXEC bronze.load_raw_data;
```

4. Perform Data Quality Checks

Run the checking scripts to verify:

• Duplicate IDs
• Null IDs
• Unwanted spaces
• Invalid categorical values

5. Create Silver Tables

Run:

```text
ddl_silver_layer_creation_healthcare_project.sql
```

6. Create and Run the Silver Loading Procedure

Run:

```text
stored-procedure-silver-layer-healthcare-project.sql
```

Then execute:

```sql
EXEC silver.load_silver;
```

7. Create Gold Dimensions

Run:

```text
create_dim_patients.sql
create_dim_doctors.sql
create_dim_appointments.sql
create_dim_treatment.sql
create_dim_date.sql
```

8. Create the Billing Fact

Run:

```text
create_fact_billing.sql
```

The final Gold layer can then be queried for analytical use cases.

────────

# 🔍 Data Quality

Data quality checks were implemented before moving data from Bronze to Silver.

The project checks for:

• Null primary keys
• Duplicate primary keys
• Unwanted leading/trailing spaces
• Standardization of gender values
• Valid categorical values
• Correct date transformations

This ensures that the Gold layer is built from cleaned and validated data.

# 📊 Potential Analytical Questions

The resulting data warehouse can support analysis such as:

• What is the total billing amount?
• What are the most common treatments?
• Which doctors have the highest number of appointments?
• What are the most frequently used payment methods?
• What is the distribution of patients by gender?
• Which hospital branches generate the most billing?
• What are the most common reasons for visits?
• What is the average treatment cost?
• How does billing change over time?

## 🎯 Project Objectives:

The main objectives of this project are to:

• Build a complete SQL Server data warehouse
• Apply a Bronze/Silver/Gold architecture
• Practice ETL development using T-SQL
• Perform data quality validation
• Apply data transformations
• Build dimensions and a fact structure
• Generate surrogate keys
• Create a Date Dimension
• Prepare healthcare data for analytical reporting

## 👩‍💻 Skills Demonstrated

• Data Warehousing
• ETL Development
• SQL Server
• T-SQL
• Data Cleaning
• Data Transformation
• Data Quality
• Dimensional Modeling
• Star Schema
• Fact and Dimension Design
• Stored Procedures
• SQL Views
• Surrogate Keys

## 📷 Architecture

The project includes a visual representation of the healthcare data warehouse architecture:

healthcare_architecture.png
