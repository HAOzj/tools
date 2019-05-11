# kafka简介
kafka是一个实时的分布式的发布-订阅消息系统和数据处理工具.
相比传统的消息系统,比如ActiveMQ和RabbitMQ,kafka是分布式的,具有高扩展(分布式天然高扩展),高吞吐量,高可用和贼鸡儿快的特性.

# 消息和生产/消费
消息系统中,消息指的是不同系统之间的通过http,scp等方式传递的数据流.
消息有两端,生产端和消费端,两端的主题分别叫生产者和消费者.生产速度比消费速度快很多,会造成消息阻塞,最终系统延时;消费端宕机,则消息丢失.

# 消息中间件(Message Broker)
为了避免系统延时和宕机的问题,中间件应运而生,用来解耦消息生产和消息消费.
中间件本质上是个持久化储存消息的媒介(存在磁盘),作为消息的集散中心.即使消费者来不及消费,消息也不会丢失.
Kafka集群包含一个或多个服务器,这种服务器就叫中间件.

# Topic
Topic是kafka中数据的基本单元.
kafka中生产者发布带有topic的消息,发给中间件.每个队列对应一个topic.
消费者订阅topic,获得对应的消息队列.
这样每个消费者对应的消息队列中就只包含自己想要的.
每个消费者对应一个offset来记录当前消费的消息位置.即使发生系统宕机,重新恢复后也可以从offset处重新开始.


# Parition和Replica
Partition是物理上的概念,每个topic分多个分区(partition),分区的编号从0开始.
每个分区都有副本(replica),保证partition的高可用性,副本的数量是可以设置的.


# Broker集群
为了提高可用性和速度,kafka使用中间件集群.
分区的副本存在不同的中间价中,每个分区都有一个leader和一个或多个follower.
- leader负责提供读写服务(生产者和消费者只和leader交互),
- follower同步leader数据(也有说消费者可以在follower中进行查询,不确定).
- leader坏了就用follower.

# 参考
http://blog.hszofficial.site/experiment/2019/04/06/%E5%B8%B8%E8%A7%81%E7%9A%84%E6%B6%88%E6%81%AF%E4%B8%AD%E9%97%B4%E4%BB%B6/

https://www.bilibili.com/video/av37714232/?p=2

https://zhuanlan.zhihu.com/p/37405836

