create  database screw;
use screw;

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


create table sys_role
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(100)                         null comment '角色名',
    description varchar(100)                         null,
    available   tinyint(1) default 0                 null,
    create_time datetime   default CURRENT_TIMESTAMP null comment '添加时间',
    update_time datetime   default CURRENT_TIMESTAMP null comment '更新时间'
);

INSERT INTO screw.sys_role (id, name, description, available, create_time, update_time) VALUES (1, 'role:root', '超级管理员', 1, '2017-12-20 16:40:24', '2017-12-20 16:40:26');
INSERT INTO screw.sys_role (id, name, description, available, create_time, update_time) VALUES (2, 'role:admin', '管理员', 1, '2017-12-22 13:56:39', '2017-12-22 13:56:39');

create table sys_user_role
(
    id          bigint unsigned auto_increment
        primary key,
    user_id     bigint unsigned                    not null,
    role_id     bigint unsigned                    not null,
    create_time datetime default CURRENT_TIMESTAMP null comment '添加时间',
    update_time datetime default CURRENT_TIMESTAMP null comment '更新时间'
);

INSERT INTO screw.sys_user_role (id, user_id, role_id, create_time, update_time) VALUES (1, 1, 1, '2018-01-02 10:47:27', '2018-01-02 10:47:27');
INSERT INTO screw.sys_user_role (id, user_id, role_id, create_time, update_time) VALUES (2, 2, 2, '2018-01-05 18:21:02', '2018-01-05 18:21:02');


create table sys_resources
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(100)                                  null,
    type        varchar(50)                                   null,
    url         varchar(200)                                  null,
    permission  varchar(100)                                  null,
    parent_id   bigint unsigned     default 0                 null,
    sort        int unsigned                                  null,
    external    tinyint(1) unsigned                           null comment '是否外部链接',
    available   tinyint(1) unsigned default 0                 null,
    icon        varchar(100)                                  null comment '菜单图标',
    create_time datetime            default CURRENT_TIMESTAMP null comment '添加时间',
    update_time datetime            default CURRENT_TIMESTAMP null comment '更新时间'
);

create index idx_sys_resource_parent_id
    on sys_resources (parent_id);

INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (1, '用户管理', 'menu', null, null, 0, 1, 0, 1, 'fa fa-users', '2018-05-16 17:02:54', '2018-05-16 17:02:54');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (2, '用户列表', 'menu', '/users', 'users', 1, 1, 0, 1, null, '2017-12-22 13:56:15', '2018-05-16 14:44:20');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (3, '新增用户', 'button', null, 'user:add', 2, 2, 0, 1, null, '2018-05-16 14:07:43', '2018-05-16 14:16:23');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (4, '批量删除用户', 'button', null, 'user:batchDelete', 2, 3, 0, 1, null, '2018-05-16 14:12:23', '2018-05-16 14:16:35');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (5, '编辑用户', 'button', null, 'user:edit', 2, 4, 0, 1, null, '2018-05-16 14:12:50', '2018-05-16 14:16:43');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (6, '删除用户', 'button', null, 'user:delete', 2, 5, 0, 1, null, '2018-05-16 14:13:09', '2018-05-16 14:51:50');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (7, '分配用户角色', 'button', null, 'user:allotRole', 2, 6, 0, 1, null, '2018-05-16 14:15:28', '2018-05-16 14:16:54');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (8, '系统配置', 'menu', null, null, 0, 2, 0, 1, 'fa fa-cogs', '2017-12-20 16:40:06', '2017-12-20 16:40:08');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (9, '资源管理', 'menu', '/resources', 'resources', 8, 1, 0, 1, null, '2017-12-22 15:31:05', '2017-12-22 15:31:05');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (10, '新增资源', 'button', null, 'resource:add', 9, 2, 0, 1, null, '2018-05-16 14:07:43', '2018-05-16 14:16:23');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (11, '批量删除资源', 'button', null, 'resource:batchDelete', 9, 3, 0, 1, null, '2018-05-16 14:12:23', '2018-05-16 14:16:35');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (12, '编辑资源', 'button', null, 'resource:edit', 9, 4, 0, 1, null, '2018-05-16 14:12:50', '2018-05-16 14:16:43');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (13, '删除资源', 'button', null, 'resource:delete', 9, 5, 0, 1, null, '2018-05-16 14:13:09', '2018-05-16 14:51:50');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (14, '角色管理', 'menu', '/roles', 'roles', 8, 2, 0, 1, '', '2017-12-22 15:31:27', '2018-05-17 12:51:06');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (15, '新增角色', 'button', null, 'role:add', 14, 2, 0, 1, null, '2018-05-16 14:07:43', '2018-05-16 14:16:23');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (16, '批量删除角色', 'button', null, 'role:batchDelete', 14, 3, 0, 1, null, '2018-05-16 14:12:23', '2018-05-16 14:16:35');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (17, '编辑角色', 'button', null, 'role:edit', 14, 4, 0, 1, null, '2018-05-16 14:12:50', '2018-05-16 14:16:43');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (18, '删除角色', 'button', null, 'role:delete', 14, 5, 0, 1, null, '2018-05-16 14:13:09', '2018-05-16 14:51:50');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (19, '分配角色资源', 'button', null, 'role:allotResource', 14, 6, 0, 1, null, '2018-05-17 10:04:21', '2018-05-17 10:04:21');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (20, '数据监控', 'menu', '', '', null, 3, 0, 1, 'fa fa-heartbeat', '2018-05-17 12:38:20', '2018-05-17 12:53:06');
INSERT INTO screw.sys_resources (id, name, type, url, permission, parent_id, sort, external, available, icon, create_time, update_time) VALUES (21, 'Druid监控', 'menu', '/druid/index.html', 'druid', 20, 1, 1, 1, '', '2018-05-17 12:46:37', '2018-05-17 12:52:33');


