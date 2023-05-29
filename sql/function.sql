

CREATE OR REPLACE FUNCTION economy.print_avg_salary() RETURNS FLOAT AS $$ 
    DECLARE
    	val float;
    BEGIN
        SELECT 'avg_salary' INTO val;
        FROM job 
        Where 
        RETURN val;
    END; $$ 
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION GetCompaniesWithRatingAbove(threshold NUMERIC)
RETURNS TABLE (company_name Varchar(255), rating NUMERIC) AS $$ 
BEGIN
  RETURN QUERY 
  SELECT "Company Name", Rating 
  FROM your_table_name
  WHERE Rating > threshold;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetJobsByIndustry(industry TEXT)
RETURNS TABLE (job_id INTEGER, job_title Varchar(255), company_name TEXT) AS $$
BEGIN
  RETURN QUERY 
  SELECT "Job_id", "Job Title", "Company Name" 
  FROM your_table_name
  WHERE Industry = industry;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION GetJobDetails(job_id INTEGER)
RETURNS TABLE (job_title TEXT, company_name TEXT, min_salary NUMERIC, max_salary NUMERIC) AS $$
BEGIN
  RETURN QUERY SELECT "Job Title", "Company Name", Min_Salary, Max_Salary 
  FROM your_table_name
  WHERE Job_id = job_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetCompaniesByState(state TEXT)
RETURNS TABLE (company_name TEXT, city TEXT) AS $$
BEGIN
  RETURN QUERY 
  SELECT "Company Name", City FROM your_table_name
  WHERE State = state;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetJobStatsByCity(city TEXT)
RETURNS TABLE (avg_salary NUMERIC, min_salary NUMERIC, max_salary NUMERIC) AS $$
BEGIN
  RETURN QUERY 
  SELECT AVG(Avg_Salary), MIN(Min_Salary), MAX(Max_Salary) 
  FROM your_table_name
               WHERE City = city;
END;
$$ LANGUAGE plpgsql;