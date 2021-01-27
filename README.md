#项目在线访问地址
springboot-admin访问监控:http://139.9.118.101:8888  
scew项目：http://139.9.118.101:8081      
swagger地址：http://139.9.118.101:8081/doc.html    
dataway接口配置：http://139.9.118.101:8081/interface-ui/#/  

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
> 注意：要在你的数据库里面新增两张表，在刚刚导入的jar包里面有sql文件，你可以打开idea导入的jar获取到

最后我们通过访问http://127.0.0.1:8081/interface-ui/#/

# 3、集成JApiDocs生成接口文档
我们可以通过最少的配置生成项目的接口文档，对项目的侵入性不高，但是它是生成的静态的文档     
快速上手：https://japidocs.agilestudio.cn/#/zh-cn/

### 需要导入maven坐标
```
 <dependency>
            <groupId>io.github.yedaxia</groupId>
            <artifactId>japidocs</artifactId>
            <version>1.4.2</version>
        </dependency>
```

### 需要在main方法中编写下方代码，运行就可以生成文档
```
@Test
    void Api(){
        DocsConfig config = new DocsConfig();
        config.setProjectPath("E:\\个人文件\\project\\screw\\src\\main\\java\\com\\atoz\\screw"); // 项目根目录
        config.setProjectName("screw"); // 项目名称
        config.setApiVersion("V1.0");       // 声明该API的版本
        config.setDocsPath("E:\\个人文件\\project\\screw\\doc"); // 生成API 文档所在目录
        config.setAutoGenerate(Boolean.TRUE);  // 配置自动生成
        Docs.buildHtmlDocs(config); // 执行生成文档
    }
```
> 至于它是如何生成获取文档信息的，可以查看前面网址，它主要是通过智能读取我们项目的注释信息获取，以及实体类的部分注解描述


# 4、集成Swagger在线接口文档
这里我没有使用swagger官方的ui，官方ui描述的没有这个怎么好看，我这里是bootstrap的一个ui，swagger主要是通过读取我们编写的各种注解信息
来生成文档的

### 需要导入Maven坐标
```
<dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <version>2.9.2</version>
            <exclusions>
                <exclusion>
                    <artifactId>byte-buddy</artifactId>
                    <groupId>net.bytebuddy</groupId>
                </exclusion>
                <exclusion>
                    <artifactId>slf4j-api</artifactId>
                    <groupId>org.slf4j</groupId>
                </exclusion>
                <exclusion>
                    <artifactId>spring-aop</artifactId>
                    <groupId>org.springframework</groupId>
                </exclusion>
                <exclusion>
                    <artifactId>spring-beans</artifactId>
                    <groupId>org.springframework</groupId>
                </exclusion>
                <exclusion>
                    <artifactId>spring-context</artifactId>
                    <groupId>org.springframework</groupId>
                </exclusion>
            </exclusions>
        </dependency>
        <!--SWAGGER文档ui，使用的是bootstrap的-->
        <dependency>
            <groupId>com.github.xiaoymin</groupId>
            <artifactId>swagger-bootstrap-ui</artifactId>
            <version>1.9.3</version>
        </dependency>
```

### 需要编写文档配置类
``` java
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Configuration
    public class Swagger {

        @Bean
        public Docket controllerApi() {
            return new Docket(DocumentationType.SWAGGER_2)
                    .apiInfo(getApiInfo())
                    .select()
                    .apis(RequestHandlerSelectors.basePackage("com.atoz.screw"))
                    .paths(PathSelectors.any())
                    .build();
        }

        private ApiInfo getApiInfo() {
            return new ApiInfoBuilder()
                    .title("SCREW接口文档")
                    .description("SCREW接口文档")
                    .termsOfServiceUrl("")
                    .version("1.0")
                    .build();
        }
    }
}
```

最后运行项目我们访问http://localhost:8081/doc.html
就可以查看文档了

# 5、集成springbootAdmin服务监控
Spring Boot Admin是一个开源社区项目，用于管理和监控SpringBoot应用程序。 应用程序作为Spring Boot Admin Client向为Spring Boot Admin Server注册（通过HTTP）或使用SpringCloud注册中心（例如Eureka，Consul）发现
创建springboot-admin工程作为监控服务
首先导入spring-boot-admin-starter-server的Maven坐标
```
        <dependency>
            <groupId>de.codecentric</groupId>
            <artifactId>spring-boot-admin-starter-server</artifactId>
            <version>2.3.0</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
```
然后在工程的启动类SpringBootAdminApplication加上@EnableAdminServer注解，开启AdminServer的功能      
在工程的配置文件application.yml中配置程序名和程序的端口
```yml
spring:
  application:
    name: admin-server
server:
  port: 8888
```

然后是在本工程里面创建客户端工程
导入spring-boot-admin-starter-client的Maven坐标依赖
```
        <dependency>
            <groupId>de.codecentric</groupId>
            <artifactId>spring-boot-admin-starter-client</artifactId>
            <version>2.3.0</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
```
在工程的配置文件application.yml中配置admin-server注册的地址为http://localhost:8888，最后暴露自己的actuator的所有端口信息，具体配置如下
```yml
spring.boot.admin.client.url=http://localhost:8888
management.endpoints.web.exposure.include=*
management.endpoint.health.show-details=always
```
最后启动两个工程，访问：http://localhost:8888/


# 6、集成AOP实现操作日志的保存
实现过程就不具体讲了，大概的过程是：
编写自定义注解Log，通过在请求的controller方法上面添加log注解，输入部分数据，如何编写切面类，通过@Pointcut，@AfterReturning和@AfterThrowing
来获取方法数据，或者方法异常信息，通过工具类获取请求的数据，和自定义注解定义的数据保存到实体，最后通过调用service方法，进行数据库储存操作，实现异步日志信息保存。

# 7、创建了spring-oss项目，实现阿里云OSS对象图片储存
导入pom依赖
``` pom
<!-- 图片上传 SDK 阿里云oss -->
<dependency>
    <groupId>com.aliyun.oss</groupId>
    <artifactId>aliyun-sdk-oss</artifactId>
    <version>3.10.2</version>
</dependency>
```
然后配置yml文件
``` yml
aliyun:
  #访问OSS的域名
  endpoint: oss-cn-shanghai.aliyuncs.com
  #阿里云key
  accessKeyId: xxxxxx
  #阿里云value
  accessKeySecret: xxxxx
  #管理所存储Object的存储空间名称
  bucketName: xkkj-chenxing
```
通过阿里云提供的Api和自己写一些接口，实现图片上传，下载等等

