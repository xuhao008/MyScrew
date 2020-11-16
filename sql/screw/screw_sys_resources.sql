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