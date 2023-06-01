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
    "password"  : password,
    "port" : "5432"     
}

conn = psycopg2.connect(**params)

with conn.cursor() as cursor:
    # READ FILES IN PYTHON
    with open('Schema.sql', 'r') as schema:
        queries = schema.read()
        print(queries)
        cursor.execute(queries)
    conn.commit() 
