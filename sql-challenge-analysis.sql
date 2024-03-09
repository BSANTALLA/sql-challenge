-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
employees.emp_no,
employees.first_name,
employees.last_name,
employees.sex,
salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
first_name,
last_name,
hire_date
FROM
employees
WHERE DATE_PART('year', hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select
dept_manager.dept_no,
dept_manager.emp_no,
department.dept_name,
employees.first_name,
employees.last_name
FROM dept_manager
JOIN department
ON dept_manager.dept_no = department.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select 
dept_emp.dept_no,
department.dept_name,
employees.emp_no,
employees.first_name,
employees.last_name
FROM employees
Join dept_emp on employees.emp_no = dept_emp.emp_no
JOIN department on department.dept_no = dept_emp.dept_no
ORDER BY employees.emp_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
employees.emp_no,
employees.first_name,
employees.last_name,
department.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
Join department
ON department.dept_no = dept_emp.dept_no
WHERE department.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
employees.emp_no,
employees.first_name,
employees.last_name,
department.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
Join department
ON department.dept_no = dept_emp.dept_no
WHERE department.dept_name in ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
last_name,
COUNT (*) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;