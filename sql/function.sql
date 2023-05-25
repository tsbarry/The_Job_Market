

CREATE OR REPLACE FUNCTION market.print_hello_world() RETURNS VARCHAR AS $$ 
    DECLARE
    	val VARCHAR(255);
    BEGIN
        SELECT 'hello world' INTO val;
        RETURN val;
    END; $$ 
LANGUAGE plpgsql;


listed below are the SQL functions we should work on for this week. We'll talk more about these during class:
Return the average and median salary of a business analyst.
Return the company name with the highest job postings, along with respective count of job postings,
Return the name of the job title that appears most often in your database.