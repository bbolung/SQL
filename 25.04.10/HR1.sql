-- 테이블 전체 조회
select *
from DEPARTMENTS;

-- 특정 컬럼만 조회(select 열 이름)
select department_id, department_name
from DEPARTMENTS; 

-- 별칭 사용하기 (select 열 이름 as 별칭)
select department_id as 부서ID, department_name as 부서이름
from DEPARTMENTS;

select department_id as "부서 ID", department_name as 부서이름
from DEPARTMENTS;

select department_id 부서ID, department_name 부서이름
from DEPARTMENTS;

-- 중복 제외(select distinct)
select distinct location_id
from DEPARTMENTS;

-- 연결 연산자(||)
select department_id || department_name
from DEPARTMENTS; 

select 'Department of' || department_name
from DEPARTMENTS;

select 'Department of' || department_name as 부서이름
from DEPARTMENTS;

-- 산술 연산자
select first_name, last_name, salary + 1000
from EMPLOYEES;

select first_name, last_name, salary - 1000
from EMPLOYEES;

select first_name, last_name, salary * 1.1
from EMPLOYEES;