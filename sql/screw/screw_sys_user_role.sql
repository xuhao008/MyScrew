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