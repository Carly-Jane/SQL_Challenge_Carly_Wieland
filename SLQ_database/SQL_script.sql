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



-- Data Analysis
-- Once you have a complete database, do the following:

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp_no, last_name, first_name, sex, salary
FROM complete_employee_database;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM complete_employee_database
WHERE hire_date LIKE '%1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_no, dept_name, emp_no, last_name, first_name
FROM complete_employee_database
WHERE title = Manager;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM complete_employee_database

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM complete_employee_database
WHERE first_name = "Hercules" 
AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM complete_employee_database
WHERE dept_name = "Sales" 

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM complete_employee_database
WHERE dept_name = "Sales" 
OR dept_name = "Development" 

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
