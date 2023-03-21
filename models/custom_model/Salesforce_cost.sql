{{ config(materialized='view') }}
select
 t1.order_id_c
,t1.order_date_c
,t1.ship_date_c
,t1.ship_mode_c
,t1.customer_id_c
,t1.customer_name_c
,t1.segment_c
,t1.country_region_c
,t1.city_c
,t1.state_c
,t1.postal_code_c
,t1.region_c
,t1.product_id_c
,t1.category_c
,t1.sub_category_c
,t1.product_name_c
,t1.sales_c
,t1.quantity_c
,t1.discount_c
,t1.profit_c
,t2.returned
,t3.regional_manager
from ods_salesforce_sandbox.shop_order_c t1
left join ods_mysql_shop_data.returns t2 on t2.order_id=t1.order_id_c
left join ods_mysql_shop_data.people t3 on t3.region=t1.region_c
