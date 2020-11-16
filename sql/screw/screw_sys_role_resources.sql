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