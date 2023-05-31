import psycopg2
import psycopg2.extras
from config import password

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
    with open('sql/function.sql', 'r') as functions:
        queries = functions.read()
        cursor.execute(queries)
    # commit changes (try)
    try:
        conn.commit()
    except Exception as e:
        print(e)
        conn.rollback()

