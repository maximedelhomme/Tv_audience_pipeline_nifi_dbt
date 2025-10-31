
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select alias
from "warehouse"."main_stage"."stg_dim_channels"
where alias is null



  
  
      
    ) dbt_internal_test