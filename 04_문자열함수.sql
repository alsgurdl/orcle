--lower(�ҹ��� )initcap(�ձ��ڸ� �빮��),uppe(�빮��)
SELECT * FROM dual;
/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
*/
SELECT 
'abcDEF', lower('abcDEF'), initcap('abcDEF'),upper('abcDEF')
FROM dual;
SELECT
last_name,
lower(last_name),
initcap(last_name),
upper(last_name)
FROM employees;

SELECT
salary
FROM employees
where lower(last_name) = 'austin';

--length(����) inste(���� ã��, ������ 0�� ��ȯ ������ �ε��� ��)
SELECT 
'abcdef', length('abcdef'),instr('abcdef', 'b')
FROM dual;

SELECT
first_name,
length(first_name),
instr(first_name, 'a')
FROM employees;

--sunstr(�ڸ� ���ڿ�, �����ε���, ����)
--sunstr(�ڸ� ���ڿ�, �����ε���, ����)>���ڿ� ������
--�ε��� 1���� ����
--conncat(���ڿ���)
SELECT 
'abcde' as ex,
substr('abcdef',2,5),
concat('abc','123')
FROM dual;
SELECT 
first_name,
substr(first_name,1,3),
concat(first_name, last_name)
FROM employees;

--LPAD,RPAD(��,������ ������ ���ڿ��� ä���)
SELECT
lpad('abc',10,'*'),
rpad('abc',10,'*')
FROM employees;





