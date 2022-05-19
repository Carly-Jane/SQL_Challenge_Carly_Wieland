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
	"emp_no" varchar   NOT NULL,
    "dept_no" varchar   NOT NULL,
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


ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");


ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");


ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

----------------------------------------------------------------------