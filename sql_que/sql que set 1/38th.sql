drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table departments (
    id int primary key,
    name varchar(255)
);

insert into departments values
    (1, 'Electrical Engineering'),
    (7, 'Computer Engineering'),
    (13, 'Business Administration');

create table students (
    id int primary key,
    name varchar(255),
    department_id int
);

insert into students values
    (23, 'Alice', 1),
    (1, 'Bob', 7),
    (5, 'Jennifer', 13),
    (2, 'John', 14),
    (4, 'Jasmine', 77),
    (3, 'Steve', 74),
    (6, 'Luis', 1),
    (8, 'Jonathan', 7),
    (7, 'Daiana', 33),
    (11, 'Madelynn', 1);

-- 38

select s.id, s.name
from students s
left join departments d on s.department_id = d.id
where d.id is null;


