/* Write your T-SQL query statement below */
;with boss as (
    select managerId as boss_id
    from Employee 
    group by managerId
    having count(*) >= 5
)
select E.name
from Employee as E 
inner join boss on E.id = boss.boss_id;
