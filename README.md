# 1、集成SCREW数据库文档生成

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
# 2、集成Dataway接口配置工具
> Dataway 是基于 DataQL 服务聚合能力，为应用提供的一个接口配置工具，使得使用者无需开发任何代码就配置一个满足需求的接口。整个接口配置、测试、冒烟、发布，一站式都通过 Dataway 提供的 UI 界面完成。UI 会以 Jar 包方式提供并集成到应用中并和应用共享同一个 http 端口，应用无需单独为 Dataway 开辟新的管理端口。
> Dataway 是 Hasor 生态中的一员，因此在  Spring 中使用 Dataway 首先要做的就是打通两个生态。根据官方文档中推荐的方式我们将 Hasor 和 Spring Boot 整合起来。这里是原文：https://www.hasor.net/web/extends/spring/for_boot.html

### 需要导入maven坐标
```
<dependency>
    <groupId>net.hasor</groupId>
    <artifactId>hasor-spring</artifactId>
    <version>4.1.3</version>
</dependency>
<dependency>
    <groupId>net.hasor</groupId>
    <artifactId>hasor-dataway</artifactId>
    <version>4.1.3-fix20200414</version><!-- 4.1.3 包存在UI资源缺失问题 -->
</dependency>
```
### 需要创建配置类
```java
@DimModule
@Component
public class ExampleModule implements SpringModule {

    @Autowired
    private DataSource dataSource = null;

    @Override
    public void loadModule(ApiBinder apiBinder) throws Throwable {
        // .DataSource form Spring boot into Hasor
        apiBinder.installModule(new JdbcModule(Level.Full, this.dataSource));
    }
}
```
### 需要在properties中配置相关属性