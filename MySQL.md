## mysql的锁机制
数据库使用中,除了传统的计算资源(CPU,RAM),不同用户也会共享数据.锁机制就是为了协调多个用户或多个进程/线程并发访问数据,保证数据并发访问的一致性和有效性.
每个事务,都可以添加对涉及到的数据的锁.

按照封锁类型分类,分为排他锁(又叫写锁或X锁)和分享锁(读锁或S锁).  
1. 排他锁,阻止其它事务对锁作用的数据的读和写;  
2. 分享锁,阻止其它事务对锁作用的数据的写.  

按照锁作用的数据的粒度,分为行锁,表锁和页锁.其中页锁比较罕见.  
1.行锁就是对记录上锁,这是最小的粒度,占用资源最多,允许的并发也最大.
试想,你锁了两行数据,其他人还可以对同表的其他行数据操作,但你和其他人可能对这张表上了好几个锁;  
2.表锁是对数据表上锁,这是最大的粒度,占用资源最少

## join相关  

+ left join： 以左表为主体,基于链接条件补充右表的列
+ right join: 以右表为主体,基于链接条件补充坐表的列
+ inner join: 基于链接条件给出左右表的列
+ inner full join: left join 和 right join的union

### 例子  

A表 

| id | name|  
| ------ | ------|
| 1 | a |
| 2 | beta |


B表 

| id | name|  
| ------ | ------|
| 1 | a |
| 2 | b |

A left join B on A.name=B.name 为


| A.id | A.name | B.id | B.name |
| ------ | ------| ------ | ------|
| 1    |  a     | 1    |  a     |
| 2    | beta   | null | null   |

A right join B on A.name=B.name 为

| A.id | A.name | B.id | B.name |
| ------ | ------| ------ | ------|
| 1    |  a     | 1    |  a     |
| null |  null  | 2    |  b     |

A inner join B on A.name=B.name 为


| A.id | A.name | B.id | B.name |
| ------ | ------| ------ | ------|
| 1    |  a     | 1    |  a     |

A full outer join B on A.name=B.name 为

| A.id | A.name | B.id | B.name |
| ------ | ------| ------ | ------|
| 1    |  a     | 1    |  a     |
| 2    | beta   | null | null   |
| null |  null  | 2    |  b     |

## @
@var: 局部变量
@@var: 全局变量

### 应用举例
#### 分组后按照某个指标选择每组前几名
按照省来分组,以gdp为指标,选取每个省gdp前十的城市  
```
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
 ```
 
 其中GDP JOIN (SELECT @current_province := NULL, @GDP_rank := 0) AS vars是为了初始化current_province和GDP_rank两个局部变量

## substring  
substring_index(str, deliminater, cnt) # 返回str中第<cnt>个deliminater之前的子串
	
## group_concat  
分组之后拼接字段  
group_concat(distinct field1 order by field1 desc separator "|")  

## in和exists区别  
https://www.cnblogs.com/linqingvoe/p/10916209.html  
rule of thumb: 内层查询的表大时用exists,反之用in  

e.g.  
select id from student where exists (select * from purchase where student.id=purchase.uid)  
select * from purchase where uid in (select id from student where age>20)


## 查看数据库和数据表所占空间大小

```
USE information_schema;
SELECT TABLE_SCHEMA, SUM(DATA_LENGTH)/1024/1024 FROM TABLES GROUP BY TABLE_SCHEMA;
SELECT TABLE_NAME, (DATA_LENGTH+INDEX_LENGTH)/1024/1024, TABLE_ROWS FROM TABLES WHERE TABLE_SCHEMA='数据库名';
```

## 整数类型  

| 类型 | 最小 | 最大 | 范围大小 | 占用字节数 |
| ------ | ------| ------ | ------|------|
| tinyint | 0 | 255 | 2^8 | 1|
| smallint| -2^15 |  2^15-1| 2^16 | 2 |
| int | -2^31 | 2^31-1 | 2^32 | 4 | 
| bigint | -2^63 | 2^63-1 | 2^64 | 8 | 
