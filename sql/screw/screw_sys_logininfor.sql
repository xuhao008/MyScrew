create table sys_logininfor
(
    info_id     bigint auto_increment comment '访问ID'
        primary key,
    user_name   varchar(50)  default ''  null comment '用户账号',
    ipaddr      varchar(50)  default ''  null comment '登录IP地址',
    status      char         default '0' null comment '登录状态（0成功 1失败）',
    msg         varchar(255) default ''  null comment '提示信息',
    access_time datetime                 null comment '访问时间'
)
    comment '系统访问记录' charset = latin1;

INSERT INTO screw.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (100, 'zhangsan', '127.0.0.1', '0', '1', '2020-11-13 13:35:28');