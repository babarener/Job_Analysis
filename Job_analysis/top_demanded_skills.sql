/*
Question: What are the most in_demand skills for data analysts
- Focus on all job postings
*/


/*
return the top 5 demanding skills in data analyst roles
*/
select
    skills_dim.skills,
    count(job_postings_fact.job_id) as frequency
from job_postings_fact
left join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
left join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_postings_fact.job_title_short = 'Data Analyst'
group by 
    skills
order by 
    frequency desc
limit 5
