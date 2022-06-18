create table course_info
(
    ID   int auto_increment comment '课程编号'
        primary key,
    NAME varchar(20) not null comment '课程名称',
    constraint IDU_COURSE_INFO_NAME
        unique (NAME)
)
    comment '课程信息表 课程信息表';

INSERT INTO tpcs.course_info (ID, NAME) VALUES (3, '大学英语');
INSERT INTO tpcs.course_info (ID, NAME) VALUES (14, '数据库原理及应用');
INSERT INTO tpcs.course_info (ID, NAME) VALUES (2, '线性代数');
INSERT INTO tpcs.course_info (ID, NAME) VALUES (1, '高等数学');