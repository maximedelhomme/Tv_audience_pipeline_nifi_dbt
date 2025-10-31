
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select program
from "warehouse"."main_marts"."fact_audience"
where program is null



  
  
      
    ) dbt_internal_test