SELECT * FROM employees;

SELECT emp_no, first_name, last_name
FROM employees;

SELECT * FROM titles;

SELECT title, from_date, to_date
FROM titles;

SELECT e.emp_no,
        e.first_name,
        e.last_name,
        tl.title,
        tl.from_date,
        tl.to_date
--INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND 
	   '1955-12-31')
ORDER BY e.emp_no;

SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
	e.first_name,
	e.last_name,
	tl.title
--INTO unique_titles
FROM employees AS e
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND 
	   '1955-12-31')
ORDER BY e.emp_no, tl.from_date DESC;

SELECT COUNT (un.title), un.title
--INTO retiring_titles
FROM unique_titles AS un
GROUP BY un.title
ORDER BY count DESC;

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tl.title
--INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND 
	 '1965-12-31')
ORDER BY e.emp_no, tl.from_date DESC;