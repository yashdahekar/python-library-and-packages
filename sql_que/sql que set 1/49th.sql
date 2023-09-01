drop database if exists sqlque_;

create database sqlque_;

use sqlque_;

create table enrollments (
    student_id int,
    course_id int,
    grade int,
    primary key (student_id, course_id)
);

insert into enrollments values
    (2, 2, 95),
    (2, 3, 95),
    (1, 1, 90),
    (1, 2, 99),
    (3, 1, 80),
    (3, 2, 75),
    (3, 3, 82);
    
-- 49

select student_id, course_id, grade
from (
    select student_id, course_id, grade,
           row_number() over (partition by student_id order by grade desc, course_id asc) as rn
    from enrollments
) ranked
where rn = 1
order by student_id;
