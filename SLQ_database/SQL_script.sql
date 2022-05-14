CREATE TABLE "departments" (
    "dept_no"  varchar  NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
SELECT *
FROM departments;

CREATE TABLE "titles" (
    "title_id"  varchar  NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);
SELECT *
FROM titles;

CREATE TABLE "employees" (
    "emp_no"  SERIAL  NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" varchar	NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);
SELECT *
FROM employees;

CREATE TABLE "salaries" (
    "emp_no"  SERIAL  NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);
SELECT *
FROM salaries;

CREATE TABLE "dept_emp" (
    "dept_no" varchar   NOT NULL,
    "emp_no" varchar   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_no","emp_no"
     )
);
SELECT *
FROM dept_emp;

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);
SELECT *
FROM dept_manager;

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- ERROR:  insert or update on table "dept_emp" violates foreign key constraint "fk_dept_emp_dept_no"
-- DETAIL:  Key (dept_no)=(10001) is not present in table "departments".
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- ERROR:  foreign key constraint "fk_dept_emp_emp_no" cannot be implemented
-- DETAIL:  Key columns "emp_no" and "emp_no" are of incompatible types: character varying and integer.
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


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
