package com.atoz.screw.controller;

import com.atoz.screw.enums.BusinessType;
import com.atoz.screw.log.Log;
import com.atoz.screw.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 17:18
 */

@RestController
@RequestMapping("/demo2")
@Api(value = "demo2")
public class Demo2Controller {
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
}
