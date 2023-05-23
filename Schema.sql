DROP SCHEMA IF EXISTS economy CASCADE;
CREATE SCHEMA economy;

drop table IF EXISTS economy.company;
drop table IF EXISTS economy.job;
drop table IF EXISTS economy.state;

create table economy.state
(
	state_id int primary key,
	city varchar (100),
	state varchar (50)

);


create table economy.company
(
	company_id int PRIMARY KEY,
	state_id int REFERENCES economy.state(state_id),
    company_name varchar (100),
	rating float,
	size varchar (100),
	headquarter char (50),
	founded float,
	Type_of_ownership varchar (100),
	industry varchar (100),
	sector varchar (100),
	revenue varchar (100)
	
);

create table economy.job 
(
	job_id int primary key,
	job_title varchar(100),
	avg_salary float,
    min_salary float,
    max_salary float,
	easy_apply float,
	company_id int REFERENCES economy.company(company_id),
	state_id int REFERENCES economy.state(state_id)
	 
);


GRANT ALL PRIVILEGES ON all tables in SCHEMA economy TO postgres;
