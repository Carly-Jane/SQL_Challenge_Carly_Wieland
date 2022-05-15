----- Create the database from the following 6 CSV's
-- departments, titles, employees, salaries, dept_emp, dept_manager

----- Create 'departments' table.
CREATE TABLE "departments" (
    "dept_no"  varchar  NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);
SELECT *
FROM departments;

----- Create 'titles' table.
CREATE TABLE "titles" (
    "title_id"  varchar  NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);
SELECT *
FROM titles;

----- Create 'employees' table.
CREATE TABLE "employees" (
    "emp_no"  varchar  NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" varchar	NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);
SELECT *
FROM employees;

----- Create 'salaries' table.
CREATE TABLE "salaries" (
    "emp_no"  varchar  NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no")
);
SELECT *
FROM salaries;

----- Create 'dept_emp' table.
CREATE TABLE "dept_emp" (
    "dept_no" varchar   NOT NULL,
    "emp_no" varchar   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("dept_no","emp_no")
);
SELECT *
FROM dept_emp;

----- Create 'dept_manager' table.
CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" varchar   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no","emp_no")
);
SELECT *
FROM dept_manager;

----- Add links as per relational diagram
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- ERROR:  insert or update on table "dept_emp" violates foreign key constraint "fk_dept_emp_dept_no"
-- DETAIL:  Key (dept_no)=(10001) is not present in table "departments".
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

--ERROR:  insert or update on table "dept_emp" violates foreign key constraint "fk_dept_emp_emp_no"
--DETAIL:  Key (emp_no)=(d005) is not present in table "employees".
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


-- Data Analysis
-- Once you have a complete database, do the following:

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW employee_details_view AS
SELECT employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		employees.sex, salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT *
FROM employee_details_view;

-- List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW nineteeneightysix_hires AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

SELECT *
FROM nineteeneightysix_hires;

-- List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
CREATE VIEW department_managers_working_table AS
SELECT dept_manager.dept_no,
		dept_name,
		dept_manager.emp_no
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no;

SELECT *
FROM department_managers_working_table;

CREATE VIEW Department_Managers AS
SELECT department_managers_working_table.dept_no,
		department_managers_working_table.dept_name,
		department_managers_working_table.emp_no,
		last_name, 
		first_name
FROM department_managers_working_table
INNER JOIN employees ON
department_managers_working_table.emp_no = employees.emp_no;

SELECT *
FROM Department_Managers;



-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, 
		last_name.employees, 
		first_name.employees, 
		dept_no
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW hercules_b_employees AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT *
FROM hercules_b_employees;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM employees
WHERE dept_name = "Sales" 

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM complete_employee_database
WHERE dept_name = "Sales" 
OR dept_name = "Development" 

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.





-- departments
-- -----
-- dept_no PK varchar IDENTITY 
-- dept_name varchar 


-- titles
-- -----
-- title_id PK varchar IDENTITY 
-- title varchar


-- employees
-- -----
-- emp_no PK int IDENTITY
-- emp_title_id varchar FK -< titles.title_id
-- birth_date varchar,
-- first_name varchar,
-- last_name varchar,
-- sex varchar,
-- hire_date varchar


-- salaries
-- -----
-- emp_no PK int IDENTITY FK - employees.emp_no
-- salary int


-- dept_emp
-- -----
-- dept_no PK varchar FK >- departments.dept_no
-- emp_no PK int FK >- employees.emp_no


-- dept_manager
-- -----
-- dept_no PK varchar FK >- departments.dept_no
-- emp_no PK int FK >- employees.emp_no
