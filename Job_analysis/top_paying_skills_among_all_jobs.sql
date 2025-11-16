/*
Question: What are the top skills based on salary?

*/


select
    skills_dim.skills,
    round(avg(job_postings_fact.salary_year_avg),0) as average_salary
from job_postings_fact
left join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
left join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.salary_year_avg is not NULL
group by 
    skills
order by 
    average_salary desc
limit 20
