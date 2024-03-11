SELECT * FROM employees;
--WHERE�� �� ������ ���� ��ҹ��ڸ� �� �����Ѵ�
SELECT first_name, last_name, job_id 
FROM employees
WHERE job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE last_name = 'King';

--IN �������� ��� Ư�� ����� ���� �� ���

SELECT * FROM employees
WHERE manager_id IN (100,101,102);

SELECT * FROM employees
WHERE job_id IN('IT_PROG', 'AD_VP');

--LIKE ������(���� ���ڿ� ���� ����)
--%�� ��� ���ڵ�,_�� �������� �ڸ�(��ġ)�� ǥ���� ��

SELECT 
first_name,
last_name,
hire_date
 FROM employees
WHERE hire_date LIKE '03%';

SELECT 
first_name,
last_name,
hire_date
 FROM employees
WHERE hire_date LIKE '%15';

SELECT *
FROM employees
WHERE hire_date LIKE '%05%';

SELECT 
first_name,
last_name,
hire_date
 FROM employees
WHERE hire_date LIKE '___05%';

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;
--AND, OR
--and��  or���� ���� ���� ������
SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

--�������� ���� (select ������ ���� �������� ��ġ�˴ϴ�)
--ASC: ascending �������� > ������ ����
--DESC: descending ��������
SELECT * FROM employees
order by hire_date;

SELECT * FROM employees
order by hire_date DESC;

SELECT * FROM employees
where job_id = 'IT_PROG'
order by first_name desc;

SELECT * FROM employees
where salary >= 5000
order by employee_id desc;

SELECT 
first_name,
salary*12 AS pay
FROM employees
order by pay asc;