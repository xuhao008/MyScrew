package com.atoz.screw.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @description: swagger接口文档配置类,项目运行后可以通过http://localhost:8080/doc.html访问
 * @author: hao.xu
 * @create: 2020-08-13 15:10
 */

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

