with raw as (
  select
    cast(date as date) as date,
    upper(country) as country,
    trim(channel) as channel,
    trim(program) as program,
    viewers::bigint as viewers,
    cast(loaded_at as timestamp) as loaded_at
  from stage.audience_raw
),
tag as (
  select
    *,
    row_number() over (
      partition by date, country, channel, program
      order by loaded_at desc, program asc
    ) as rk
  from raw
)
select * from tag where rk = 1
