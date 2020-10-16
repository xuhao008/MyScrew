package com.atoz.screw.entity;

import lombok.Data;

import java.util.Date;

/**
 * 系统访问记录表 sys_logininfor
 * 
 * @author hao.xu
 */
@Data
public class SysLogininfor{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long infoId;

    /** 用户账号 */
    private String userName;

    /** 状态 0成功 1失败 */
    private String status;

    /** 地址 */
    private String ipaddr;

    /** 描述 */
    private String msg;

    /** 访问时间 */
    private Date accessTime;
}