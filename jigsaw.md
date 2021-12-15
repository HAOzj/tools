# jigsaw

# 自定义堆和格式等

```
"seriesConfig": {
    "指标1": {
        "type": "line",  # 柱状图中弄折线
        "stack": "amount", # 如果柱状需要堆叠
        "areaStyle": {},  # 柱状
        "format": "0.00%", # 数据类型
        "yAxisIndex": 0,
        "tooltipFormat": "0,0.00" # hover到上面显示的格式
    }
}
```


# css
zIndex前后位置

# 获得环比
```
select
  cur.*,
  (cur.ord - pre.ord) / pre.ord as ord_rate
FROM
  (
    select sum(ord_success_payment) as ord
    FROM ads_ls_dashboard_outlet_conversion_funnel_daily_tab     
    where dt2 BETWEEN #{start} AND #{end} AND region IN ${site} 
        AND section=#{section} 
   ) AS cur
 left join (
     select sum(ord_success_payment) as ord
     from ads_ls_dashboard_outlet_conversion_funnel_daily_tab
     where region IN ${site} AND section=#{section} 
        AND dt2 BETWEEN DATE_ADD(#{start} , INTERVAL - #{interval} day) 
                AND DATE_ADD(#{end} , INTERVAL - #{interval} day) 
    ) as pre 
  on pre.section = cur.section
```