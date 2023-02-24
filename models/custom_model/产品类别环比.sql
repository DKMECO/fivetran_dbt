{{ config(materialized='table') }}
select
 年月
,类别
,销售数量
,lag(销售数量) over (partition by 类别 order by 年月) as 销售数量_上月
,销售数量/lag(销售数量) over (partition by 类别 order by 年月)-1 as 销售数量_环比
,销售额
,lag(销售额) over (partition by 类别 order by 年月) as 销售额_上月
,销售额/lag(销售额) over (partition by 类别 order by 年月)-1 as 销售额_环比
,销售利润
,lag(销售利润) over (partition by 类别 order by 年月) as 销售利润_上月
,销售利润/lag(销售利润) over (partition by 类别 order by 年月)-1 as 销售利润_环比
from(
select
 date_trunc('month',cast(order_date_c as date))::DATE as 年月
,category_c as 类别
,sum(cast(quantity_c as decimal)) as 销售数量
,sum(cast(sales_c as decimal)) as 销售额
,sum(cast(profit_c as decimal)) as 销售利润
from ods_salesforce_sandbox.shop_order_c t1
group by
 date_trunc('month',cast(order_date_c as date))
,category_c
)a

