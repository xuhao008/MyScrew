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