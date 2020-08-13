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
最后我们通过访问http://127.0.0.1:8080/interface-ui，就可以访问了

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

最后运行项目我们访问http://localhost:8080/doc.html就可以查看文档了

