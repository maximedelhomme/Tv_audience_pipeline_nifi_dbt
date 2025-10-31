
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select viewers
from "warehouse"."main_marts"."fact_audience"
where viewers is null



  
  
      
    ) dbt_internal_test