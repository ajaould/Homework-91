--Question 1: first name, last name, sex, salary
SELECT
    "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Employees".sex, "Salaries".salary
FROM "Employees"
INNER JOIN
    "Salaries"
ON
    "Employees".emp_no = "Salaries".emp_no;
--Question 2: Employees with hire dates in 1986
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date LIKE '%/1986';
--Question 3: Managers with info
CREATE VIEW Q3 AS
SELECT
    "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Department_Manager".dept_no
FROM "Employees"
INNER JOIN
    "Department_Manager"
ON
    "Employees".emp_no = "Department_Manager".emp_no;
	
SELECT *
FROM Q3
INNER JOIN
	"Department"
ON
	"Department".dept_no = Q3.dept_no;
--Q4
--employee number, last name, first name, and department name
SELECT
    "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Department".dept_name
FROM "Employees"
INNER JOIN
    "Department_Employee"
ON
    "Employees".emp_no = "Department_Employee".emp_no
INNER JOIN
	"Department"
ON
	"Department_Employee".dept_no = "Department".dept_no
--Q5 Find Hercules B
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
--Q6 SALES, emp no, last name, first name, dept name
SELECT
    "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Department".dept_name
FROM "Employees"
INNER JOIN
    "Department_Employee"
ON
    "Employees".emp_no = "Department_Employee".emp_no
INNER JOIN
	"Department"
ON
	"Department_Employee".dept_no = "Department".dept_no
WHERE dept_name = 'Sales'
--Q7
SELECT
    "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Department".dept_name
FROM "Employees"
INNER JOIN
    "Department_Employee"
ON
    "Employees".emp_no = "Department_Employee".emp_no
INNER JOIN
	"Department"
ON
	"Department_Employee".dept_no = "Department".dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
--Q8
SELECT last_name, count(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY count(last_name) DESC;