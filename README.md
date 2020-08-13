# SCREW数据库文档生成

### 我们可以通过SCREM两种方式生成文档
一种是通过在pom文件里面进行一系列配置就可以实现   
还有一种是编写一个方法，通过代码生成
* SCREM支持多种数据库，如mysql，sqlserver，oracle，MariaDB等
* SCREM支持word，md，html三种格式的文档生成
* SCREM可以自定义配置生成和不生成数据库文档的表

### 需要导入maven坐标
```
<!-- screw核心 -->
<dependency>
    <groupId>cn.smallbun.screw</groupId>
    <artifactId>screw-core</artifactId>
    <version>1.0.3</version>
</dependency>

<!-- HikariCP -->
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>3.4.5</version>
</dependency>

<!--mysql driver-->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.18</version>
</dependency>

<!--mysql jdbc-->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
```


