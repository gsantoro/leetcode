# Write your MySQL query statement below
with evaluated as (
    select
     e.left_operand as left_operand,
     e.operator as operator,
     e.right_operand as right_operand,
     case 
       when e.operator = '=' then l.value = r.value
       when e.operator = '>' then l.value > r.value
       when e.operator = '<' then l.value < r.value
     end as value
    from
      Expressions e
    join
      Variables l
    on 
      e.left_operand = l.name
    join
      Variables r
    on 
      e.right_operand = r.name)
select
  left_operand,
  operator,
  right_operand,
  if(value = 1, 'true', 'false') as value
from 
  evaluated
