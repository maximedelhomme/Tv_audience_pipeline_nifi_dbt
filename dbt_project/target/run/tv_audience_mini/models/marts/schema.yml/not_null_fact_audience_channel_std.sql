
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select channel_std
from "warehouse"."main_marts"."fact_audience"
where channel_std is null



  
  
      
    ) dbt_internal_test