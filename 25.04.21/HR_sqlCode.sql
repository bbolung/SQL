select *
from employees
-- where employee_id between 120 and 130;
where employee_id >= 120 and employee_id <= 130;

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 12000;

SELECT *
FROM employees
-- WHERE first_name='Steven' or first_name='John' or first_name='Peter';
WHERE first_name IN ('Steven', 'John', 'Peter');

SELECT *
FROM countries
WHERE COUNTRY_ID IN('US', 'IT', 'JP');

SELECT *
FROM countries
WHERE COUNTRY_ID NOT IN('US', 'IT', 'JP');

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = 60;

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = 100;

-- union : 2�� �̻��� select ��� ��ħ (�ߺ� ����O)
-- union all : �ߺ� ����X
SELECT employee_id, first_name, department_id
FROM employees
WHERE employee_id = 60
union
SELECT employee_id, first_name, department_id
FROM employees
WHERE employee_id = 100;

SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 160
union all
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 140
order by employee_id;

-- ù ��° select ����� �� ��° select ����� ������ ����(������)
SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 160
MINUS
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 140
order by employee_id;

-- ������
SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 160
INTERSECT
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 140
order by employee_id;

-- employees ���̺��� job_id�� 'AD'�� �����ϴ� ���� ��ȸ
SELECT *
FROM employees
WHERE job_id LIKE 'AD%';

-- employees ���̺��� first_name���� 'ni'�� �����ϴ� ���� ��ȸ
SELECT *
FROM employees
WHERE first_name LIKE '%ni%';

-- LOWER : �ҹ��� ��ȯ, UPPER : �빮�� ��ȯ, INITCAP : ù ���ڸ� �빮�� ��ȯ
SELECT first_name, LOWER(first_name),
UPPER(first_name), INITCAP(first_name)
FROM employees;

-- SUBSTR : ������ ���̸�ŭ�� �Ϻθ� ����
SELECT job_id, SUBSTR(job_id, 1, 2), SUBSTR(job_id, 4)
FROM employees;

-- REPLACE
SELECT job_id, REPLACE(job_id, 'MGR', 'MANAGER')
FROM employees;

-- CONCAT
SELECT CONCAT(first_name, CONCAT(' ', last_name))
FROM employees;

-- INSTR : ���ڿ� ��ġ�� ��ȯ
SELECT first_name, INSTR(first_name, 'a')
FROM employees;

-- ����
SELECT first_name, SUBSTR(first_name, INSTR(first_name, 'a'))
FROM employees;

-- TRIM
SELECT TRIM('  Suan  '), TRIM('  Su an')
FROM dual;

SELECT LPAD(first_name, 10, '*'), RPAD(first_name, 10, '*')
FROM employees;

SELECT job_id, LTRIM(job_id, 'A'), RTRIM(job_id, 'T')
FROM employees;

-- �ǽ�(���� �Լ�)

-- jobs ���̺���job_title���ҹ��ڿʹ빮�ڷκ�ȯ��job_title�� ��ȸ
select lower(job_title), upper(job_title)
from jobs;

-- employees���̺���first_nameù1���ڿ�last_name ��ȸ
select substr(first_name, 1, 1), last_name
from EMPLOYEES;

-- employees���̺���job_id����REP���κκ��� ��REPRESENTATIVE���� �ٲ㼭 ��ȸ
select job_id, replace(job_id, 'REP', 'REPRESENTATIVE')
from employees;

-- employees���̺��� first_name ù1���ڿ� last_name�� �߰��� ������ �ΰ� �ϳ��� �����Ͽ� ��ȸ
select concat(substr(first_name, 1, 1), concat(' ', last_name))
from employees;

-- employees ���̺��� first_name�� last_name�� ���̸� ���ļ� ��ȸ
select concat(length(first_name), length(last_name))
from employees;

-- employees ���̺��� job_id�� job_id����A�� ������ġ��ȸ
SELECT job_id, INSTR(job_id, 'A')
from employees;

-- locations ���̺��� city�� 15�ڸ� ���ڿ��� �ٲٰ�, �� ������ ��.������ ǥ���Ͽ� ��ȸ
select RPAD(city, 15, '.')
from locations;

-- locations ���̺��� city�� ���ʺ��� ��S�� ���ڸ� ���� �Ͱ� �����ʺ��� ��e�� ���ڸ� ���� ����� ��ȸ
select LTRIM(city, 'S'), RTRIM(city, 'e')
from locations;

-- ���� �Լ�
SELECT salary, salary/21, CEIL(salary/21), FLOOR(salary/21)
FROM employees;

SELECT SIGN(-123), SIGN(0), SIGN(123)
FROM dual;

SELECT SIGN(salary)
FROM employees;

-- ��¥ �Լ�
SELECT sysdate, sysdate+1, sysdate-1
FROM employees;

SELECT employee_id, hire_date, 
ADD_MONTHS(hire_date, 2), ADD_MONTHS(hire_date, -2)
FROM employees;

-- ��ȯ �Լ�
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'CC AD Q')
FROM dual;

-- �Ϲ� �Լ�
SELECT department_name, NVL(manager_id, 100)
FROM departments;

SELECT department_name, NVL2(manager_id, '������ ����', '������ ����')
FROM departments;

SELECT job_title, min_salary, DECODE(min_salary, 2500, min_salary* 1.1, min_salary)
FROM jobs;

