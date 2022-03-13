--Deliverable 1
--Part 1
SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC

--Part 2
SELECT DISTINCT ON (retirement_titles.emp_no)
retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Part 3
SELECT COUNT (unique_titles.emp_no), unique_titles.title
INTO retirement2_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--Deliverable 2
--Part 1
SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title

--Part 2
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
