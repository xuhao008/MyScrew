package com.atoz.screw.service;

import com.atoz.screw.entity.SysLogininfor;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-16 17:08
 */
public interface LogLoginService extends IService<SysLogininfor> {
    /**
     * @Description 保存系统用户登录日志
     * @Param [logininfor]
     * @return void
     * @Date 2020/10/16 17:05
     **/
    void saveLoginLog(SysLogininfor logininfor);
}
