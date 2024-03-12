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
salary,
last_name
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

--substr(�ڸ� ���ڿ�, �����ε���, ����)
--substr(�ڸ� ���ڿ�, �����ε���, ����)>���ڿ� ������
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
FROM dual;
--LTRIM(), RTRIM, TRIM()
--TRIM() > ��������
--LTRIM(paraml, param2) > param2�� ���� param1���� ã�Ƽ� ���� (���ʺ���)
--RTRIM(paraml, param2) > param2�� ���� param1���� ã�Ƽ� ���� (�����ʺ���)
SELECT
ltrim('javascript_java','java')
FROM dual;
SELECT
rtrim('javascript_java','java')
FROM dual;
SELECT trim('    java     ')
FROM dual;

--REPLACE(str, old, new)
SELECT
REPLACE('my dream is a presidnt', 'presidnt' ,'prma')
FROM dual;
SELECT
REPLACE(REPLACE('my dream is a presidnt', 'presidnt' ,'prma'), ' ','')
FROM dual;

SELECT
REPLACE(concat('hello','world0!'), '!' ,'?')
FROM dual;

/*
���� 1.
EMPLOYEES ���̺��� �̸�, �Ի����� �÷����� ����(��Ī)�ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�. (CONCAT)
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�. (REPLACE)
*/
SELECT*FROM employees;

SELECT
concat( first_name,last_name) AS �̸�,
REPLACE(HIRE_DATE, '/', '')
FROM employees
order by �̸�;

/*
���� 2.
EMPLOYEES ���̺��� phone_number�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� 
��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���. (CONCAT, SUBSTR ���)
*/
SELECT
CONCAT('02',substr(PHONE_NUMBER, '5'))
FROM employees;


/*
���� 3. 
EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� ���ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
*/
SELECT

rpad(substr(first_name, 1,3),length(first_name),'*') AS name,
lpad(salary, 10, '*') AS salary

FROM employees
where lower(job_id) = 'it_prog';



