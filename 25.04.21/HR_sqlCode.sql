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

-- union : 2개 이상의 select 결과 합침 (중복 제거O)
-- union all : 중복 제거X
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

-- 첫 번째 select 결과와 두 번째 select 결과의 교집합 제외(차집합)
SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 160
MINUS
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 140
order by employee_id;

-- 교집합
SELECT employee_id, first_name
FROM employees
WHERE employee_id <= 160
INTERSECT
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 140
order by employee_id;

-- employees 테이블에서 job_id가 'AD'로 시작하는 직원 조회
SELECT *
FROM employees
WHERE job_id LIKE 'AD%';

-- employees 테이블의 first_name에서 'ni'를 포함하는 직원 조회
SELECT *
FROM employees
WHERE first_name LIKE '%ni%';

-- LOWER : 소문자 변환, UPPER : 대문자 변환, INITCAP : 첫 글자만 대문자 변환
SELECT first_name, LOWER(first_name),
UPPER(first_name), INITCAP(first_name)
FROM employees;

-- SUBSTR : 지정된 길이만큼의 일부만 추출
SELECT job_id, SUBSTR(job_id, 1, 2), SUBSTR(job_id, 4)
FROM employees;

-- REPLACE
SELECT job_id, REPLACE(job_id, 'MGR', 'MANAGER')
FROM employees;

-- CONCAT
SELECT CONCAT(first_name, CONCAT(' ', last_name))
FROM employees;

-- INSTR : 문자열 위치값 반환
SELECT first_name, INSTR(first_name, 'a')
FROM employees;

-- 결합
SELECT first_name, SUBSTR(first_name, INSTR(first_name, 'a'))
FROM employees;

-- TRIM
SELECT TRIM('  Suan  '), TRIM('  Su an')
FROM dual;

SELECT LPAD(first_name, 10, '*'), RPAD(first_name, 10, '*')
FROM employees;

SELECT job_id, LTRIM(job_id, 'A'), RTRIM(job_id, 'T')
FROM employees;

-- 실습(문자 함수)

-- jobs 테이블에서job_title과소문자와대문자로변환한job_title을 조회
select lower(job_title), upper(job_title)
from jobs;

-- employees테이블에서first_name첫1문자와last_name 조회
select substr(first_name, 1, 1), last_name
from EMPLOYEES;

-- employees테이블에서job_id가‘REP’인부분을 ‘REPRESENTATIVE’로 바꿔서 조회
select job_id, replace(job_id, 'REP', 'REPRESENTATIVE')
from employees;

-- employees테이블에서 first_name 첫1문자와 last_name을 중간에 공백을 두고 하나로 결합하여 조회
select concat(substr(first_name, 1, 1), concat(' ', last_name))
from employees;

-- employees 테이블에서 first_name과 last_name의 길이를 합쳐서 조회
select concat(length(first_name), length(last_name))
from employees;

-- employees 테이블에서 job_id와 job_id에‘A’ 문자위치조회
SELECT job_id, INSTR(job_id, 'A')
from employees;

-- locations 테이블의 city를 15자리 문자열로 바꾸고, 빈 공간을 ‘.’으로 표현하여 조회
select RPAD(city, 15, '.')
from locations;

-- locations 테이블에서 city의 왼쪽부터 ‘S’ 문자를 지운 것과 오른쪽부터 ‘e’ 문자를 지운 결과를 조회
select LTRIM(city, 'S'), RTRIM(city, 'e')
from locations;

-- 숫자 함수
SELECT salary, salary/21, CEIL(salary/21), FLOOR(salary/21)
FROM employees;

SELECT SIGN(-123), SIGN(0), SIGN(123)
FROM dual;

SELECT SIGN(salary)
FROM employees;

-- 날짜 함수
SELECT sysdate, sysdate+1, sysdate-1
FROM employees;

SELECT employee_id, hire_date, 
ADD_MONTHS(hire_date, 2), ADD_MONTHS(hire_date, -2)
FROM employees;

-- 변환 함수
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'CC AD Q')
FROM dual;

-- 일반 함수
SELECT department_name, NVL(manager_id, 100)
FROM departments;

SELECT department_name, NVL2(manager_id, '관리자 있음', '관리자 없음')
FROM departments;

SELECT job_title, min_salary, DECODE(min_salary, 2500, min_salary* 1.1, min_salary)
FROM jobs;

SELECT job_title, min_salary,
    CASE
        WHEN min_salary < 4000 THEN min_salary* 1.2
        WHEN min_salary BETWEEN 4000 AND 6000 THEN min_salary * 1.1
        ELSE min_salary
        END AS 최소급여변경
FROM jobs;

SELECT first_name, salary,
    RANK() OVER(ORDER BY salary DESC) RANK,
    DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK,
    ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER
