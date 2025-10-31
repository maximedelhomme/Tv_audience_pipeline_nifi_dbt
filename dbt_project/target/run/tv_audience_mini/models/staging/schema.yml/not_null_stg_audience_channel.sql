
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select channel
from "warehouse"."main_stage"."stg_audience"
where channel is null



  
  
      
    ) dbt_internal_test