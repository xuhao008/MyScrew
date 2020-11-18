package com.atoz.screw.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.atoz.screw.entity.SysUser;
import com.atoz.screw.log.Log;
import com.atoz.screw.service.LogLoginService;
import com.atoz.screw.service.SysUserService;
import com.atoz.screw.utils.*;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 15:38
 */

@RestController
@RequestMapping("/user")
@Api(value = "用户登录认证", tags = "用户")
public class UserController {

    @Autowired
    private LogLoginService logLoginService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private WebSocket webSocket;

    @PostMapping(value = "/login")
    @ResponseBody
    @ApiOperation(value = "用户登录认证", notes = "username-用户名，password-密码")
    public R login(@RequestParam("username") String username, @RequestParam("password") String password) {
        // 从SecurityUtils里边创建一个 subject
        Subject subject = SecurityUtils.getSubject();
        // 在认证提交前准备 token（令牌）
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 执行认证登陆
        try {
            subject.login(token);
        } catch (UnknownAccountException uae) {
            return R.fail("未知账户");
        } catch (IncorrectCredentialsException ice) {
            return R.fail("密码不正确");
        } catch (LockedAccountException lae) {
            return R.fail("账户已锁定");
        } catch (ExcessiveAttemptsException eae) {
            return R.fail("用户名或密码错误次数过多");
        } catch (AuthenticationException ae) {
            return R.fail("用户名或密码不正确！");
        }
        if (subject.isAuthenticated()) {
            webSocket.sendMessage("登录成功！");
            return R.ok("登录成功");
        } else {
            token.clear();
            webSocket.sendMessage("登录失败！");
            return R.fail("登录失败");
        }
    }


    @PostMapping(value = "/registerUser")
    @ResponseBody
    @ApiOperation(value = "用户注册", notes = "username-用户名，password-密码")
    @Log(title = "注册")
    public R registerUser(@RequestParam("username") String username, @RequestParam("password") String password) {
        SysUser sysUser = new SysUser();
        String pwd = MD5EncryptionUtil.convertMD5(password);
        sysUser.setUsername(username);
        sysUser.setPassword(pwd);
        sysUser.setStatus(1);
        sysUser.setUserType("USER");
        sysUser.setRegIp(IpUtils.getIpAddr(ServletUtils.getRequest()));
        boolean save = sysUserService.save(sysUser);
        if (save) {
            return R.ok("注册成功");
        } else {
            return R.fail("注册失败");
        }
    }
}
