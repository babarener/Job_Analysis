# Job Analysis SQL Project

## 📂 Dataset (Download Required)

The dataset used in this project is not stored in the repository.  
Please download the CSV file from the following link and place it in the `data/` folder:

🔗 **Download CSV:** https://drive.google.com/drive/folders/1moeWYoUtUklJO6NJdWo9OV8zWjRn0rjN

Make sure the file path in `sql_load/3_modify_tables.sql` matches the location where you store the CSV.

---

This project provides a complete SQL workflow for building a job-market analysis database, loading data, and running analytical queries to extract insights about skills, salaries, and job demand.

The project consists of two main modules:

- **`sql_load/`** — scripts for creating the database, creating tables, and loading data  
- **`Job_analysis/`** — analytical SQL queries used to understand trends in job postings  

---

## 📁 Project Structure

    .
    ├── README.md
    ├── sql_load/
    │   ├── 1_create_database.sql
    │   ├── 2_create_tables.sql
    │   ├── 3_modify_tables.sql
    │
    └── Job_analysis/
        ├── optimal_skills.sql
        ├── top_demanded_skills.sql
        ├── top_paying_jobs.sql
        ├── top_paying_jobs_skills.sql
        └── top_paying_skills_among_all_jobs.sql

---

## 🧱 1. SQL Load Pipeline (`sql_load/`)

These scripts must be executed **in numerical order** to initialize the database.

### 1. `1_create_database.sql`

Creates the main database used throughout the project.

### 2. `2_create_tables.sql`

Defines the core schema:

- Job_postings_fact
- Skills_job_dim
- Skills_dim  
- company_dim

### 3. `3_modify_tables.sql`

Handles data loading and table updates:

- Inserts raw job posting data  
- Performs cleaning or normalization steps  
- Adds additional constraints or improves table structure  

---

## 📊 2. Analysis Queries (`Job_analysis/`)

This folder contains SQL queries that answer specific analytical questions.

### `optimal_skills.sql`

Identifies skills that maximize both earning potential and market demand.

### `top_demanded_skills.sql`

Finds the most requested skills across job postings.

### `top_paying_jobs.sql`

Returns the job titles with the highest advertised salaries.

### `top_paying_jobs_skills.sql`

Shows high-paying jobs with their associated required skills.

### `top_paying_skills_among_all_jobs.sql`

Ranks skills based on the salaries of job postings that require them.


---

## 🚀 Usage Example

Below is a typical workflow for running this project using **PostgreSQL**.

### 1. Create the database

    psql -U <username> -f sql_load/1_create_database.sql

### 2. Create all tables

    psql -U <username> -d job_analysis -f sql_load/2_create_tables.sql

### 3. Load data and apply modifications

    psql -U <username> -d job_analysis -f sql_load/3_modify_tables.sql

### 4. Run an analysis query

Example: find the most demanded skills.

    psql -U <username> -d job_analysis -f Job_analysis/top_demanded_skills.sql

Example: find the highest-paying skills across all jobs.

    psql -U <username> -d job_analysis -f Job_analysis/top_paying_skills_among_all_jobs.sql

---

## 🎯 Purpose

The goal of this project is to provide a clean, reproducible SQL-based pipeline for:

- Analyzing job-market trends  
- Identifying in-demand or high-paying skills  
- Comparing salary trends across job categories  
- Supporting data-driven career and education planning  

The project is lightweight and suitable for academic, personal, or professional use.

---

## 📌 Notes

- The dataset is expected to be pre-cleaned or compatible with the schema defined in `sql_load/`.  
- Queries may be easily extended to support dashboards, BI tools, or programmatic pipelines.  
- Works with PostgreSQL, MySQL, or SQLite with minimal modification.

---

## 📄 License

This project is for educational and analytical purposes.


