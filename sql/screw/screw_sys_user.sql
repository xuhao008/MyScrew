create table sys_user
(
    id              int(11) unsigned auto_increment
        primary key,
    username        varchar(100)                                             null,
    password        varchar(100)                                             null comment '登录密码',
    nickname        varchar(30)                    default ''                null comment '昵称',
    mobile          varchar(30)                                              null comment '手机号',
    email           varchar(100)                                             null comment '邮箱地址',
    qq              varchar(20)                                              null comment 'QQ',
    birthday        date                                                     null comment '生日',
    gender          tinyint(2) unsigned                                      null comment '性别',
    avatar          varchar(255)                                             null comment '头像地址',
    user_type       enum ('ROOT', 'ADMIN', 'USER') default 'ADMIN'           null comment '超级管理员、管理员、普通用户',
    reg_ip          varchar(30)                                              null comment '注册IP',
    last_login_ip   varchar(30)                                              null comment '最近登录IP',
    last_login_time datetime                                                 null comment '最近登录时间',
    login_count     int unsigned                   default 0                 null comment '登录次数',
    remark          varchar(100)                                             null comment '用户备注',
    status          int(1) unsigned                                          null comment '用户状态',
    create_time     datetime                       default CURRENT_TIMESTAMP null comment '注册时间',
    update_time     datetime                       default CURRENT_TIMESTAMP null comment '更新时间'
)
    engine = MyISAM;

INSERT INTO screw.sys_user (id, username, password, nickname, mobile, email, qq, birthday, gender, avatar, user_type, reg_ip, last_login_ip, last_login_time, login_count, remark, status, create_time, update_time) VALUES (1, 'root', 'CGUx1FN++xS+4wNDFeN6DA==', '超级管理员', '15151551516', '843977358@qq.com', '843977358', null, null, 'https://static.zhyd.me/static/img/favicon.ico', 'ROOT', null, '127.0.0.1', '2018-05-17 13:09:35', 228, null, 1, '2018-01-02 09:32:15', '2018-05-17 13:09:35');
INSERT INTO screw.sys_user (id, username, password, nickname, mobile, email, qq, birthday, gender, avatar, user_type, reg_ip, last_login_ip, last_login_time, login_count, remark, status, create_time, update_time) VALUES (2, 'admin', 'gXp2EbyZ+sB/A6QUMhiUJQ==', '管理员', '15151551516', '843977358@qq.com', '843977358', null, null, null, 'ADMIN', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '2018-05-17 13:08:30', 13, null, 1, '2018-01-02 15:56:34', '2018-05-17 13:08:30');
INSERT INTO screw.sys_user (id, username, password, nickname, mobile, email, qq, birthday, gender, avatar, user_type, reg_ip, last_login_ip, last_login_time, login_count, remark, status, create_time, update_time) VALUES (3, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '', null, null, null, null, null, null, 'USER', '127.0.0.1', null, null, 0, null, 1, '2020-11-13 05:33:28', '2020-11-13 05:33:28');