{{ config(materialized='view') }}
select
 date_trunc('year',cast(t1.order_date_c as date)) as 年
,t2.regional_manager as 区域经理
,sum(cast(t1.quantity_c as decimal)) as 销售数量
,sum(cast(t1.sales_c as decimal)) as 销售额
,sum(cast(t1.profit_c as decimal)) as 销售利润
from {{ref('dm_shop_detail')}} t1
left join {{ref('dm_people_adjust')}} t2 on t2.region=t1.region_c
group by
 date_trunc('year',cast(t1.order_date_c as date))
,t1.regional_manager
