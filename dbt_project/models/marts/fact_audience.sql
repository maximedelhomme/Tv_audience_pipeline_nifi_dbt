with m as (
  select
    a.date,
    a.country,
    coalesce(d.channel_std, upper(a.channel)) as channel_std,
    a.program,
    a.viewers
  from {{ ref('stg_audience') }} a
  left join {{ ref('stg_dim_channels') }} d
    on a.country = d.country
   and upper(a.channel) = d.alias
)
select * from m
