package com.atoz.screw.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import com.atoz.screw.enums.BusinessType;
import com.atoz.screw.log.Log;
import com.atoz.screw.utils.R;

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
    @Log(title = "测试方法",businessType= BusinessType.OTHER)
    @GetMapping("/find")
    @ApiOperation(value = "测试OK",notes = "null")
    public R findXx(){
        return R.ok();
    }

    @PostMapping("/ins")
    @ApiOperation(value = "测试新增",notes = "name姓名")
    @Log(title = "测试新增",businessType = BusinessType.INSERT)
    public R insertTest(@RequestParam String name){
        System.out.println("name"+name);
        return R.ok(name,"成功");
    }
}
