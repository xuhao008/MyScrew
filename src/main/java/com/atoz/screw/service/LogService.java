package com.atoz.screw.service;

import com.atoz.screw.entity.SysOperLog;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * 调用日志服务
 * 
 * @author
 */
@Service
public class LogService
{

    /**
     * 异步保存系统日志记录
     */
    @Async
    public void saveSysLog(SysOperLog sysOperLog)
    {
       // LogMapper.saveLog(sysOperLog);
    }
}