SELECT job_title, min_salary,
    CASE
        WHEN min_salary < 4000 THEN min_salary* 1.2
        WHEN min_salary BETWEEN 4000 AND 6000 THEN min_salary * 1.1
        ELSE min_salary
        END AS �ּұ޿�����
FROM jobs;

SELECT first_name, salary,
    RANK() OVER(ORDER BY salary DESC) RANK,
    DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK,
    ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER
FROM employees;

-- ���� �Լ�
SELECT COUNT(salary) 
FROM employees;

-- �׷� �Լ�
select job_id, salary 
from employees;

-- �� ���� salary�� �հ�� ��� ���
select sum(salary), avg(salary) 
from employees;

-- job_id���� salary�� �հ�� ��� ���
select job_id, sum(salary), avg(salary)
from employees
group by job_id
order by job_id;

-- �μ�(job_id)�� salary �հ�, ���(��, salary �հ谡 50000�̻��� �μ��� ���)
select job_id, sum(salary), avg(salary)
from employees
group by job_id
having sum(salary) > 50000;

select department_id, salary
from employees
where hire_date > '20070101';

-- hire_date�� 20070101 ������ ���� ��ü salary�� �ִ밪, �ּҰ�
select max(salary), min(salary)
from employees
where hire_date > '20070101';

-- hire_date�� 2007010 ������ ���� data ->  department_id(�μ�)���� salary�� �ִ밪, �ּҰ�
select department_id, max(salary), min(salary)
from employees
where hire_date > '20070101'
group by department_id;

-- department_id (50~100) �߿��� job_id�� salary�� �հ�� ���
select job_id, sum(salary), round(avg(salary),1) avg
from employees
where department_id BETWEEN 50 and 100
group by job_id;

-- department_id (50~100) �߿��� job_id�� - department_id���� salary�� �հ�� ���(�Ҽ��� 1�ڸ� �ݿø�)
select job_id, department_id, sum(salary), round(avg(salary),1) avg
from employees
where department_id BETWEEN 50 and 100
group by job_id, department_id;

-- �ǽ� ����
-- 1. employees ���̺��� salary�� 8000�̻��� ������ ���� ��ȸ
select count(employee_id)
from employees
where salary >= 8000;

-- 2. employees ���̺��� hire_date�� 2007�� 1�� 1�� ������ ������ ���� ��ȸ
select count(employee_id)
from employees
where hire_date > '20070101';

-- 3. jobs ���̺��� max_salary ���� �հ�� ����� ��ȸ
select sum(max_salary) �հ�, round(avg(max_salary),2) ���
from jobs;

-- 4. employees ���̺��� job_id�� ��IT_PROG���� ������ salary �հ�� ����� ��ȸ
select sum(salary), avg(salary)
from employees
where job_id = 'IT_PROG';

-- 5. employees ���̺��� department_id�� 50�� 80������ ������  
-- first_name, salary, �׸��� commission_pct�� ��հ��� 
-- first_name ���� �������� ��ȸ(null���� 0���� ���)
select first_name, salary, avg(NVL(commission_pct, 0))
from employees
where department_id between 50 and 80 
group by commission_pct, first_name, salary
order by first_name;

-- 6. jobs ���̺��� max_salary���� �ּڰ��� max_salary���� �ִ��� ��ȸ
select min(max_salary), max(max_salary)
from jobs;

-- 7. jobs ���̺��� job_title�� ��Programmer���� ������ max_salary ���� �ּڰ��� max_salary���� �ִ��� ��ȸ
select min(max_salary), max(max_salary)
from jobs
where job_title = 'Programmer';

-- 8. employees ���̺��� department_id�� 50�� �������� hire_date �ּҰ��� �ִ� ��ȸ
select min(hire_date), max(hire_date)
from employees
where department_id = 50;

-- 9. employees ���̺��� department_id�� 100�� �������� first_name, salary, 
-- �׸��� salary�� �л갪�� hire_date���� �������� ��ȸ
select first_name, salary, VARIANCE(salary)
from employees
where department_id = 100
group by first_name, salary, hire_date
order by hire_date;

-- 10. employees ���̺��� hire_date���� 2004�� 1�� 1�Ϻ��� 2006�� 12�� 31�� ������ �����͸�
-- job_id �������� �׷�ȭ�� �ڿ� job_id�� salary �ּڰ��� �ִ밪�� ��ȸ
select job_id, max(salary), min(salary)
from employees
where hire_date between '20040101' and '20061231'
group by job_id;

-- 11. employees ���̺��� department_id�� 50�� 80�� �����͸� department_id�� job_id ��������
-- �׷�ȭ�� �ڿ� department_id�� job_id, salary�հ�, �ּڰ�, �ִ밪�� job_id �������� �����Ͽ� ��ȸ
select department_id, job_id, sum(salary), min(salary), max(salary)
from employees
where department_id IN(50, 80)
group by department_id, job_id
order by job_id;

-- 12. employees ���̺��� department_id�� job_id �������� �׷�ȭ�� �ڿ�
-- salary ��հ��� 12000 �̻��� �����͸� department_id�� job_id, salary�ּڰ�, �ִ밪, �����
-- department_id �������� �����Ͽ� ��ȸ
select department_id, job_id, min(salary), max(salary), avg(salary)
from employees
group by department_id, job_id
having avg(salary) >= 12000
order by department_id;
