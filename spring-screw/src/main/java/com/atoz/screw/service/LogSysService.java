package com.atoz.screw.service;


import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;
import com.atoz.screw.entity.SysOperLog;

/**
 * 调用日志服务
 * 
 * @author
 */
@Service
public interface LogSysService extends IService<SysOperLog>
{
    /**
     * 异步保存系统操作日志记录
     */
    public void saveSysLog(SysOperLog sysOperLog);

}
