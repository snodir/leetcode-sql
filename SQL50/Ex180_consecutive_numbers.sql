/* Write your T-SQL query statement below */
;with A as (
select id, num, 
row_number() over(partition by num order by id) as rn,
count(*) over(partition by num) as num_count
from Logs
), B as (
select id, num, rn, id - rn as diff
from A
where num_count >= 3
)
select distinct num as ConsecutiveNums
from B 
group by num, diff
having count(*) >= 3;
