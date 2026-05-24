
  
    
    
    USE [taxi];
    
    

    EXEC('create view [dbo].[nyc_trip_count__dbt_temp__dbt_tmp_vw] as with new_york_taxis as (
       select * from nyctlc
   ),
   final as (
     SELECT
       vendorID,
       CAST(lpepPickupDatetime AS DATE) AS trip_date,
       COUNT(*) AS trip_count
     FROM
         [taxi].[dbo].[nyctlc]
     GROUP BY
         vendorID,
         CAST(lpepPickupDatetime AS DATE)
   
   )
   select * from final;');




    
    

    
    
            EXEC('CREATE TABLE [taxi].[dbo].[nyc_trip_count__dbt_temp]  AS SELECT * FROM [taxi].[dbo].[nyc_trip_count__dbt_temp__dbt_tmp_vw] 
    OPTION (LABEL = ''dbt-fabric-dw'');
');
        
    


  
  