create table sys_role_resources
(
    id           bigint unsigned auto_increment
        primary key,
    role_id      bigint unsigned                    not null,
    resources_id bigint unsigned                    not null,
    create_time  datetime default CURRENT_TIMESTAMP null comment '添加时间',
    update_time  datetime default CURRENT_TIMESTAMP null comment '更新时间'
);

INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (27, 1, 20, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (28, 1, 21, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (29, 1, 1, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (30, 1, 2, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (31, 1, 3, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (32, 1, 4, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (33, 1, 5, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (34, 1, 6, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (35, 1, 7, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (36, 1, 8, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (37, 1, 9, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (38, 1, 10, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (39, 1, 11, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (40, 1, 12, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (41, 1, 13, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (42, 1, 14, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (43, 1, 15, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (44, 1, 16, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (45, 1, 17, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (46, 1, 18, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (47, 1, 19, '2018-05-17 12:52:41', '2018-05-17 12:52:41');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (48, 2, 20, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (49, 2, 21, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (50, 2, 2, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (51, 2, 3, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (52, 2, 8, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (53, 2, 9, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (54, 2, 10, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (55, 2, 14, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (56, 2, 15, '2018-05-17 12:52:51', '2018-05-17 12:52:51');
INSERT INTO screw.sys_role_resources (id, role_id, resources_id, create_time, update_time) VALUES (57, 2, 1, '2018-05-17 12:52:51', '2018-05-17 12:52:51');


create table sys_oper_log
(
    oper_id        bigint auto_increment comment '日志主键'
        primary key,
    title          varchar(50)   default '' null comment '模块标题',
    business_type  int(2)        default 0  null comment '业务类型（0其它 1新增 2修改 3删除）',
    method         varchar(100)  default '' null comment '方法名称',
    request_method varchar(10)   default '' null comment '请求方式',
    operator_type  int(1)        default 0  null comment '操作类别（0其它 1后台用户 2手机端用户）',
    oper_name      varchar(50)   default '' null comment '操作人员',
    dept_name      varchar(50)   default '' null comment '部门名称',
    oper_url       varchar(255)  default '' null comment '请求URL',
    oper_ip        varchar(50)   default '' null comment '主机地址',
    oper_location  varchar(255)  default '' null comment '操作地点',
    oper_param     varchar(2000) default '' null comment '请求参数',
    json_result    varchar(2000) default '' null comment '返回参数',
    status         int(1)        default 0  null comment '操作状态（0正常 1异常）',
    error_msg      varchar(2000) default '' null comment '错误消息',
    oper_time      datetime                 null comment '操作时间'
)
    comment '操作日志记录';

INSERT INTO screw.sys_oper_log (oper_id, title, business_type, method, request_method, operator_type, oper_name, dept_name, oper_url, oper_ip, oper_location, oper_param, json_result, status, error_msg, oper_time) VALUES (100, '分页查询操作日志', 0, 'com.atoz.screw.controller.LogController.pageFind()', 'POST', 1, '', '', '/log/pageFind', '127.0.0.1', '', '5 1', '{"code":200,"data":{"current":1,"pages":0,"records":[],"searchCount":true,"size":5,"total":0},"msg":"分页查询日志"}', 0, '', '2020-11-13 13:43:09');
INSERT INTO screw.sys_oper_log (oper_id, title, business_type, method, request_method, operator_type, oper_name, dept_name, oper_url, oper_ip, oper_location, oper_param, json_result, status, error_msg, oper_time) VALUES (101, '分页查询操作日志', 0, 'com.atoz.screw.controller.LogController.pageFind()', 'POST', 1, '', '', '/log/pageFind', '127.0.0.1', '', '5 1', '{"code":200,"data":{"current":1,"pages":1,"records":[{"businessType":0,"errorMsg":"","jsonResult":"{\\"code\\":200,\\"data\\":{\\"current\\":1,\\"pages\\":0,\\"records\\":[],\\"searchCount\\":true,\\"size\\":5,\\"total\\":0},\\"msg\\":\\"分页查询日志\\"}","method":"com.atoz.screw.controller.LogController.pageFind()","operId":100,"operIp":"127.0.0.1","operName":"","operParam":"5 1","operTime":1605246189000,"operUrl":"/log/pageFind","operatorType":1,"requestMethod":"POST","status":0,"title":"分页查询操作日志"}],"searchCount":true,"size":5,"total":1},"msg":"分页查询日志"}', 0, '', '2020-11-13 13:43:14');
INSERT INTO screw.sys_oper_log (oper_id, title, business_type, method, request_method, operator_type, oper_name, dept_name, oper_url, oper_ip, oper_location, oper_param, json_result, status, error_msg, oper_time) VALUES (102, '测试方法', 0, 'com.atoz.screw.controller.DemoController.findXx()', 'GET', 1, '', '', '/demo/find', '127.0.0.1', '', '', '{"code":200}', 0, '', '2020-11-13 13:45:10');
INSERT INTO screw.sys_oper_log (oper_id, title, business_type, method, request_method, operator_type, oper_name, dept_name, oper_url, oper_ip, oper_location, oper_param, json_result, status, error_msg, oper_time) VALUES (103, '测试新增', 1, 'com.atoz.screw.controller.DemoController.insertTest()', 'POST', 1, '', '', '/demo/ins', '127.0.0.1', '', '1', '{"code":200,"data":"1","msg":"成功"}', 0, '', '2020-11-13 13:45:13');
INSERT INTO screw.sys_oper_log (oper_id, title, business_type, method, request_method, operator_type, oper_name, dept_name, oper_url, oper_ip, oper_location, oper_param, json_result, status, error_msg, oper_time) VALUES (104, '测试方法', 0, 'com.atoz.screw.controller.Demo2Controller.findXx()', 'GET', 1, '', '', '/demo2/find', '127.0.0.1', '', '', '{"code":200}', 0, '', '2020-11-13 13:45:20');


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


create table interface_release
(
    pub_id           int auto_increment comment 'Publish ID'
        primary key,
    pub_api_id       int                                not null comment '所属API ID',
    pub_method       varchar(12)                        not null comment 'HttpMethod：GET、PUT、POST',
    pub_path         varchar(512)                       not null comment '拦截路径',
    pub_status       int(2)                             not null comment '状态：0有效，1无效（可能被下线）',
    pub_type         varchar(24)                        not null comment '脚本类型：SQL、DataQL',
    pub_script       mediumtext                         not null comment '查询脚本：xxxxxxx',
    pub_script_ori   mediumtext                         not null comment '原始查询脚本，仅当类型为SQL时不同',
    pub_schema       mediumtext                         null comment '接口的请求/响应数据结构',
    pub_sample       mediumtext                         null comment '请求/响应/请求头样本数据',
    pub_release_time datetime default CURRENT_TIMESTAMP null comment '发布时间（下线不更新）'
)
    comment 'Dataway API 发布历史。' charset = utf8mb4;

create index idx_interface_release
    on interface_release (pub_api_id);


create table interface_info
(
    api_id          int auto_increment comment 'ID'
        primary key,
    api_method      varchar(12)                        not null comment 'HttpMethod：GET、PUT、POST',
    api_path        varchar(512)                       not null comment '拦截路径',
    api_status      int(2)                             not null comment '状态：0草稿，1发布，2有变更，3禁用',
    api_comment     varchar(255)                       null comment '注释',
    api_type        varchar(24)                        not null comment '脚本类型：SQL、DataQL',
    api_script      mediumtext                         not null comment '查询脚本：xxxxxxx',
    api_schema      mediumtext                         null comment '接口的请求/响应数据结构',
    api_sample      mediumtext                         null comment '请求/响应/请求头样本数据',
    api_create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    api_gmt_time    datetime default CURRENT_TIMESTAMP null comment '修改时间'
)
    comment 'Dataway 中的API' charset = utf8mb4;

