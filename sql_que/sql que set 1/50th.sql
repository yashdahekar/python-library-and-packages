drop database if exists sqlque_;

create database sqlque_;

use sqlque_;

-- wrong quetion in pdf

create table players (
    player_id int primary key,
    group_id int
);

insert into players values
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 3),
    (7, 3),
    (8, 3);

-- 50

with groupscores as (
    select
        p.group_id,
        p.player_id,
        row_number() over(partition by p.group_id order by p.player_id) as `rank`
    from players p
)
select
    gs.group_id,
    gs.player_id
from groupscores gs
where gs.rank = 1;
