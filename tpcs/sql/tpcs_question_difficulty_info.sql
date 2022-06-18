create table question_difficulty_info
(
    ID   int auto_increment comment '题目难度编号'
        primary key,
    NAME varchar(20) not null comment '题目难度名称',
    constraint IDU_QUESTIONFO_NAME4562
        unique (NAME)
)
    comment '题目难度信息表 简单、中等、困难...';

INSERT INTO tpcs.question_difficulty_info (ID, NAME) VALUES (2, '中等');
INSERT INTO tpcs.question_difficulty_info (ID, NAME) VALUES (3, '困难');
INSERT INTO tpcs.question_difficulty_info (ID, NAME) VALUES (1, '简单');