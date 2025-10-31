
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    (date, country, channel_std, program) as unique_field,
    count(*) as n_records

from "warehouse"."main_marts"."fact_audience"
where (date, country, channel_std, program) is not null
group by (date, country, channel_std, program)
having count(*) > 1



  
  
      
    ) dbt_internal_test