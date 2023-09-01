
drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table employees (
    id int primary key,
    name varchar(255)
);

insert into employees (id, name)
values
    (1, 'Alice'),
    (7, 'Bob'),
    (11, 'Meir'),
    (90, 'Winston'),
    (3, 'Jonathan');

create table employeeuni (
    id int primary key,
    unique_id int
);

insert into employeeuni (id, unique_id)
values
    (3, 1),
    (11, 2),
    (90, 3);

-- 32

select e.name, eu.unique_id
from employees e
left join employeeuni eu on e.id = eu.id
order by e.id;

