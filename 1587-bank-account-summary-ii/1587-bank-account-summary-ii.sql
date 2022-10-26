# Write your MySQL query statement below
with amounts as (
    select
      u.name as name,
      sum(t.amount) as balance
    from
      Users u
    join
      Transactions t
    on 
      u.account = t.account
    group by
      t.account, u.name)
select
  *
from
  amounts
where
  balance > 10000