import psycopg2
import psycopg2.extras
import csv
import os
from config import password
# aws rds 

params = {
    "host"      : "rds-pg-jobs.chfavwsr5bmp.us-east-1.rds.amazonaws.com",
    "dbname"    : "postgres",
    "user"      : "postgres",
    "password"  :  password, 
    "port" : "5432"     
}


# ** --> dictionary unpacking!
conn = psycopg2.connect(**params)

# with is something called a context manager : opens and closes a connection for you
with conn.cursor() as cursor:
    
    with open('data/clean_data.csv', 'r') as f:    
        cmd = 'COPY economy.state(state_id, city, state) FROM STDIN WITH (FORMAT CSV, HEADER FALSE)'
        cmd = 'COPY economy.company(company_id, state_id, company_name, rating, size, headquater, founded, Type_of_ownership, indistry, sector, revenue) FROM STDIN WITH (FORMAT CSV, HEADER FALSE)'
        cmd = 'COPY economy.job(job_id, job_title, avg_salary, min_salary, max_salary, easy_apply, company_id, state_id) FROM STDIN WITH (FORMAT CSV, HEADER FALSE)'


        cursor.copy_expert(cmd, f)
    conn.commit()