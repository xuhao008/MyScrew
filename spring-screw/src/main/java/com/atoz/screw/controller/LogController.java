package com.atoz.screw.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.atoz.screw.entity.SysLogininfor;
import com.atoz.screw.entity.SysOperLog;
import com.atoz.screw.enums.Constants;
import com.atoz.screw.log.Log;
import com.atoz.screw.service.LogLoginService;
import com.atoz.screw.service.LogSysService;
import com.atoz.screw.utils.IpUtils;
import com.atoz.screw.utils.R;
import com.atoz.screw.utils.ServletUtils;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 11:05
 */

@RestController
@RequestMapping("/log")
@Api(value = "日志管理",tags = "LogController日志管理controller")
public class LogController {

    @Autowired
    private LogLoginService logLoginService;

    @Autowired
    private LogSysService logSysService;

    @GetMapping("/logList")
    @ApiOperation(value = "获取日志信息")
    public R findLogList(){
        List<SysOperLog> list =logSysService.list();
        return   R.ok(list,"成功");
    }

    @PostMapping("pageFind")
    @ApiOperation(value = "分页查询日志信息",notes = "pageSize-每页大小,currentPage-当前页")
    @Log(title = "分页查询操作日志")
    public R pageFind(@RequestParam("pageSize") Integer pageSize,@RequestParam("currentPage") Integer currentPage ){
        IPage<SysOperLog> page=new Page<>(currentPage,pageSize);
        IPage<SysOperLog> logPage = logSysService.page(page, null);
        return R.ok(logPage,"分页查询日志");
    }

    @PostMapping(value = "/loginLog")
    @ResponseBody
    @ApiOperation(value = "登录日志", notes = "username-用户名，status-状态，message-描述")
    public void saveLoginLog(@RequestParam("username") String username, @RequestParam("status") String status,
                             @RequestParam("message") String message) {

        String ip = IpUtils.getIpAddr(ServletUtils.getRequest());
        // 封装对象
        SysLogininfor logininfor = new SysLogininfor();
        logininfor.setUserName(username);
        logininfor.setIpaddr(ip);
        logininfor.setMsg(message);
        logininfor.setAccessTime(new Date());
        // 日志状态
        if (Constants.LOGIN_SUCCESS.equals(status) || Constants.LOGOUT.equals(status)) {
            logininfor.setStatus("成功");
        } else if (Constants.LOGIN_FAIL.equals(status)) {
            logininfor.setStatus("失败");
        }
        logLoginService.saveLoginLog(logininfor);
    }
}
