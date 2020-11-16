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

