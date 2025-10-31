with base as (
  select
    date, country, channel_std, program, viewers,
    row_number() over (partition by date, country order by viewers desc) as rk
  from "warehouse"."main_marts"."fact_audience"
)
select
  date, country, channel_std, program, viewers,
  rk as rank_in_country
from base
where rk <= 10
order by date, country, rk