

CREATE OR REPLACE FUNCTION market.print_hello_world() RETURNS VARCHAR AS $$ 
    DECLARE
    	val VARCHAR(255);
    BEGIN
        SELECT 'hello world' INTO val;
        RETURN val;
    END; $$ 
LANGUAGE plpgsql;