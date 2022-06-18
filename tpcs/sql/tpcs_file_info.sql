create table file_info
(
    ID         int auto_increment comment '编号',
    USER_ID    int                                not null comment '上传文件的用户ID',
    FILE_NAME  varchar(100)                       not null comment '文件名称',
    TRUTH_NAME varchar(255)                       not null comment '真实名称',
    GMT_CREATE datetime default CURRENT_TIMESTAMP not null comment '文件上传时间',
    constraint paper_info_ID_uindex
        unique (ID),
    constraint FK_PAPER_INFO_USER_ID
        foreign key (USER_ID) references user_info (ID)
);

alter table file_info
    add primary key (ID);

INSERT INTO tpcs.file_info (ID, USER_ID, FILE_NAME, TRUTH_NAME, GMT_CREATE) VALUES (279, 1, '答案1654053550490.doc', '1654053593447.doc', '2022-06-01 11:19:53');
INSERT INTO tpcs.file_info (ID, USER_ID, FILE_NAME, TRUTH_NAME, GMT_CREATE) VALUES (280, 1, '1-s2.0-S1568494616301223-main.pdf', '1654053593461.pdf', '2022-06-01 11:19:53');
INSERT INTO tpcs.file_info (ID, USER_ID, FILE_NAME, TRUTH_NAME, GMT_CREATE) VALUES (281, 17, 'tpcs_user_info.sql', '1654053637327.sql', '2022-06-01 11:20:37');