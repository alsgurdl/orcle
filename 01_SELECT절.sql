SELECT * FROM employees;

SELECT employee_id,
first_name,
last_name 
FROM employees;
SELECT email, phone_number, hire_date
FROM employees;
--�÷��� ��ȸ�Ҷ� ��ġ���� */+-������ ����
SELECT 
employee_id,
first_name,
last_name,
salary,
salary + salary*0.1 AS ������
FROM employees;

--null ���� Ȯ�� ���� 0�̳� ������� �ٸ� ����
SELECT department_id, commission_pct
FROM employees;
-- alias �÷��� ���̺���� �̸��� �����ؼ� ��ȸ()
SELECT 
first_name AS �̸�,
last_name AS ��,
salary AS �޿�
FROM employees;
/*
dhfkzmfdmf ''���� ǥ���ϴ� ���ڿ� �ȿ� '' Ư����ȣ��
ǥ���ϰ� �ʹٸ� ''�� �ι� �������� 
���ڿ� �����ȣ�� || �Դϴ� ���ڿ��� ���� ������ ������� �ʽ��ϴ�
*/
SELECT 
first_name || ' ' ||  last_name  || '''s salary is $' || salary AS �޿�
FROM employees;
--DISTINCT (�ߺ� ���� ����)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;
--  ROWNUM,ROWID 
--ROWNUM: ���������� ��ȯ��� �� ��ȣ�� ���
--ROWID: ���̹����̽� ���� ���� �ּҸ� ��ȯ
SELECT ROWNUM, ROWID ,employee_id
FROM employees;

