
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select channel_std
from "warehouse"."main_stage"."stg_dim_channels"
where channel_std is null



  
  
      
    ) dbt_internal_test