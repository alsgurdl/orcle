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

SELECT
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




