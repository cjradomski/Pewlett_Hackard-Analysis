-- Querying with SELECT statement to check
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM dept_manager;

-- Query to determine Retirement Eligibility (years 1952-1955)
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Query to COUNT Retirement Eligibility (years 1952-1955)
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Query to determine Retirement Eligibility (1952 only)
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Query to determine Retirement Eligibility (1953 only)
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- Query to determine Retirement Eligibility (1954 only)
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- Query to determine Retirement Eligibility (1955 only)
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Query to determine Retirement Eligibility (years 1952-1955) and save to new table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Query to check new retirement table
SELECT * FROM retirement_info