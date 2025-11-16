/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are avaliable remotely
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights
*/

select 
    job_id,
    job_title_short,
    c.name as company_name,
    job_title,
    job_location,
    salary_year_avg
from job_postings_fact j
left join company_dim c on j.company_id = c.company_id
where j.job_location = 'Anywhere' AND
      j.salary_year_avg is not NULL AND
      j.job_title_short = 'Data Analyst'
ORDER BY j.salary_year_avg desc
limit 10;


select * from job_postings_fact limit 5