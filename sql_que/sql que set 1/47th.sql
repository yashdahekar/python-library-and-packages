drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table employee (
    employee_id int primary key,
    name varchar(50),
    experience_years int
);

insert into employee values
    (1, 'Khaled', 3),
    (2, 'Ali', 2),
    (3, 'John', 3),
    (4, 'Doe', 2);

create table project (
    project_id int,
    employee_id int,
    primary key (project_id, employee_id),
    foreign key (employee_id) references employee(employee_id)
);

insert into project values
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4);

-- 47 

with rankedemployees as (
    select
        p.project_id,
        e.employee_id,
        e.experience_years,
        rank() over (partition by p.project_id order by e.experience_years desc) as rnk
    from
        project p
    join
        employee e on p.employee_id = e.employee_id
)
select
    project_id,
    employee_id
from
    rankedemployees
where
    rnk = 1;


