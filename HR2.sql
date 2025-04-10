-- 2025.04.10
select *
from EMPLOYEES;

select *
from EMPLOYEES
where employee_id = 100;

select *
from EMPLOYEES
where first_name = 'John';

select *
from EMPLOYEES
where employee_id <> 110;

select *
from EMPLOYEES
where employee_id > 110;

select *
from EMPLOYEES
where employee_id < 110;

select *
from EMPLOYEES
where employee_id >= 120 and employee_id < 130;

select *
from EMPLOYEES
where employee_id >= 120 or employee_id < 110;

-- 오름차순 정렬 : asc (기본값이기에 기입X)
select first_name, last_name
from EMPLOYEES
order by first_name; 

-- 내림차순 정렬 : desc
select first_name, last_name
from EMPLOYEES
order by first_name desc;

-- 오름차순 정렬 + 중복된 값 내림차순 정렬
select first_name, last_name
from EMPLOYEES
order by first_name asc, last_name desc;

select *
from EMPLOYEES
where employee_id >= 110 and employee_id < 120;

select *
from EMPLOYEES
where employee_id BETWEEN 110 and 120-1;

select *
from EMPLOYEES
where first_name = 'John' or first_name = 'Luis' or first_name = 'Den';

select *
from EMPLOYEES
where first_name in ('John', 'Luis', 'Den');

select *
from EMPLOYEES
where first_name not in ('John', 'Luis', 'Den');

select *
from locations
where state_province is null;

select *
from locations
where state_province is not null;

-- '198'로 시작하는 문자열 조회
select *
from locations
where street_address like '198%';

-- 'RIE'로 끝나는 문자열 조회
select *
from locations
where street_address like '%Rie';

-- 'Cola' 포함하는 문자열 조회
select *
from locations
where street_address like '%Cola%';

select *
from COUNTRIES;

insert into COUNTRIES
values('KR', 'South Korea', 3);

-- 모든 값 넣을 때는 생략 가능
insert into COUNTRIES(country_id, country_name, region_id)
values('KP', 'South Korea2', 3); 

-- 몇가지 값만 넣을 때는 반드시 기입
insert into COUNTRIES(country_id, region_id)
values('KO', 3); 

commit;

delete from  COUNTRIES
where COUNTRY_ID = 'KO';

select *
from EMPLOYEES;

-- salary 전부 20% 상승
update EMPLOYEES
set salary = salary * 1.2;

-- table 생성
create table customers(
    customer_id number not null primary key,
    first_name VARCHAR2(20) not null,
    last_name VARCHAR2(20) not null,
    email VARCHAR2(30),
    phone_number VARCHAR2(20),
    regist_date date
);

select *
from customers;