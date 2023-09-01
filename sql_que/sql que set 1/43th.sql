drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table Activity (
    player_id int,
    device_id int,
    event_date date,
    games_played int,
    primary key (player_id, event_date)
);

insert into Activity values
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

-- 43

with firstlogin as (
    select player_id, min(event_date) as first_login_date
    from activity
    group by player_id
)
select round(sum(case when a.event_date = date_add(fl.first_login_date, interval 1 day) then 1 else 0 end) / count(distinct fl.player_id), 2) as fraction
from firstlogin fl
left join activity a on fl.player_id = a.player_id;

