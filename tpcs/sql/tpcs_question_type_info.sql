create table question_type_info
(
    ID   int auto_increment comment '题型编号'
        primary key,
    NAME varchar(20) not null comment '题型名称',
    constraint IDU_QUESTIONFO_NAME8AAA
        unique (NAME)
)
    comment '题目类型信息表 单选、多选、填空、判断、简答...';

INSERT INTO tpcs.question_type_info (ID, NAME) VALUES (8, 'SQL');
INSERT INTO tpcs.question_type_info (ID, NAME) VALUES (7, '关系代数');
INSERT INTO tpcs.question_type_info (ID, NAME) VALUES (4, '判断');
INSERT INTO tpcs.question_type_info (ID, NAME) VALUES (1, '单选');
INSERT INTO tpcs.question_type_info (ID, NAME) VALUES (3, '填空');
INSERT INTO tpcs.question_type_info (ID, NAME) VALUES (2, '多选');
INSERT INTO tpcs.question_type_info (ID, NAME) VALUES (5, '简答');
INSERT INTO tpcs.question_type_info (ID, NAME) VALUES (6, '综合');