
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select country
from "warehouse"."main_stage"."stg_dim_channels"
where country is null



  
  
      
    ) dbt_internal_test