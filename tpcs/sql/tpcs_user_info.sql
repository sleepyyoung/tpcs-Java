create table user_info
(
    ID               int auto_increment comment '用户编号'
        primary key,
    USERNAME         varchar(20)   not null comment '用户名',
    PASSWORD         varchar(128)  not null comment '密码',
    EMAIL            varchar(100)  not null comment '邮箱',
    NOTE             text          null comment '用户提交注册请求时供管理员审核的备注',
    STATUS           int default 0 not null comment '用户状态
0：正常
1：待审核
2：已冻结',
    IS_ADMINISTRATOR tinyint(1)    null comment '是否为管理员',
    constraint IDU_USER_INFO_USERNAME
        unique (USERNAME),
    constraint user_info_EMAIL_uindex
        unique (EMAIL)
)
    comment '用户信息表 用户信息表';

INSERT INTO tpcs.user_info (ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR) VALUES (1, '1807004728', 'e07e0886471c41911ab80b472e39394a3bc01d000c22a3e3d6cbda8b94da811a1da9ffb7a77fd411ffb5f3a2956d5e15b5dddf3787806ccaf6dc3263002cd6e5', 'lipeiyang1024@163.com', null, 0, 0);
INSERT INTO tpcs.user_info (ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR) VALUES (17, 'admin', 'e07e0886471c41911ab80b472e39394a3bc01d000c22a3e3d6cbda8b94da811a1da9ffb7a77fd411ffb5f3a2956d5e15b5dddf3787806ccaf6dc3263002cd6e5', '1696589321@qq.com', null, 0, 1);
INSERT INTO tpcs.user_info (ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR) VALUES (26, 'user1', 'e07e0886471c41911ab80b472e39394a3bc01d000c22a3e3d6cbda8b94da811a1da9ffb7a77fd411ffb5f3a2956d5e15b5dddf3787806ccaf6dc3263002cd6e5', 'philpy@qq.com', null, 1, 0);
INSERT INTO tpcs.user_info (ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR) VALUES (27, 'user2', 'e07e0886471c41911ab80b472e39394a3bc01d000c22a3e3d6cbda8b94da811a1da9ffb7a77fd411ffb5f3a2956d5e15b5dddf3787806ccaf6dc3263002cd6e5', '167987284@qq.com', null, 2, 0);