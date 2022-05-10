-- create a table for the departments csv.
create table departments (
	dept_no varchar,
	dept_name varchar
);

select * from departments


-- create a table for the dept_emp csv.
create table dept_emp (
	emp_no int,
	dept_no varchar
);

select * from dept_emp


-- create a table for the dept_manager csv.
create table dept_manager (
	dept_no varchar,
	emp_no int
);

select * from dept_manager


-- create a table for the employees csv.
create table employees (
	emp_no int,
	emp_title_id varchar,
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date varchar
);

select * from employees


-- create a table for the salaries csv.
create table salaries (
	emp_no int,
	salary int
);

select * from salaries


-- create a table for the titles csv.
create table titles (
	title_id varchar,
	title varchar
);

select * from titles
