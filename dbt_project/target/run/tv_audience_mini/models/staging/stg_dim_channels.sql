
  
  create view "warehouse"."main_stage"."stg_dim_channels__dbt_tmp" as (
    select
  upper(country) as country,
  trim(alias) as alias,
  trim(channel_std) as channel_std
from stage.dim_channels_raw
  );
