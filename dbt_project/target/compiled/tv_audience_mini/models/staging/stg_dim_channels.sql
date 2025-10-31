select
  upper(country) as country,
  trim(alias) as alias,
  trim(channel_std) as channel_std
from stage.dim_channels_raw