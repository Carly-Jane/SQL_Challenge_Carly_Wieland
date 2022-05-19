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

CREATE VIEW department_employees_working_table AS
SELECT dept_emp.dept_no,
		dept_name,
		dept_emp.emp_no
FROM dept_emp
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no;

SELECT *
FROM department_employees_working_table;


CREATE VIEW Department_Employees AS
SELECT department_employees_working_table.emp_no,
		last_name, 
		first_name,
		department_employees_working_table.dept_name
FROM department_employees_working_table
INNER JOIN employees ON
department_employees_working_table.emp_no = employees.emp_no;

SELECT *
FROM Department_Employees;


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW hercules_b_employees AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT *
FROM hercules_b_employees;


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW Sales_Department AS
SELECT *
FROM Department_Employees
WHERE dept_name = 'Sales';

SELECT *
FROM Sales_Department;


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW Sales_And_Development_Department AS
SELECT *
FROM Department_Employees
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

SELECT *
FROM Sales_And_Development_Department;


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW Employee_Last_Names AS
SELECT last_name, COUNT(last_name) AS "Count Of Employee Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Count Of Employee Last Names" DESC;

SELECT *
FROM Employee_Last_Names;

----------------------------------------------------------------------