--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
INNER JOIN Salaries ON
employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT 	employees.first_name, 
	employees.last_name,
	employees.hire_date
FROM employees
WHERE hire_date > '12/31/1985' and hire_date < '01/01/1987'; 
	
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
JOIN employees AS e ON (dm.emp_no = e.emp_no)
JOIN departments AS d ON (dm.dept_no = d.dept_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.first_name, e.last_name, d.dept_name
FROM departments AS d
JOIN dept_employees AS de ON (de.dept_no = d.dept_no)
JOIN employees AS e on (e.emp_no = de.emp_no);

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." 
SELECT 	e.first_name, 
	e.last_name,
	e.sex
FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; 

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM departments AS d
JOIN dept_employees AS de ON (de.dept_no = d.dept_no)
JOIN employees AS e on (e.emp_no = de.emp_no)
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM departments AS d
JOIN dept_employees AS de ON (de.dept_no = d.dept_no)
JOIN employees AS e on (e.emp_no = de.emp_no)
WHERE d.dept_name = 'Sales' OR d.Dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*)
FROM employees
GROUP BY last_name 
ORDER BY 2 DESC;
