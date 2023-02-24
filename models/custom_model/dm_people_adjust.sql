{{ config(materialized='table') }}
SELECT
 case when region='East' then 'Sadie Pawthorne' else regional_manager end as regional_manager
,region
FROM ods_mysql_shop_data.people
