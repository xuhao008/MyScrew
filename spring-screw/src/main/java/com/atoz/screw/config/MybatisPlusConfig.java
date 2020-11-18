package com.atoz.screw.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 13:32
 */

@Configuration
public class MybatisPlusConfig {
    /**
     * @Description 分页插件
     * @Param []
     * @return com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor
     * @Date 2020/10/12 13:32
     **/
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

}
