-- ���� ������
-- ���� �ٸ� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� �� �ִ� ������
-- UNION(������ �ߺ�x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.
-- UNION > �ߺ� �����͸� ������� ����
SELECT
employee_id, first_name
FROM employees
where hire_date like '04%'
UNION
SELECT
employee_id, first_name
FROM employees
where DEPARTMENT_ID = 20;

--UNION ALL �ߺ����
SELECT
employee_id, first_name
FROM employees
where hire_date like '04%'
UNION ALL
SELECT
employee_id, first_name
FROM employees
where DEPARTMENT_ID = 20;

SELECT
employee_id, first_name
FROM employees
where hire_date like '04%'
INTERSECT
SELECT
employee_id, first_name
FROM employees
where DEPARTMENT_ID = 20;

SELECT
employee_id, first_name
FROM employees
where hire_date like '04%'
MINUS
SELECT
employee_id, first_name
FROM employees
where DEPARTMENT_ID = 20;

SELECT
employee_id, first_name
FROM employees
where DEPARTMENT_ID = 20
MINUS
SELECT
employee_id, first_name
FROM employees
where hire_date like '04%';
