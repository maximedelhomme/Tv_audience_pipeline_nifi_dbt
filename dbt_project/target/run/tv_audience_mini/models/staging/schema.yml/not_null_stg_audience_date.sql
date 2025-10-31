
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select date
from "warehouse"."main_stage"."stg_audience"
where date is null



  
  
      
    ) dbt_internal_test