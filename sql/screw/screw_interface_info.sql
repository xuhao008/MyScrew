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

