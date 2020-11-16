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