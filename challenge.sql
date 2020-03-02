-- Number of [titles] Retiring
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	s.salary
INTO title_ret
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)

-- Find duplicate names
SELECT 
	first_name,
	last_name,
	count(*)
FROM tit_ret
GROUP BY
	first_name,
	last_name
	HAVING count(*) > 1;

-- Find duplicate names with all info
SELECT * FROM
	(SELECT *, count(*)
	OVER
		(PARTITION BY
			first_name,
			last_name
		) AS count
	FROM tit_ret) tableWithCount
	WHERE tableWithCount.count > 1;
	
-- Find distinct rows
SELECT DISTINCT ON (emp_no) * FROM tit_ret

SELECT * FROM tit_ret

-- Show only employees with their most recent positions
SELECT 
	emp_no,
	first_name,
	last_name,
	title,
	from_date,
	salary
INTO no_dup
	FROM
		(SELECT
			emp_no,
			first_name,
			last_name,
			title,
			from_date,
			salary,
			ROW_NUMBER() OVER
		(PARTITION BY (emp_no) ORDER BY from_date DESC) rn
			FROM title_ret
		) tmp WHERE rn = 1

-- Table of employees ready for a mentor
SELECT nd.emp_no,
	nd.first_name,
	nd.last_name,
	nd.title,
	nd.from_date,
	ti.to_date
INTO mentor_ready
	FROM no_dup as nd
	INNER JOIN titles as ti
	ON nd.emp_no = ti.emp_no
	INNER JOIN employees as e
	ON nd.emp_no = e.emp_no
	WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31');