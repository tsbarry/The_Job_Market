
CREATE OR REPLACE FUNCTION GetCompaniesWithRatingAbove(threshold NUMERIC)
RETURNS TABLE (company_name Varchar(255), rating NUMERIC) AS $$ 
BEGIN
  RETURN QUERY 
  SELECT "Company Name", "Rating"
  FROM Company
  WHERE Rating > threshold; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetJobsByIndustry(industry TEXT)
RETURNS TABLE (job_id INTEGER, job_title Varchar(255), company_name TEXT) AS $$
BEGIN
  RETURN QUERY 
  SELECT "Job_id", "Job_Title", "Company_id", "Company Name" 
  FROM job, company
  WHERE Industry = industry;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION GetJobDetails(job_title TEXT)
RETURNS TABLE (job_title TEXT, min_salary NUMERIC, max_salary NUMERIC) AS $$
BEGIN
  RETURN QUERY 
  SELECT "Job_Title", "Min_Salary", "Max_Salary"
  FROM job
  WHERE job_title = Business Analyst; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetCompaniesByState(state TEXT)
RETURNS TABLE (company_name TEXT, city TEXT) AS $$
BEGIN
  RETURN QUERY 
  SELECT "Company Name", "City"
  FROM state
  WHERE State = state;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetJobStatsByCity(city TEXT)
RETURNS TABLE (avg_salary NUMERIC, min_salary NUMERIC, max_salary NUMERIC) AS $$
BEGIN
  RETURN QUERY 
  SELECT AVG(Avg_Salary), MIN(Min_Salary), MAX(Max_Salary) 
  FROM state
  WHERE City = city;
END;
$$ LANGUAGE plpgsql;
