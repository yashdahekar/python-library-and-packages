use sqlque;

create table ads (
    ad_id int,
    user_id int,
    `action` enum ('clicked', 'viewed', 'ignored'),
    primary key (ad_id , user_id)
);

insert into ads (ad_id, user_id, `action`)
values
    (1, 1, 'clicked'),
    (2, 2, 'clicked'),
    (3, 3, 'viewed'),
    (5, 5, 'ignored'),
    (1, 7, 'ignored'),
    (2, 7, 'viewed'),
    (3, 5, 'clicked'),
    (1, 4, 'viewed'),
    (2, 11, 'viewed'),
    (1, 2, 'clicked');

select * from ads;

--20
select 
    ad_id,
    case
        when sum(case when `action` = 'clicked' then 1 else 0 end) = 0 then 0
        else round((sum(case when `action` = 'clicked' then 1 else 0 end) / nullif(sum(case when `action` in ('clicked', 'viewed') then 1 else 0 end), 0)) * 100, 2)
    end as ctr
from ads
group by ad_id
having sum(case when `action` in ('clicked', 'viewed') then 1 else 0 end) > 0
order by ctr desc, ad_id asc;

