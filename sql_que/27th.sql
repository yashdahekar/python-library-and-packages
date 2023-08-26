use sqlque;

create table users (
    user_id int primary key,
    name varchar(255),
    mail varchar(255)
);

insert into users (user_id, name, mail)
values
    (1, 'Winston', 'winston@leetcode.com'),
    (2, 'Jonathan', 'jonathanisgreat'),
    (3, 'Annabelle', 'bella-@leetcode.com'),
    (4, 'Sally', 'sally.come@leetcode.com'),
    (5, 'Marwan', 'quarz#2020@leetcode.com'),
    (6, 'David', 'david69@gmail.com'),
    (7, 'Shapiro', '.shapo@leetcode.com');

select * from users;

-- 27 

select user_id, name, mail from users
where mail like '_%@leetcode.com'
and mail not like '%[^a-zA-Z0-9_-.]%'
and mail not like '.%'
and mail not like '%.@%'
and mail not like '%..%'
and mail not like '%-@%'
and mail not like '%@-%'
and mail not like '%-.'

