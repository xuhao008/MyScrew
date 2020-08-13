package com.atoz.screw.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-08-13 14:59
 */

@RestController
@RequestMapping("/demo")
@Api(value = "项目demo", tags = "项目demo接口")
public class DemoController {
    
    /**
     * @Description 查询信息
     * @Param []
     * @return java.lang.String
     * @Date 2020/8/13 15:00
     **/
    @GetMapping("/find")
    @ApiOperation(value = "获取信息",notes = "null")
    public String findXx(){
        return "快乐";
    }
}