FROM employees;

-- 집계 함수
SELECT COUNT(salary) 
FROM employees;

-- 그룹 함수
select job_id, salary 
from employees;

-- 전 직원 salary의 합계와 평균 출력
select sum(salary), avg(salary) 
from employees;

-- job_id별로 salary의 합계와 평균 출력
select job_id, sum(salary), avg(salary)
from employees
group by job_id
order by job_id;

-- 부서(job_id)별 salary 합계, 평균(단, salary 합계가 50000이상인 부서만 출력)
select job_id, sum(salary), avg(salary)
from employees
group by job_id
having sum(salary) > 50000;

select department_id, salary
from employees
where hire_date > '20070101';

-- hire_date가 20070101 이후인 직원 전체 salary의 최대값, 최소값
select max(salary), min(salary)
from employees
where hire_date > '20070101';

-- hire_date가 2007010 이후인 직원 data ->  department_id(부서)별로 salary의 최대값, 최소값
select department_id, max(salary), min(salary)
from employees
where hire_date > '20070101'
group by department_id;

-- department_id (50~100) 중에서 job_id별 salary의 합계와 평균
select job_id, sum(salary), round(avg(salary),1) avg
from employees
where department_id BETWEEN 50 and 100
group by job_id;

-- department_id (50~100) 중에서 job_id별 - department_id별로 salary의 합계와 평균(소수점 1자리 반올림)
select job_id, department_id, sum(salary), round(avg(salary),1) avg
from employees
where department_id BETWEEN 50 and 100
group by job_id, department_id;

-- 실습 문제
-- 1. employees 테이블에서 salary가 8000이상인 직원의 수를 조회
select count(employee_id)
from employees
where salary >= 8000;

-- 2. employees 테이블에서 hire_date가 2007년 1월 1일 이후인 직원의 수를 조회
select count(employee_id)
from employees
where hire_date > '20070101';

-- 3. jobs 테이블에서 max_salary 값의 합계와 평균을 조회
select sum(max_salary) 합계, round(avg(max_salary),2) 평균
from jobs;

-- 4. employees 테이블에서 job_id가 ‘IT_PROG’인 직원의 salary 합계와 평균을 조회
select sum(salary), avg(salary)
from employees
where job_id = 'IT_PROG';

-- 5. employees 테이블에서 department_id가 50과 80사이인 직원의  
-- first_name, salary, 그리고 commission_pct의 평균값을 
-- first_name 정렬 기준으로 조회(null값은 0으로 출력)
select first_name, salary, avg(NVL(commission_pct, 0))
from employees
where department_id between 50 and 80 
group by commission_pct, first_name, salary
order by first_name;

-- 6. jobs 테이블에서 max_salary값의 최솟값과 max_salary값의 최댓값을 조회
select min(max_salary), max(max_salary)
from jobs;

-- 7. jobs 테이블에서 job_title이 ‘Programmer’인 직업의 max_salary 값의 최솟값과 max_salary값의 최댓값을 조회
select min(max_salary), max(max_salary)
from jobs
where job_title = 'Programmer';

-- 8. employees 테이블에서 department_id가 50인 데이터의 hire_date 최소값과 최댓값 조회
select min(hire_date), max(hire_date)
from employees
where department_id = 50;

-- 9. employees 테이블에서 department_id가 100인 데이터의 first_name, salary, 
-- 그리고 salary의 분산값을 hire_date정렬 기준으로 조회
select first_name, salary, VARIANCE(salary)
from employees
where department_id = 100
group by first_name, salary, hire_date
order by hire_date;

-- 10. employees 테이블에서 hire_date값이 2004년 1월 1일부터 2006년 12월 31일 사이의 데이터를
-- job_id 기준으로 그룹화한 뒤에 job_id와 salary 최솟값과 최대값을 조회
select job_id, max(salary), min(salary)
from employees
where hire_date between '20040101' and '20061231'
group by job_id;

-- 11. employees 테이블에서 department_id가 50과 80인 데이터를 department_id와 job_id 기준으로
-- 그룹화한 뒤에 department_id와 job_id, salary합계, 최솟값, 최대값을 job_id 기준으로 정렬하여 조회
select department_id, job_id, sum(salary), min(salary), max(salary)
from employees
where department_id IN(50, 80)
group by department_id, job_id
order by job_id;

-- 12. employees 테이블에서 department_id와 job_id 기준으로 그룹화한 뒤에
-- salary 평균값이 12000 이상인 데이터만 department_id와 job_id, salary최솟값, 최대값, 평균을
-- department_id 기준으로 정렬하여 조회
select department_id, job_id, min(salary), max(salary), avg(salary)
from employees
group by department_id, job_id
having avg(salary) >= 12000
order by department_id;
