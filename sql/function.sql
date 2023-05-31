
CREATE OR REPLACE FUNCTION economy.GetCompaniesWithRatingAbove(threshold float)
RETURNS TABLE (company_name Varchar(255), rating float) AS $$ 
BEGIN
  RETURN QUERY 
  SELECT company.company_name, company.rating
  FROM economy.company
  WHERE company.rating > threshold; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION economy.GetJobDetails(job_titles TEXT)
RETURNS TABLE (job_title TEXT, min_salary float, max_salary float, avg_salary float) AS $$
BEGIN
  RETURN QUERY 
  SELECT job.job_title, job.min_salary, job.max_salary, job.avg_salary 
  FROM economy.job
  WHERE job.job_title in (job_titles);
END;
$$ LANGUAGE plpgsql;
SELECT economy.GetJobDetails('Business Analyst');

CREATE OR REPLACE FUNCTION economy.GetjobTitleThatAppearsMost(jobs TEXT)
RETURNS TABLE (job_title TEXT) AS $$
BEGIN
  RETURN QUERY 
  SELECT job.job_title
  FROM economy.job 
  GROUP BY job.job_title 
  ORDER BY count(job_title) DESC;
END;
$$ LANGUAGE plpgsql; 
