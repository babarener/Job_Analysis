/*
Questions: what skills are reuiqred for the top paying data analyst jobs
*/


/*
Following query gives skills required in the top 10 paying data analyst jobs
with their frequency in descending order
*/
with top_paying_jobs as 
(
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
limit 10
)

select 
/*    tp.job_id,
    tp.job_title_short,
    tp.company_name,
    sd.skills,
    tp.salary_year_avg
*/
    sd.skills,
    count(tp.job_title_short) as frequency
from 
    top_paying_jobs as tp
left join skills_job_dim as sjd on tp.job_id = sjd.job_id
left join skills_dim as sd on sjd.skill_id = sd.skill_id
where sd.skills is not null
group by sd.skills
order by frequency desc
