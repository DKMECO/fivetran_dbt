{{ config(materialized='table') }}
SELECT
 case when region='East' then 'Sadie Pawthorne' else regional_manager end as regional_manager
,region
FROM people
