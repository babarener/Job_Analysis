/*
Answer what are the most optimal skills to learn(high demand and high paying)
*/

with average_salary as (
    select
        skills_dim.skill_id,
        skills_dim.skills,
        round(avg(job_postings_fact.salary_year_avg),0) as average_salary
    from job_postings_fact
    left join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    left join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where 
        job_postings_fact.job_title_short = 'Data Analyst' AND
        job_postings_fact.salary_year_avg is not NULL
    group by 
        skills_dim.skill_id
),

    job_demands as (
    select
        skills_dim.skill_id,
        skills_dim.skills,
        count(job_postings_fact.job_id) as frequency
    from job_postings_fact
    left join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    left join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where 
        job_postings_fact.job_title_short = 'Data Analyst' AND
        job_postings_fact.salary_year_avg is not NULL
    group by 
        skills_dim.skill_id
)

select 
    average_salary.skill_id,
    average_salary.skills,
    average_salary,
    frequency
from average_salary
inner join job_demands on average_salary.skill_id = job_demands.skill_id
where frequency > 10
ORDER BY  average_salary DESC,
          frequency DESC
         