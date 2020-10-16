package com.atoz.screw.service.impl;

import com.atoz.screw.entity.SysOperLog;
import com.atoz.screw.mapper.LogSysMapper;
import com.atoz.screw.service.LogSysService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-12 11:00
 */

@Service
public class LogSysServiceImpl extends ServiceImpl<LogSysMapper, SysOperLog> implements LogSysService {

    @Override
    @Async
    public void saveSysLog(SysOperLog sysOperLog) {
       baseMapper.insert(sysOperLog);
    }
}
