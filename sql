# 简介  
本文件介绍mysql使用中的一些关键字和某些棘手问题的解决方法

## join相关  

left join： 以左表为主体,基于链接条件补充右表的列
right join: 以右表为主体,基于链接条件补充坐表的列
inner join: 基于链接条件给出左右表的列
inner full join: left join 和 right join的union

### 例子  

A表 
| id | name|  
| 1 | a |
| 2 | beta |


B表 
| id | name|  
| 1 | a |
| 2 | b |

A left join B on A.name=B.name 为
| A.id | A.name | B.id | B.name |
| 1    |  a     | 1    |  a     |
| 2    | beta   | null | null   |

A right join B on A.name=B.name 为
| A.id | A.name | B.id | B.name |
| 1    |  a     | 1    |  a     |
| null |  null  | 2    |  b     |

A inner join B on A.name=B.name 为
| A.id | A.name | B.id | B.name |
| 1    |  a     | 1    |  a     |

A full outer join B on A.name=B.name 为
| A.id | A.name | B.id | B.name |
| 1    |  a     | 1    |  a     |
| 2    | beta   | null | null   |
| null |  null  | 2    |  b     |

## @
@var: 局部变量
@@var: 全局变量

## 分组后按照某个指标选择每组前几名
按照省来分组,以gdp为指标,选取每个省gdp前十的城市
SELECT province, city, gdp, GDP_rank
		FROM
 		(
   			SELECT province, city, gdp, 
        		@GDP_rank := IF(@current_province = province, @GDP_rank + 1, 1) AS GDP_rank,
        		@current_province := province
			FROM GDP JOIN (SELECT @current_province := NULL, @GDP_rank := 0) AS vars
   			ORDER BY province, GDP DESC, city
 		) ranked
 		WHERE GDP_rank <= 10;
    
 其中GDP JOIN (SELECT @current_province := NULL, @GDP_rank := 0) AS vars是为了初始化current_province和GDP_rank两个局部变量
