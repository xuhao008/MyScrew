# 数据库设计文档

**数据库名：** demo

**文档版本：** 1.0.2

**文档描述：** 生成文档信息描述
| 表名                  | 说明       |
| :-------------------- | :--------- |
| [interface_info](#interface_info) |  |
| [interface_release](#interface_release) |  |
| [sys_logininfor](#sys_logininfor) |  |
| [sys_oper_log](#sys_oper_log) |  |
**表名：** <a id="interface_info">interface_info</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :--: | :--- | :------: | :----: | :----: | :------: | :--: | :----: | :--: |
|  1   | api_id |   int   | 10 |   0    |    N     |  Y   |       | ID  |
|  2   | api_method |   varchar   | 12 |   0    |    N     |  N   |       | HttpMethod：GET、PUT、POST  |
|  3   | api_path |   varchar   | 512 |   0    |    N     |  N   |       | 拦截路径  |
|  4   | api_status |   int   | 10 |   0    |    N     |  N   |       | 状态：0草稿，1发布，2有变更，3禁用  |
|  5   | api_comment |   varchar   | 255 |   0    |    Y     |  N   |       | 注释  |
|  6   | api_type |   varchar   | 24 |   0    |    N     |  N   |       | 脚本类型：SQL、DataQL  |
|  7   | api_script |   mediumtext   | 16777215 |   0    |    N     |  N   |       | 查询脚本：xxxxxxx  |
|  8   | api_schema |   mediumtext   | 16777215 |   0    |    Y     |  N   |       | 接口的请求/响应数据结构  |
|  9   | api_sample |   mediumtext   | 16777215 |   0    |    Y     |  N   |       | 请求/响应/请求头样本数据  |
|  10   | api_create_time |   datetime   | 19 |   0    |    Y     |  N   |   CURRENT_TIMESTAMP    | 创建时间  |
|  11   | api_gmt_time |   datetime   | 19 |   0    |    Y     |  N   |   CURRENT_TIMESTAMP    | 修改时间  |
**表名：** <a id="interface_release">interface_release</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :--: | :--- | :------: | :----: | :----: | :------: | :--: | :----: | :--: |
|  1   | pub_id |   int   | 10 |   0    |    N     |  Y   |       | PublishID  |
|  2   | pub_api_id |   int   | 10 |   0    |    N     |  N   |       | 所属APIID  |
|  3   | pub_method |   varchar   | 12 |   0    |    N     |  N   |       | HttpMethod：GET、PUT、POST  |
|  4   | pub_path |   varchar   | 512 |   0    |    N     |  N   |       | 拦截路径  |
|  5   | pub_status |   int   | 10 |   0    |    N     |  N   |       | 状态：0有效，1无效（可能被下线）  |
|  6   | pub_type |   varchar   | 24 |   0    |    N     |  N   |       | 脚本类型：SQL、DataQL  |
|  7   | pub_script |   mediumtext   | 16777215 |   0    |    N     |  N   |       | 查询脚本：xxxxxxx  |
|  8   | pub_script_ori |   mediumtext   | 16777215 |   0    |    N     |  N   |       | 原始查询脚本，仅当类型为SQL时不同  |
|  9   | pub_schema |   mediumtext   | 16777215 |   0    |    Y     |  N   |       | 接口的请求/响应数据结构  |
|  10   | pub_sample |   mediumtext   | 16777215 |   0    |    Y     |  N   |       | 请求/响应/请求头样本数据  |
|  11   | pub_release_time |   datetime   | 19 |   0    |    Y     |  N   |   CURRENT_TIMESTAMP    | 发布时间（下线不更新）  |
**表名：** <a id="sys_logininfor">sys_logininfor</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :--: | :--- | :------: | :----: | :----: | :------: | :--: | :----: | :--: |
|  1   | info_id |   bigint   | 19 |   0    |    N     |  Y   |       | 访问ID  |
|  2   | user_name |   varchar   | 50 |   0    |    Y     |  N   |       | 用户账号  |
|  3   | ipaddr |   varchar   | 50 |   0    |    Y     |  N   |       | 登录IP地址  |
|  4   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 登录状态（0成功1失败）  |
|  5   | msg |   varchar   | 255 |   0    |    Y     |  N   |       | 提示信息  |
|  6   | access_time |   datetime   | 19 |   0    |    Y     |  N   |       | 访问时间  |
**表名：** <a id="sys_oper_log">sys_oper_log</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :--: | :--- | :------: | :----: | :----: | :------: | :--: | :----: | :--: |
|  1   | oper_id |   bigint   | 19 |   0    |    N     |  Y   |       | 日志主键  |
|  2   | title |   varchar   | 50 |   0    |    Y     |  N   |       | 模块标题  |
|  3   | business_type |   int   | 10 |   0    |    Y     |  N   |   0    | 业务类型（0其它1新增2修改3删除）  |
|  4   | method |   varchar   | 100 |   0    |    Y     |  N   |       | 方法名称  |
|  5   | request_method |   varchar   | 10 |   0    |    Y     |  N   |       | 请求方式  |
|  6   | operator_type |   int   | 10 |   0    |    Y     |  N   |   0    | 操作类别（0其它1后台用户2手机端用户）  |
|  7   | oper_name |   varchar   | 50 |   0    |    Y     |  N   |       | 操作人员  |
|  8   | dept_name |   varchar   | 50 |   0    |    Y     |  N   |       | 部门名称  |
|  9   | oper_url |   varchar   | 255 |   0    |    Y     |  N   |       | 请求URL  |
|  10   | oper_ip |   varchar   | 50 |   0    |    Y     |  N   |       | 主机地址  |
|  11   | oper_location |   varchar   | 255 |   0    |    Y     |  N   |       | 操作地点  |
|  12   | oper_param |   varchar   | 2000 |   0    |    Y     |  N   |       | 请求参数  |
|  13   | json_result |   varchar   | 2000 |   0    |    Y     |  N   |       | 返回参数  |
|  14   | status |   int   | 10 |   0    |    Y     |  N   |   0    | 操作状态（0正常1异常）  |
|  15   | error_msg |   varchar   | 2000 |   0    |    Y     |  N   |       | 错误消息  |
|  16   | oper_time |   datetime   | 19 |   0    |    Y     |  N   |       | 操作时间  |
