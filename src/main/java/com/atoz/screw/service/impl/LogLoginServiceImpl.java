package com.atoz.screw.service.impl;

import com.atoz.screw.entity.SysLogininfor;
import com.atoz.screw.mapper.LogLoginMapper;
import com.atoz.screw.service.LogLoginService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @description: 登录日志
 * @author: hao.xu
 * @create: 2020-10-16 17:09
 */
@Service
public class LogLoginServiceImpl extends ServiceImpl<LogLoginMapper,SysLogininfor> implements LogLoginService {

    @Override
    public void saveLoginLog(SysLogininfor logininfor) {
        baseMapper.insert(logininfor);
    }
}
