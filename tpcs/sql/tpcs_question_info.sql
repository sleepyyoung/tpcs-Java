create table question_info
(
    ID            int auto_increment comment '题目编号'
        primary key,
    SCORE         double                               not null comment '题目分值',
    USER_ID       int                                  not null comment '所属用户',
    TYPE_ID       int                                  null comment '题目类型',
    DIFFICULTY_ID int                                  not null comment '题目难度',
    COURSE_ID     int                                  not null comment '题目所属课程',
    QUESTION_MD   text                                 null comment 'markdown格式的题目内容',
    QUESTION_TXT  text                                 null comment '纯文本格式的题目内容',
    QUESTION_HTML text                                 null comment 'html格式的题目内容',
    ANSWER_MD     text                                 null comment 'markdown格式的答案内容',
    ANSWER_TXT    text                                 null comment '纯文本格式的答案内容',
    ANSWER_HTML   text                                 null comment 'html格式的答案内容',
    GMT_CREATE    datetime   default CURRENT_TIMESTAMP not null comment '创建时间',
    GMT_MODIFIED  datetime   default CURRENT_TIMESTAMP not null comment '最后一次修改时间',
    REMOVED       tinyint(1) default 0                 not null comment '逻辑删除标记',
    constraint FK_QUESTIONFO_COURSE_ID654C
        foreign key (COURSE_ID) references course_info (ID),
    constraint FK_QUESTIONFO_DIFFICU_ID8A61
        foreign key (DIFFICULTY_ID) references question_difficulty_info (ID),
    constraint FK_QUESTION_INFO_TYPE_ID
        foreign key (TYPE_ID) references question_type_info (ID),
    constraint FK_QUESTION_INFO_USER_ID
        foreign key (USER_ID) references user_info (ID)
)
    comment '题目信息表';

create index IDX_QUESTIONFO_COURSE_ID654C
    on question_info (COURSE_ID);

create index IDX_QUESTIONFO_DIFFICU_ID8A61
    on question_info (DIFFICULTY_ID);

create index IDX_QUESTION_INFO_TYPE_ID
    on question_info (TYPE_ID);

create fulltext index fti_answer_info_ngram
    on question_info (ANSWER_TXT);

create fulltext index fti_question_info_ngram
    on question_info (QUESTION_TXT);

INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (162, 1, 1, 1, 3, 14, 'DB、DBMS和DBS三者之间的关系是（ ）。
A．DB包括DBMS和DBS
B．DBS包括DB和DBMS
C．DBMS包括DB和DBS
D．不能相互包括', 'DB、DBMS和DBS三者之间的关系是（ ）。A．DB包括DBMS和DBSB．DBS包括DB和DBMSC．DBMS包括DB和DBSD．不能相互包括
', '<p>DB、DBMS和DBS三者之间的关系是（ ）。<br>A．DB包括DBMS和DBS<br>B．DBS包括DB和DBMS<br>C．DBMS包括DB和DBS<br>D．不能相互包括
', 'B', 'B
', '<p>B</p>
', '2022-03-06 10:38:01', '2022-03-06 10:38:01', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (163, 1, 1, 1, 3, 14, '对数据库物理存储方式的描述称为（ ）
A．外模式
B．内模式
C．概念模式
D．逻辑模式', '对数据库物理存储方式的描述称为（ ）A．外模式B．内模式C．概念模式D．逻辑模式
', '<p>对数据库物理存储方式的描述称为（ ）<br>A．外模式<br>B．内模式<br>C．概念模式<br>D．逻辑模式
', 'B', 'B
', '<p>B</p>
', '2022-03-06 10:38:28', '2022-03-06 10:38:28', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (164, 1, 1, 1, 1, 14, '在数据库三级模式间引入二级映象的主要作用是（　 　）
A．提高数据与程序的独立性
B．提高数据与程序的安全性
C．保持数据与程序的一致性
D．提高数据与程序的可移植性', '在数据库三级模式间引入二级映象的主要作用是（　 　）A．提高数据与程序的独立性B．提高数据与程序的安全性C．保持数据与程序的一致性D．提高数据与程序的可移植性
', '<p>在数据库三级模式间引入二级映象的主要作用是（　 　）<br>A．提高数据与程序的独立性<br>B．提高数据与程序的安全性<br>C．保持数据与程序的一致性<br>D．提高数据与程序的可移植性
', 'A', 'A
', '<p>A</p>
', '2022-03-06 10:38:52', '2022-03-06 10:38:52', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (165, 1, 1, 1, 1, 14, '视图是一个“虚表”，视图的构造基于（ ）
A．基本表
B．视图
C．基本表或视图
D．数据字典', '视图是一个“虚表”，视图的构造基于（ ）A．基本表B．视图C．基本表或视图D．数据字典
', '<p>视图是一个“虚表”，视图的构造基于（ ）<br>A．基本表<br>B．视图<br>C．基本表或视图<br>D．数据字典
', 'C', 'C
', '<p>C</p>
', '2022-03-06 10:39:15', '2022-03-06 10:39:15', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (166, 1, 1, 1, 1, 14, '关系代数中的π运算符对应SELECT语句中的以下哪个子句？（　 ）
A．SELECT
B．FROM
C．WHERE
D．GROUP BY', '关系代数中的π运算符对应SELECT语句中的以下哪个子句？（　 ）A．SELECTB．FROMC．WHERED．GROUP BY
', '<p>关系代数中的π运算符对应SELECT语句中的以下哪个子句？（　 ）<br>A．SELECT<br>B．FROM<br>C．WHERE<br>D．GROUP BY
', 'A', 'A
', '<p>A</p>
', '2022-03-06 10:39:38', '2022-03-06 10:39:38', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (167, 1, 1, 1, 1, 14, '公司中有多个部门和多名职员，每个职员只能属于一个部门，一个部门可以有多名职员，从职员到部门的联系类型是（ ）
A．多对多
B．一对一
C．多对一
D．一对多', '公司中有多个部门和多名职员，每个职员只能属于一个部门，一个部门可以有多名职员，从职员到部门的联系类型是（ ）A．多对多B．一对一C．多对一D．一对多
', '<p>公司中有多个部门和多名职员，每个职员只能属于一个部门，一个部门可以有多名职员，从职员到部门的联系类型是（ ）<br>A．多对多<br>B．一对一<br>C．多对一<br>D．一对多
', 'C', 'C
', '<p>C</p>
', '2022-03-06 10:40:07', '2022-03-06 10:40:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (168, 1, 1, 1, 1, 14, '如何构造出一个合适的数据逻辑结构是（ ）主要解决的问题。
A．关系系统查询优化 B．数据字典
C．关系数据库规范化理论 D．关系数据库查询', '如何构造出一个合适的数据逻辑结构是（ ）主要解决的问题。A．关系系统查询优化 B．数据字典C．关系数据库规范化理论 D．关系数据库查询
', '<p>如何构造出一个合适的数据逻辑结构是（ ）主要解决的问题。<br>A．关系系统查询优化 B．数据字典<br>C．关系数据库规范化理论 D．关系数据库查询
', 'C', 'C
', '<p>C</p>
', '2022-03-06 10:40:25', '2022-03-06 10:40:25', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (169, 1, 1, 1, 1, 14, '将E-R模型转换成关系模型，属于数据库的（ ）。
A. 需求分析
B. 概念设计
C. 逻辑设计
D. 物理设计', '将E-R模型转换成关系模型，属于数据库的（ ）。A. 需求分析B. 概念设计C. 逻辑设计D. 物理设计
', '<p>将E-R模型转换成关系模型，属于数据库的（ ）。<br>A. 需求分析<br>B. 概念设计<br>C. 逻辑设计<br>D. 物理设计
', 'C', 'C
', '<p>C</p>
', '2022-03-06 10:41:10', '2022-03-06 10:41:10', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (170, 1, 1, 1, 1, 14, '事务日志的用途是（ ）
A. 事务处理
B. 完整性约束
C. 数据恢复
D. 安全性控制', '事务日志的用途是（ ）A. 事务处理B. 完整性约束C. 数据恢复D. 安全性控制
', '<p>事务日志的用途是（ ）<br>A. 事务处理<br>B. 完整性约束<br>C. 数据恢复<br>D. 安全性控制
', 'C', 'C
', '<p>C</p>
', '2022-03-06 10:41:33', '2022-03-06 10:41:33', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (171, 1, 1, 1, 1, 14, '如果事务T已在数据R上加了X锁，则其他事务在数据R上（ ）
A. 只可加X锁
B. 只可加S锁
C. 可加S锁或X锁
D. 不能加任何锁', '如果事务T已在数据R上加了X锁，则其他事务在数据R上（ ）A. 只可加X锁B. 只可加S锁C. 可加S锁或X锁D. 不能加任何锁
', '<p>如果事务T已在数据R上加了X锁，则其他事务在数据R上（ ）<br>A. 只可加X锁<br>B. 只可加S锁<br>C. 可加S锁或X锁<br>D. 不能加任何锁
', 'D', 'D
', '<p>D</p>
', '2022-03-06 10:41:55', '2022-03-06 10:41:55', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (172, 2, 1, 3, 1, 14, '数据库的逻辑数据独立性是由<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>映象提供的。', '数据库的逻辑数据独立性是由&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;映象提供的。
', '<p>数据库的逻辑数据独立性是由<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>映象提供的。</p>
', '外模式/模式', '外模式/模式
', '<p>外模式/模式</p>
', '2022-03-06 10:44:57', '2022-03-06 10:44:57', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (173, 2, 1, 3, 1, 14, '关系代数中专门的关系运算包括：选择、投影、连接和<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。', '关系代数中专门的关系运算包括：选择、投影、连接和&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;。
', '<p>关系代数中专门的关系运算包括：选择、投影、连接和<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。</p>
', '除', '除
', '<p>除</p>
', '2022-03-06 10:45:32', '2022-03-06 10:45:32', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (174, 2, 1, 3, 1, 14, '设有学生表S（学号，姓名，班级）和学生选课表SC（学号，课程号，成绩），为维护数据一执行，表S和表SC之间应满足<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>完整性约束。', '设有学生表S（学号，姓名，班级）和学生选课表SC（学号，课程号，成绩），为维护数据一执行，表S和表SC之间应满足&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;完整性约束。
', '<p>设有学生表S（学号，姓名，班级）和学生选课表SC（学号，课程号，成绩），为维护数据一执行，表S和表SC之间应满足<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>完整性约束。</p>
', '参照', '参照
', '<p>参照</p>
', '2022-03-06 10:46:06', '2022-03-06 10:46:06', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (175, 2, 1, 3, 1, 14, '当数据库破坏后，如果事先保存了数据库副本和<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>，就有可能恢复数据库。', '当数据库破坏后，如果事先保存了数据库副本和&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;，就有可能恢复数据库。
', '<p>当数据库破坏后，如果事先保存了数据库副本和<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>，就有可能恢复数据库。</p>
', '日志文件', '日志文件
', '<p>日志文件</p>
', '2022-03-06 10:46:40', '2022-03-06 10:46:40', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (176, 2, 1, 3, 1, 14, '如果一个满足1NF关系的所有属性合起来组成一个关键字，该关系最高满足的范式是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（在1NF，2NF,3NF范围内）', '如果一个满足1NF关系的所有属性合起来组成一个关键字，该关系最高满足的范式是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（在1NF，2NF,3NF范围内）
', '<p>如果一个满足1NF关系的所有属性合起来组成一个关键字，该关系最高满足的范式是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（在1NF，2NF,3NF范围内）</p>
', '3NF', '3NF
', '<p>3NF</p>
', '2022-03-06 10:47:20', '2022-03-06 10:47:20', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (177, 2, 1, 3, 1, 14, '设关系模式R（A,B,C,D），函数依赖集F={AB→C，D→B}，则R的候选码为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>', '设关系模式R（A,B,C,D），函数依赖集F={AB→C，D→B}，则R的候选码为&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
', '<p>设关系模式R（A,B,C,D），函数依赖集F={AB→C，D→B}，则R的候选码为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></p>
', 'AD
解析：L：A,D ； R：C ； N：none； LR：B;AD的闭包包含所有属性。', 'AD解析：L：A,D ； R：C ； N：none； LR：B;AD的闭包包含所有属性。
', '<p>AD<br>解析：L：A,D ； R：C ； N：none； LR：B;AD的闭包包含所有属性。
', '2022-03-06 10:48:05', '2022-03-06 10:48:05', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (178, 2, 1, 3, 1, 14, '从关系规范化理论的角度讲，一个只满足1NF的关系可能存在的四方面问题是：数据冗余度大、插入异常、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>和删除异常。', '从关系规范化理论的角度讲，一个只满足1NF的关系可能存在的四方面问题是：数据冗余度大、插入异常、&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;和删除异常。
', '<p>从关系规范化理论的角度讲，一个只满足1NF的关系可能存在的四方面问题是：数据冗余度大、插入异常、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>和删除异常。</p>
', '修改异常', '修改异常
', '<p>修改异常</p>
', '2022-03-06 10:48:37', '2022-03-06 10:48:37', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (179, 2, 1, 3, 1, 14, '并发控制的主要方法是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>机制.', '并发控制的主要方法是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机制.
', '<p>并发控制的主要方法是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>机制.</p>
', '封锁', '封锁
', '<p>封锁</p>
', '2022-03-06 10:49:07', '2022-03-06 10:49:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (180, 2, 1, 3, 3, 14, '若有关系模式R(A，B，C)和S(C，D，E)，SQL语句
```sql
SELECT A, D FROM R, S WHERE R.C=S.C AND E = ''80'' ;
```
对应的关系代数表达式是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>', '若有关系模式R(A，B，C)和S(C，D，E)，SQL语句
SELECT A, D FROM R, S WHERE R.C=S.C AND E = ''80'' ;

对应的关系代数表达式是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
', '<p>若有关系模式R(A，B，C)和S(C，D，E)，SQL语句</p>
<pre><code class="lang-sql">SELECT A, D FROM R, S WHERE R.C=S.C AND E = ''80'' ;
</code></pre>
<p>对应的关系代数表达式是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></p>
', '![](/files/1646535032220.png)', '
', '<p><img src="/files/1646535032220.png" alt="">
', '2022-03-06 10:51:19', '2022-03-06 10:51:19', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (181, 2, 1, 3, 1, 14, '分E-R图之间的冲突主要有属性冲突、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>、结构冲突三种。', '分E-R图之间的冲突主要有属性冲突、&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;、结构冲突三种。
', '<p>分E-R图之间的冲突主要有属性冲突、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>、结构冲突三种。</p>
', '命名冲突', '命名冲突
', '<p>命名冲突</p>
', '2022-03-06 10:52:25', '2022-03-06 10:52:25', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (182, 5, 1, 5, 1, 14, '说明视图与基本表的区别和联系。<br><br><br>', '说明视图与基本表的区别和联系。
', '<p>说明视图与基本表的区别和联系。<br><br><br>
', '视图是从一个或多个基本表中导出来的表，它与基本表不同，他是一个虚表，数据库中只存放视图的定义，而不存放视图对应的数据，这些数据存放在原来的基本表中，当基本表中的数据发生变化，从视图中查询出的数据也随之改变。视图一经定义就可以像基本表一样被查询、删除，也可以在一个视图之上再定义新的视图，但是对视图的更新操作有限制。', '视图是从一个或多个基本表中导出来的表，它与基本表不同，他是一个虚表，数据库中只存放视图的定义，而不存放视图对应的数据，这些数据存放在原来的基本表中，当基本表中的数据发生变化，从视图中查询出的数据也随之改变。视图一经定义就可以像基本表一样被查询、删除，也可以在一个视图之上再定义新的视图，但是对视图的更新操作有限制。
', '<p>视图是从一个或多个基本表中导出来的表，它与基本表不同，他是一个虚表，数据库中只存放视图的定义，而不存放视图对应的数据，这些数据存放在原来的基本表中，当基本表中的数据发生变化，从视图中查询出的数据也随之改变。视图一经定义就可以像基本表一样被查询、删除，也可以在一个视图之上再定义新的视图，但是对视图的更新操作有限制。</p>
', '2022-03-06 10:53:14', '2022-03-06 10:53:14', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (183, 5, 1, 5, 1, 14, '简述事务的特征。<br><br><br>', '简述事务的特征。
', '<p>简述事务的特征。<br><br><br>
', '原子性：事务中包括所有操作，要么都做，要么都不做。 一执行：事务必须使数据库从一个一致性状态变到另一个一致性状态。 隔离性：一个事务内部的操作以及使用的数据对并发的其他事务是隔离的。 持久性：事务一旦提交，对数据库的改变是永久的。 ', '原子性：事务中包括所有操作，要么都做，要么都不做。 一执行：事务必须使数据库从一个一致性状态变到另一个一致性状态。 隔离性：一个事务内部的操作以及使用的数据对并发的其他事务是隔离的。 持久性：事务一旦提交，对数据库的改变是永久的。
', '<p>原子性：事务中包括所有操作，要么都做，要么都不做。 一执行：事务必须使数据库从一个一致性状态变到另一个一致性状态。 隔离性：一个事务内部的操作以及使用的数据对并发的其他事务是隔离的。 持久性：事务一旦提交，对数据库的改变是永久的。 </p>
', '2022-03-06 10:53:39', '2022-03-06 10:53:39', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (184, 5, 1, 5, 2, 14, '试述关系模型的参照完整性规则。<br><br><br>', '试述关系模型的参照完整性规则。
', '<p>试述关系模型的参照完整性规则。<br><br><br>
', '若属性F是基本关系R的外码，他与基本关系S的主码Ks相对应，则对于R中每个元组在F上的值必须为取空值，或者等于S中某个元组的主码值。', '若属性F是基本关系R的外码，他与基本关系S的主码Ks相对应，则对于R中每个元组在F上的值必须为取空值，或者等于S中某个元组的主码值。
', '<p>若属性F是基本关系R的外码，他与基本关系S的主码Ks相对应，则对于R中每个元组在F上的值必须为取空值，或者等于S中某个元组的主码值。</p>
', '2022-03-06 10:54:28', '2022-03-06 10:54:28', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (185, 5, 1, 5, 3, 14, '简述系统故障时的数据库恢复策略。<br><br><br>', '简述系统故障时的数据库恢复策略。
', '<p>简述系统故障时的数据库恢复策略。<br><br><br>
', '数据冗余恢复，与日志恢复技术。正像扫描日志文件，找出在故障发生前已经提交的事务，将其事务标识记入REDO队列，同时找出故障发生时尚未完成的事务，将其事务标识记入UNDO队列，对UNDO队列中的各个事务进行撤销处理；对REDO队列中的各个事务进行重做处理。', '数据冗余恢复，与日志恢复技术。正像扫描日志文件，找出在故障发生前已经提交的事务，将其事务标识记入REDO队列，同时找出故障发生时尚未完成的事务，将其事务标识记入UNDO队列，对UNDO队列中的各个事务进行撤销处理；对REDO队列中的各个事务进行重做处理。
', '<p>数据冗余恢复，与日志恢复技术。正像扫描日志文件，找出在故障发生前已经提交的事务，将其事务标识记入REDO队列，同时找出故障发生时尚未完成的事务，将其事务标识记入UNDO队列，对UNDO队列中的各个事务进行撤销处理；对REDO队列中的各个事务进行重做处理。</p>
', '2022-03-06 10:54:51', '2022-03-06 10:54:51', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (186, 20, 1, 6, 2, 14, '现有关系数据库如下：
```
学生（学号，姓名，性别，专业）
课程（课程号，课程名，学分）
学习（学号，课程号，分数）
```
分别用关系代数表达式和SQL语句实现下列1—5小题：
（1）检索所有选修了课程号为“C112”的课程的学生的学号和分数<br><br><br>
（2）检索"英语"专业学生所学课程的信息，包括学号、姓名、课程名和分数<br><br><br>
（3）检索“数据库原理”课程成绩高于90分的所有学生的学号、姓名、专业和分数<br><br><br>
（4）检索没学课程号为“C135”课程的学生信息，包括学号，姓名和专业<br><br><br>
（5）检索至少学过课程号为“C135”和“C219”的课程的学生的信息，包括学号、姓名和专业<br><br><br>
', '现有关系数据库如下：
学生（学号，姓名，性别，专业）
课程（课程号，课程名，学分）
学习（学号，课程号，分数）
分别用关系代数表达式和SQL语句实现下列1—5小题：（1）检索所有选修了课程号为“C112”的课程的学生的学号和分数（2）检索”英语”专业学生所学课程的信息，包括学号、姓名、课程名和分数（3）检索“数据库原理”课程成绩高于90分的所有学生的学号、姓名、专业和分数（4）检索没学课程号为“C135”课程的学生信息，包括学号，姓名和专业（5）检索至少学过课程号为“C135”和“C219”的课程的学生的信息，包括学号、姓名和专业
', '<p>现有关系数据库如下：</p>
<pre><code>学生（学号，姓名，性别，专业）
课程（课程号，课程名，学分）
学习（学号，课程号，分数）
</code></pre><p>分别用关系代数表达式和SQL语句实现下列1—5小题：<br>（1）检索所有选修了课程号为“C112”的课程的学生的学号和分数<br><br><br><br>（2）检索”英语”专业学生所学课程的信息，包括学号、姓名、课程名和分数<br><br><br><br>（3）检索“数据库原理”课程成绩高于90分的所有学生的学号、姓名、专业和分数<br><br><br><br>（4）检索没学课程号为“C135”课程的学生信息，包括学号，姓名和专业<br><br><br><br>（5）检索至少学过课程号为“C135”和“C219”的课程的学生的信息，包括学号、姓名和专业<br><br><br>
', '（1）
```sql
select 学号,成绩 from 学习 where 课程号 =''C112''
```
![](/files/1646535440778.png)
（2）
```sql
select 学生.学号，课程名，分数 from 学生
INNER JOIN 学习 ON 学生.学号 = 学习.学号
INNER JOIN 课程 ON 学习.课程号 = 课程.课程号
where 专业 = ''英语''
```
![](/files/1646535498105.png)
（3）
```sql
SELECT 学生.学号，姓名，专业，分数 from 学生，学习，课程
where 学生.学号 = 学习.学号 AND 学习.课程号 = 课程.课程号
AND 分数 >90 AND 课程名 = ''数据库原理''
```
![](/files/1646535576986.png)
（4）
```sql
SELECT 学号,姓名,专业
FROM 学生 WHERE 学号 NOT IN
(SELECT 学号 FROM 学习 WHERE 课程号=''C135'')
```
![](/files/1646535635162.png)
（5）
```sql
SELECT 学号,姓名,专业 FROM 学生
 WHERE 学号 IN
(SELECT X1.学号 FROM  学习 X1,学习 X2  WHERE X1.学号=X2.学号 AND X1.课程号=''C135'' AND X2.课程号=''C219''）
```
![](/files/1646535709821.png)', '（1）
select 学号,成绩 from 学习 where 课程号 =''C112''

（2）
select 学生.学号，课程名，分数 from 学生
INNER JOIN 学习 ON 学生.学号 = 学习.学号
INNER JOIN 课程 ON 学习.课程号 = 课程.课程号
where 专业 = ''英语''

（3）
SELECT 学生.学号，姓名，专业，分数 from 学生，学习，课程
where 学生.学号 = 学习.学号 AND 学习.课程号 = 课程.课程号
AND 分数 &gt;90 AND 课程名 = ''数据库原理''

（4）
SELECT 学号,姓名,专业
FROM 学生 WHERE 学号 NOT IN
(SELECT 学号 FROM 学习 WHERE 课程号=''C135'')

（5）
SELECT 学号,姓名,专业 FROM 学生
 WHERE 学号 IN
(SELECT X1.学号 FROM  学习 X1,学习 X2  WHERE X1.学号=X2.学号 AND X1.课程号=''C135'' AND X2.课程号=''C219''）


', '<p>（1）</p>
<pre><code class="lang-sql">select 学号,成绩 from 学习 where 课程号 =''C112''
</code></pre>
<p><img src="/files/1646535440778.png" alt=""><br>（2）
<pre><code class="lang-sql">select 学生.学号，课程名，分数 from 学生
INNER JOIN 学习 ON 学生.学号 = 学习.学号
INNER JOIN 课程 ON 学习.课程号 = 课程.课程号
where 专业 = ''英语''
</code></pre>
<p><img src="/files/1646535498105.png" alt=""><br>（3）
<pre><code class="lang-sql">SELECT 学生.学号，姓名，专业，分数 from 学生，学习，课程
where 学生.学号 = 学习.学号 AND 学习.课程号 = 课程.课程号
AND 分数 &gt;90 AND 课程名 = ''数据库原理''
</code></pre>
<p><img src="/files/1646535576986.png" alt=""><br>（4）
<pre><code class="lang-sql">SELECT 学号,姓名,专业
FROM 学生 WHERE 学号 NOT IN
(SELECT 学号 FROM 学习 WHERE 课程号=''C135'')
</code></pre>
<p><img src="/files/1646535635162.png" alt=""><br>（5）
<pre><code class="lang-sql">SELECT 学号,姓名,专业 FROM 学生
 WHERE 学号 IN
(SELECT X1.学号 FROM  学习 X1,学习 X2  WHERE X1.学号=X2.学号 AND X1.课程号=''C135'' AND X2.课程号=''C219''）
</code></pre>
<p><img src="/files/1646535709821.png" alt="">
', '2022-03-06 11:02:27', '2022-03-06 11:02:27', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (187, 20, 1, 6, 2, 14, '现有如下关系模式：
借阅（图书编号，书名，作者名，出版社，读者编号，读者姓名，借阅日期，归还日期）
基本函数依赖集：F={图书编号→（书名，作者名，出版社），读者编号→读者姓名，（图书编号，读者编号，借阅日期）→归还日期}
（1）读者编号是候选码吗？<br><br><br>
（2）写出该关系模式的主码。<br><br><br>
（3）该关系模式中是否存在非主属性对码的部分函数依赖？如果存在，请写出一个。<br><br><br>
（4）该关系模式满足第几范式？并说明理由。<br><br><br>', '现有如下关系模式：借阅（图书编号，书名，作者名，出版社，读者编号，读者姓名，借阅日期，归还日期）基本函数依赖集：F={图书编号→（书名，作者名，出版社），读者编号→读者姓名，（图书编号，读者编号，借阅日期）→归还日期}（1）读者编号是候选码吗？（2）写出该关系模式的主码。（3）该关系模式中是否存在非主属性对码的部分函数依赖？如果存在，请写出一个。（4）该关系模式满足第几范式？并说明理由。
', '<p>现有如下关系模式：<br>借阅（图书编号，书名，作者名，出版社，读者编号，读者姓名，借阅日期，归还日期）<br>基本函数依赖集：F={图书编号→（书名，作者名，出版社），读者编号→读者姓名，（图书编号，读者编号，借阅日期）→归还日期}<br>（1）读者编号是候选码吗？<br><br><br><br>（2）写出该关系模式的主码。<br><br><br><br>（3）该关系模式中是否存在非主属性对码的部分函数依赖？如果存在，请写出一个。<br><br><br><br>（4）该关系模式满足第几范式？并说明理由。<br><br><br>
', '（1）不是
（2）（图书编号，读者编号，借阅日期）
（3）存在。
（图书编号，读者编号，借阅日期）→书名、
（图书编号，读者编号，借阅日期）→作者名、
（图书编号，读者编号，借阅日期）→出版社、
（图书编号，读者编号，借阅日期）→读者姓名
（4）1NF，因为存在非主属性对主码的部分函数依赖。', '（1）不是（2）（图书编号，读者编号，借阅日期）（3）存在。（图书编号，读者编号，借阅日期）→书名、（图书编号，读者编号，借阅日期）→作者名、（图书编号，读者编号，借阅日期）→出版社、（图书编号，读者编号，借阅日期）→读者姓名（4）1NF，因为存在非主属性对主码的部分函数依赖。
', '<p>（1）不是<br>（2）（图书编号，读者编号，借阅日期）<br>（3）存在。<br>（图书编号，读者编号，借阅日期）→书名、<br>（图书编号，读者编号，借阅日期）→作者名、<br>（图书编号，读者编号，借阅日期）→出版社、<br>（图书编号，读者编号，借阅日期）→读者姓名<br>（4）1NF，因为存在非主属性对主码的部分函数依赖。
', '2022-03-06 11:05:25', '2022-03-06 11:05:25', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (188, 20, 1, 6, 1, 14, '某工厂生产多种产品，每种产品由不同的零件组装而成，有的零件可用在不同的产品上。产品有产品号和产品名两个属性，零件有零件号和零件名两个属性。根据语义设计E-R模型，并将E-R模型转换成关系模式。<br><br><br>', '某工厂生产多种产品，每种产品由不同的零件组装而成，有的零件可用在不同的产品上。产品有产品号和产品名两个属性，零件有零件号和零件名两个属性。根据语义设计E-R模型，并将E-R模型转换成关系模式。
', '<p>某工厂生产多种产品，每种产品由不同的零件组装而成，有的零件可用在不同的产品上。产品有产品号和产品名两个属性，零件有零件号和零件名两个属性。根据语义设计E-R模型，并将E-R模型转换成关系模式。<br><br><br>
', '![](/files/1646535963685.png)

关系模式：
产品（产品号，产品名）
零件（零件号，零件名）
组装（产品号，零件号）', '
关系模式：产品（产品号，产品名）零件（零件号，零件名）组装（产品号，零件号）
', '<p><img src="/files/1646535963685.png" alt="">
<p>关系模式：<br>产品（产品号，产品名）<br>零件（零件号，零件名）<br>组装（产品号，零件号）
', '2022-03-06 11:06:25', '2022-03-06 11:06:25', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (189, 1, 1, 1, 1, 14, ' 在数据库的三级模式结构中，描述数据库中数据的全局逻辑结构和特征的是（ ）
 A、外模式
 B、内模式
 C、存储模式
 D、模式
', ' 在数据库的三级模式结构中，描述数据库中数据的全局逻辑结构和特征的是（ ） A、外模式 B、内模式 C、存储模式 D、模式
', '<p> 在数据库的三级模式结构中，描述数据库中数据的全局逻辑结构和特征的是（ ）<br> A、外模式<br> B、内模式<br> C、存储模式<br> D、模式
', 'D', 'D
', '<p>D</p>
', '2022-03-06 14:41:34', '2022-03-06 14:41:34', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (190, 1, 1, 1, 1, 14, '公司中有多个部门和多名职员，每个职员只能属于一个部门，一个部门可以有多名职员，从职员到部门的联系类型是（ ）
A、多对多
B、一对一
C、多对一
D、一对多 ', '公司中有多个部门和多名职员，每个职员只能属于一个部门，一个部门可以有多名职员，从职员到部门的联系类型是（ ）A、多对多B、一对一C、多对一D、一对多
', '<p>公司中有多个部门和多名职员，每个职员只能属于一个部门，一个部门可以有多名职员，从职员到部门的联系类型是（ ）<br>A、多对多<br>B、一对一<br>C、多对一<br>D、一对多
', 'C', 'C
', '<p>C</p>
', '2022-03-06 14:42:03', '2022-03-06 14:42:03', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (191, 1, 1, 1, 2, 14, 'DB、DBMS和DBS三者之间的关系是（ ）
A、DB包括DBMS和DBS
B、DBS包括DB和DBMS
C、DBMS包括DB和DBS
D、不能相互包括', 'DB、DBMS和DBS三者之间的关系是（ ）A、DB包括DBMS和DBSB、DBS包括DB和DBMSC、DBMS包括DB和DBSD、不能相互包括
', '<p>DB、DBMS和DBS三者之间的关系是（ ）<br>A、DB包括DBMS和DBS<br>B、DBS包括DB和DBMS<br>C、DBMS包括DB和DBS<br>D、不能相互包括
', 'B', 'B
', '<p>B</p>
', '2022-03-06 14:43:07', '2022-03-06 14:43:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (192, 1, 1, 1, 2, 14, '关系数据库中的码是指（ ）
A、能唯一决定关系的字段
B、不可改动的专用保留字
C、关键的很重要的字段
D、能唯一标识元组的属性或属性集合
', '关系数据库中的码是指（ ）A、能唯一决定关系的字段B、不可改动的专用保留字C、关键的很重要的字段D、能唯一标识元组的属性或属性集合
', '<p>关系数据库中的码是指（ ）<br>A、能唯一决定关系的字段<br>B、不可改动的专用保留字<br>C、关键的很重要的字段<br>D、能唯一标识元组的属性或属性集合
', 'D', 'D
', '<p>D</p>
', '2022-03-06 14:43:54', '2022-03-06 14:43:54', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (193, 2, 1, 3, 2, 14, '数据模型通常由<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>，<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>，<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>三部分组成。
', '数据模型通常由&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;，&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;，&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三部分组成。
', '<p>数据模型通常由<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>，<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>，<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>三部分组成。</p>
', '数据结构，关系操作，完整性约束 ', '数据结构，关系操作，完整性约束
', '<p>数据结构，关系操作，完整性约束 </p>
', '2022-03-06 14:45:29', '2022-03-06 14:45:29', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (194, 2, 1, 3, 2, 14, 'SQL的授权语句中的关键字PUBLIC表示<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。', 'SQL的授权语句中的关键字PUBLIC表示&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;。
', '<p>SQL的授权语句中的关键字PUBLIC表示<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。</p>
', '全体用户', '全体用户
', '<p>全体用户</p>
', '2022-03-06 14:46:13', '2022-03-06 14:46:13', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (195, 2, 1, 3, 2, 14, '数据独立性又可为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>和<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>两方面。', '数据独立性又可为&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;和&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;两方面。
', '<p>数据独立性又可为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>和<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>两方面。</p>
', '逻辑独立性，物理独立性', '逻辑独立性，物理独立性
', '<p>逻辑独立性，物理独立性</p>
', '2022-03-06 14:46:56', '2022-03-06 14:46:56', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (196, 2, 1, 3, 2, 14, '数据库是长期存储在计算机内，有<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>的、可<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>的数据集合。', '数据库是长期存储在计算机内，有&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的、可&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的数据集合。
', '<p>数据库是长期存储在计算机内，有<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>的、可<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>的数据集合。</p>
', '组织，共享', '组织，共享
', '<p>组织，共享</p>
', '2022-03-06 14:47:53', '2022-03-06 14:47:53', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (197, 2, 1, 3, 1, 14, '关系代数中专门的关系运算包括<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>等。', '关系代数中专门的关系运算包括&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;、&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;、&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;等。
', '<p>关系代数中专门的关系运算包括<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>等。</p>
', '选择、投影、连接', '选择、投影、连接
', '<p>选择、投影、连接</p>
', '2022-03-06 14:48:32', '2022-03-06 14:48:32', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (198, 5, 1, 5, 1, 14, 'DBA的职责是什么？<br><br><br>', 'DBA的职责是什么？
', '<p>DBA的职责是什么？<br><br><br>
', '1、参与数据库的设计、规划和建立
2、负责数据库管理系统的安装和升级
3、规划和实施数据库备份和恢复
4、控制和监控用户对数据库存取访问，规划和实施数据库的安全性和稳定性
5、支持开发和应用数据库的技术
', '1、参与数据库的设计、规划和建立2、负责数据库管理系统的安装和升级3、规划和实施数据库备份和恢复4、控制和监控用户对数据库存取访问，规划和实施数据库的安全性和稳定性5、支持开发和应用数据库的技术
', '<p>1、参与数据库的设计、规划和建立<br>2、负责数据库管理系统的安装和升级<br>3、规划和实施数据库备份和恢复<br>4、控制和监控用户对数据库存取访问，规划和实施数据库的安全性和稳定性<br>5、支持开发和应用数据库的技术
', '2022-03-06 14:49:30', '2022-03-06 14:49:30', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (199, 5, 1, 5, 2, 14, '试述视图的优点。什么样的视图一定是可更新的？<br><br><br>', '试述视图的优点。什么样的视图一定是可更新的？
', '<p>试述视图的优点。什么样的视图一定是可更新的？<br><br><br>
', '优点：
1、视图能够简化用户的操作
2、视图使用户能以多种角度看待同一数据
3、视图对重构数据库提供了一定程度的逻辑独立性
4、视图能够对机密数据提供安全保护

基本表的行列子集视图一般是可更新的。若视图的属性来自集函数、表达式，则该视图肯定是不可以不可以更新的。
', '优点：1、视图能够简化用户的操作2、视图使用户能以多种角度看待同一数据3、视图对重构数据库提供了一定程度的逻辑独立性4、视图能够对机密数据提供安全保护
基本表的行列子集视图一般是可更新的。若视图的属性来自集函数、表达式，则该视图肯定是不可以不可以更新的。
', '<p>优点：<br>1、视图能够简化用户的操作<br>2、视图使用户能以多种角度看待同一数据<br>3、视图对重构数据库提供了一定程度的逻辑独立性<br>4、视图能够对机密数据提供安全保护
<p>基本表的行列子集视图一般是可更新的。若视图的属性来自集函数、表达式，则该视图肯定是不可以不可以更新的。</p>
', '2022-03-06 14:50:33', '2022-03-06 14:50:33', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (200, 2, 1, 3, 3, 14, '区分不同实体的依据是（ ）。', '区分不同实体的依据是（ ）。
', '<p>区分不同实体的依据是（ ）。</p>
', '属性', '属性
', '<p>属性</p>
', '2022-03-06 14:51:24', '2022-03-06 14:51:24', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (201, 2, 1, 3, 3, 14, '现实世界中客观存在并能相互区别的事物称为(  )。', '现实世界中客观存在并能相互区别的事物称为(  )。
', '<p>现实世界中客观存在并能相互区别的事物称为(  )。</p>
', '实体', '实体
', '<p>实体</p>
', '2022-03-06 14:51:43', '2022-03-06 14:51:43', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (202, 2, 1, 3, 3, 14, '现实世界中事物的特性在信息世界中称为(  )。', '现实世界中事物的特性在信息世界中称为(  )。
', '<p>现实世界中事物的特性在信息世界中称为(  )。</p>
', '属性', '属性
', '<p>属性</p>
', '2022-03-06 14:52:00', '2022-03-06 14:52:00', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (203, 2, 1, 3, 3, 14, '概念模型是现实世界的第一层抽象，这一类最著名的模型是（  ）。', '概念模型是现实世界的第一层抽象，这一类最著名的模型是（  ）。
', '<p>概念模型是现实世界的第一层抽象，这一类最著名的模型是（  ）。</p>
', '实体-关系模型', '实体-关系模型
', '<p>实体-关系模型</p>
', '2022-03-06 14:52:29', '2022-03-06 14:52:29', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (204, 2, 1, 3, 3, 14, '采用二维表格结构表达实体类型及实体间联系的数据模型是( )。', '采用二维表格结构表达实体类型及实体间联系的数据模型是( )。
', '<p>采用二维表格结构表达实体类型及实体间联系的数据模型是( )。</p>
', '关系模型', '关系模型
', '<p>关系模型</p>
', '2022-03-06 14:52:48', '2022-03-06 14:52:48', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (205, 2, 1, 3, 3, 14, '不同的数据库管理系统支持不同的数据模型。在常用的数据模型中，不包括（ ）。', '不同的数据库管理系统支持不同的数据模型。在常用的数据模型中，不包括（ ）。
', '<p>不同的数据库管理系统支持不同的数据模型。在常用的数据模型中，不包括（ ）。</p>
', '链状模型', '链状模型
', '<p>链状模型</p>
', '2022-03-06 14:53:19', '2022-03-06 14:53:19', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (206, 2, 1, 3, 1, 14, '在数据库技术中，独立于计算机系统的模型是（  ）。', '在数据库技术中，独立于计算机系统的模型是（  ）。
', '<p>在数据库技术中，独立于计算机系统的模型是（  ）。</p>
', 'E-R模型', 'E-R模型
', '<p>E-R模型</p>
', '2022-03-06 14:53:42', '2022-03-06 14:53:42', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (207, 2, 1, 3, 3, 14, 'E-R图是数据库设计的工具之一，它适用于建立数据库的（  ）。', 'E-R图是数据库设计的工具之一，它适用于建立数据库的（  ）。
', '<p>E-R图是数据库设计的工具之一，它适用于建立数据库的（  ）。</p>
', '概念模型', '概念模型
', '<p>概念模型</p>
', '2022-03-06 14:54:21', '2022-03-06 14:54:21', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (208, 2, 1, 3, 3, 14, '显示当前所有数据库的命令是（    ）。', '显示当前所有数据库的命令是（    ）。
', '<p>显示当前所有数据库的命令是（    ）。</p>
', 'SHOW DATABASES', 'SHOW DATABASES
', '<p>SHOW DATABASES</p>
', '2022-03-06 14:54:44', '2022-03-06 14:54:44', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (209, 2, 1, 3, 3, 14, '在MySQL5.5以上系统中，默认的存储引擎是（    ）。', '在MySQL5.5以上系统中，默认的存储引擎是（    ）。
', '<p>在MySQL5.5以上系统中，默认的存储引擎是（    ）。</p>
', 'InnoDB', 'InnoDB
', '<p>InnoDB</p>
', '2022-03-06 14:55:02', '2022-03-06 14:55:02', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (210, 1, 1, 4, 1, 14, '关系必须有唯一的候选码。（  ）', '关系必须有唯一的候选码。（  ）
', '<p>关系必须有唯一的候选码。（  ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 14:56:06', '2022-03-06 14:56:06', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (211, 1, 1, 4, 1, 14, '关系中不同的属性可来自同一个域。（  ）', '关系中不同的属性可来自同一个域。（  ）
', '<p>关系中不同的属性可来自同一个域。（  ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 14:56:34', '2022-03-06 14:56:34', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (212, 1, 1, 4, 1, 14, 'DBS是采用了数据库技术的计算机系统。DBS是一个集合体，包含计算机硬件、DB、DBMS、数据库就凭系统等软件和用户。（  ）', 'DBS是采用了数据库技术的计算机系统。DBS是一个集合体，包含计算机硬件、DB、DBMS、数据库就凭系统等软件和用户。（  ）
', '<p>DBS是采用了数据库技术的计算机系统。DBS是一个集合体，包含计算机硬件、DB、DBMS、数据库就凭系统等软件和用户。（  ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 14:56:55', '2022-03-06 14:56:55', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (213, 1, 1, 4, 1, 14, 'ORACLE是大型数据库管理系统。（  ）', 'ORACLE是大型数据库管理系统。（  ）
', '<p>ORACLE是大型数据库管理系统。（  ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 14:57:13', '2022-03-06 14:57:13', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (214, 1, 1, 4, 1, 14, '数据库管理系统DBMS是操作系统的一部分。（  ）', '数据库管理系统DBMS是操作系统的一部分。（  ）
', '<p>数据库管理系统DBMS是操作系统的一部分。（  ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 14:57:32', '2022-03-06 14:57:32', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (215, 1, 1, 4, 1, 14, '数据定义语言的缩写为DML。（  ）', '数据定义语言的缩写为DML。（  ）
', '<p>数据定义语言的缩写为DML。（  ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 14:57:50', '2022-03-06 14:57:50', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (216, 1, 1, 4, 1, 14, '创建唯一性索引的列可以有一些重复的值。（  ）', '创建唯一性索引的列可以有一些重复的值。（  ）
', '<p>创建唯一性索引的列可以有一些重复的值。（  ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 14:58:10', '2022-03-06 14:58:10', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (217, 1, 1, 4, 1, 14, '在数据库中建立的索引越多越好。（  ）', '在数据库中建立的索引越多越好。（  ）
', '<p>在数据库中建立的索引越多越好。（  ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 14:58:28', '2022-03-06 14:58:28', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (218, 1, 1, 4, 1, 14, 'SQL语言的视图定义和视图操作功能在一定程度上支持了数据的逻辑独立性。（  ）', 'SQL语言的视图定义和视图操作功能在一定程度上支持了数据的逻辑独立性。（  ）
', '<p>SQL语言的视图定义和视图操作功能在一定程度上支持了数据的逻辑独立性。（  ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 14:58:44', '2022-03-06 14:58:44', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (219, 1, 1, 4, 1, 14, '视图本身没有保存数据，而是保存一条查询语句。（  ） ', '视图本身没有保存数据，而是保存一条查询语句。（  ）
', '<p>视图本身没有保存数据，而是保存一条查询语句。（  ） </p>
', '√', '√
', '<p>√</p>
', '2022-03-06 14:59:07', '2022-03-06 14:59:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (220, 1, 1, 4, 2, 14, '视图和表是完全一样的。（  ）', '视图和表是完全一样的。（  ）
', '<p>视图和表是完全一样的。（  ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 14:59:25', '2022-03-06 14:59:25', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (221, 1, 1, 4, 2, 14, '因为通过视图可以插入、修改或删除数据，因此视图也是一个实在表。（  ）', '因为通过视图可以插入、修改或删除数据，因此视图也是一个实在表。（  ）
', '<p>因为通过视图可以插入、修改或删除数据，因此视图也是一个实在表。（  ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 14:59:43', '2022-03-06 14:59:43', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (222, 2, 1, 3, 2, 14, '现实世界中，事物的个体在机器世界中称为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。', '现实世界中，事物的个体在机器世界中称为&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;。
', '<p>现实世界中，事物的个体在机器世界中称为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。</p>
', '记录', '记录
', '<p>记录</p>
', '2022-03-06 15:00:31', '2022-03-06 15:00:31', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (223, 2, 1, 3, 2, 14, '现实世界中，事物的个体在信息世界中称为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。', '现实世界中，事物的个体在信息世界中称为&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;。
', '<p>现实世界中，事物的个体在信息世界中称为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。</p>
', '实体', '实体
', '<p>实体</p>
', '2022-03-06 15:01:03', '2022-03-06 15:01:03', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (224, 2, 1, 3, 2, 14, '表示实体类型和实体间联系的模型，称为概念模型，最著名、最为常用的概念模型是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。', '表示实体类型和实体间联系的模型，称为概念模型，最著名、最为常用的概念模型是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;。
', '<p>表示实体类型和实体间联系的模型，称为概念模型，最著名、最为常用的概念模型是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。</p>
', 'E-R模型', 'E-R模型
', '<p>E-R模型</p>
', '2022-03-06 15:01:48', '2022-03-06 15:01:48', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (225, 2, 1, 3, 2, 14, '数据模型通常由3部分组成，它们是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>、数据操作和完整性约束。', '数据模型通常由3部分组成，它们是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;、数据操作和完整性约束。
', '<p>数据模型通常由3部分组成，它们是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>、数据操作和完整性约束。</p>
', '数据结构', '数据结构
', '<p>数据结构</p>
', '2022-03-06 15:02:15', '2022-03-06 15:02:15', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (226, 2, 1, 3, 2, 14, '唯一标识实体的属性集称为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。', '唯一标识实体的属性集称为&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;。
', '<p>唯一标识实体的属性集称为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。</p>
', '码', '码
', '<p>码</p>
', '2022-03-06 15:02:47', '2022-03-06 15:02:47', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (227, 2, 1, 3, 2, 14, 'SELECT语句中，WHERE子句的条件表达式中，字符串匹配的操作符是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。', 'SELECT语句中，WHERE子句的条件表达式中，字符串匹配的操作符是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;。
', '<p>SELECT语句中，WHERE子句的条件表达式中，字符串匹配的操作符是<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>。</p>
', 'LIKE', 'LIKE
', '<p>LIKE</p>
', '2022-03-06 15:03:34', '2022-03-06 15:03:34', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (228, 20, 1, 6, 1, 14, '对于教学数据库的三个基本表：
S（S#，SNAME，AGE，SEX）
SC（S#，C#，GRADE）
C（C#，CNAME，TEACHER）
试用SQL的查询语句表达下列查询：
（1）检索LIU老师所讲授课程的课程名。<br>
（2）检索年龄大于19岁的男学生的学号和姓名。<br>
（3）检索学号为S1的学生的姓名及所学课程的课程名。<br>
（4）检索SUN同学不学的课程的课程号。<br>
（5）统计每门课程的学生选修人数（超过10人的课程才统计）。要求显示课程号和人数，查询结果按人数降序排列，若人数相同，按课程号升序排列。<br>
（6）求LIU老师所授课程的每门课程的平均成绩。<br>
（7）求年龄大于女同学平均年龄的男学生姓名和年龄。<br>
（8）检索姓名以L打头的所有学生的姓名和性别。<br>
（9）把低于所有课程总平均成绩的女同学成绩提高5%。 <br>
（10）在SC中删除尚无成绩的选课元组。<br>', '对于教学数据库的三个基本表：S（S#，SNAME，AGE，SEX）SC（S#，C#，GRADE）C（C#，CNAME，TEACHER）试用SQL的查询语句表达下列查询：（1）检索LIU老师所讲授课程的课程名。（2）检索年龄大于19岁的男学生的学号和姓名。（3）检索学号为S1的学生的姓名及所学课程的课程名。（4）检索SUN同学不学的课程的课程号。（5）统计每门课程的学生选修人数（超过10人的课程才统计）。要求显示课程号和人数，查询结果按人数降序排列，若人数相同，按课程号升序排列。（6）求LIU老师所授课程的每门课程的平均成绩。（7）求年龄大于女同学平均年龄的男学生姓名和年龄。（8）检索姓名以L打头的所有学生的姓名和性别。（9）把低于所有课程总平均成绩的女同学成绩提高5%。 （10）在SC中删除尚无成绩的选课元组。
', '<p>对于教学数据库的三个基本表：<br>S（S#，SNAME，AGE，SEX）<br>SC（S#，C#，GRADE）<br>C（C#，CNAME，TEACHER）<br>试用SQL的查询语句表达下列查询：<br>（1）检索LIU老师所讲授课程的课程名。<br><br>（2）检索年龄大于19岁的男学生的学号和姓名。<br><br>（3）检索学号为S1的学生的姓名及所学课程的课程名。<br><br>（4）检索SUN同学不学的课程的课程号。<br><br>（5）统计每门课程的学生选修人数（超过10人的课程才统计）。要求显示课程号和人数，查询结果按人数降序排列，若人数相同，按课程号升序排列。<br><br>（6）求LIU老师所授课程的每门课程的平均成绩。<br><br>（7）求年龄大于女同学平均年龄的男学生姓名和年龄。<br><br>（8）检索姓名以L打头的所有学生的姓名和性别。<br><br>（9）把低于所有课程总平均成绩的女同学成绩提高5%。 <br><br>（10）在SC中删除尚无成绩的选课元组。<br>
', '（1）
```sql
select cname from c where teacher=''liu''
```
（2）
```sql
select s#,sname from student where age>19 and sex=''男''
```
（3）
```sql
select sname,cname from sc,c,s where s.s#=sc.s# and sc.c#=c.c# and s#=''s1''
```
（4）
```sql
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''SUN'')
```
（5）
```sql
select c#,count(*) from sc group by c# having count(*)>=10 order by 2 desc,1 asc
```
（6）
```sql
select c#,avg(grade) from sc,c where c.c#=sc.c# and teacher=''LIU'' group by c.c#
```
（7）
```sql
select sname,age from s where age>(select avg(age) from s where sex=''女'')
```
（8）
```sql
select sname,sex from s where sname like ''L%''
```
（9）
```sql
update sc set grade=grade+grade*5% where s# in (select s# from sc,s  where sc.s#=s.s# and grade<(select avg(grade) from sc))
```
（10）
```sql
delete from sc where grade is null
```', '（1）
select cname from c where teacher=''liu''

（2）
select s#,sname from student where age&gt;19 and sex=''男''

（3）
select sname,cname from sc,c,s where s.s#=sc.s# and sc.c#=c.c# and s#=''s1''

（4）
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''SUN'')

（5）
select c#,count(*) from sc group by c# having count(*)&gt;=10 order by 2 desc,1 asc

（6）
select c#,avg(grade) from sc,c where c.c#=sc.c# and teacher=''LIU'' group by c.c#

（7）
select sname,age from s where age&gt;(select avg(age) from s where sex=''女'')

（8）
select sname,sex from s where sname like ''L%''

（9）
update sc set grade=grade+grade*5% where s# in (select s# from sc,s  where sc.s#=s.s# and grade&lt;(select avg(grade) from sc))

（10）
delete from sc where grade is null

', '<p>（1）</p>
<pre><code class="lang-sql">select cname from c where teacher=''liu''
</code></pre>
<p>（2）</p>
<pre><code class="lang-sql">select s#,sname from student where age&gt;19 and sex=''男''
</code></pre>
<p>（3）</p>
<pre><code class="lang-sql">select sname,cname from sc,c,s where s.s#=sc.s# and sc.c#=c.c# and s#=''s1''
</code></pre>
<p>（4）</p>
<pre><code class="lang-sql">select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''SUN'')
</code></pre>
<p>（5）</p>
<pre><code class="lang-sql">select c#,count(*) from sc group by c# having count(*)&gt;=10 order by 2 desc,1 asc
</code></pre>
<p>（6）</p>
<pre><code class="lang-sql">select c#,avg(grade) from sc,c where c.c#=sc.c# and teacher=''LIU'' group by c.c#
</code></pre>
<p>（7）</p>
<pre><code class="lang-sql">select sname,age from s where age&gt;(select avg(age) from s where sex=''女'')
</code></pre>
<p>（8）</p>
<pre><code class="lang-sql">select sname,sex from s where sname like ''L%''
</code></pre>
<p>（9）</p>
<pre><code class="lang-sql">update sc set grade=grade+grade*5% where s# in (select s# from sc,s  where sc.s#=s.s# and grade&lt;(select avg(grade) from sc))
</code></pre>
<p>（10）</p>
<pre><code class="lang-sql">delete from sc where grade is null
</code></pre>
', '2022-03-06 15:09:28', '2022-03-06 15:09:28', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (229, 20, 1, 6, 2, 14, '对于教学数据库的三个基本表：
S（S#，SNAME，AGE，SEX）
SC（S#，C#，GRADE）
C（C#，CNAME，TEACHER）
试用SQL的查询语句表达下列查询：
（1）检索LIU老师所讲授课程的课程号。<br>
（2）检索年龄小于20岁的女学生的学号和姓名。<br>
（3）检索学号为S1的学生所学课程的课程名与任课教师名。<br>
（4）检索LI同学不学的课程的课程号。<br>
（5）检索至少选修四门课程的学生学号。<br>
（6）求选修C2课程的男学生的平均成绩。<br>
（7）检索学号比WANG同学小，而年龄比他大的学生姓名。<br>
（8）检索姓名以M打头的所有学生的姓名和年龄。<br>
（9）在表SC中检索成绩为空值的学生学号和课程号。<br>
（10）把ENGLISH课不及格的成绩全改为60分。<br>', '对于教学数据库的三个基本表：S（S#，SNAME，AGE，SEX）SC（S#，C#，GRADE）C（C#，CNAME，TEACHER）试用SQL的查询语句表达下列查询：（1）检索LIU老师所讲授课程的课程号。（2）检索年龄小于20岁的女学生的学号和姓名。（3）检索学号为S1的学生所学课程的课程名与任课教师名。（4）检索LI同学不学的课程的课程号。（5）检索至少选修四门课程的学生学号。（6）求选修C2课程的男学生的平均成绩。（7）检索学号比WANG同学小，而年龄比他大的学生姓名。（8）检索姓名以M打头的所有学生的姓名和年龄。（9）在表SC中检索成绩为空值的学生学号和课程号。（10）把ENGLISH课不及格的成绩全改为60分。
', '<p>对于教学数据库的三个基本表：<br>S（S#，SNAME，AGE，SEX）<br>SC（S#，C#，GRADE）<br>C（C#，CNAME，TEACHER）<br>试用SQL的查询语句表达下列查询：<br>（1）检索LIU老师所讲授课程的课程号。<br><br>（2）检索年龄小于20岁的女学生的学号和姓名。<br><br>（3）检索学号为S1的学生所学课程的课程名与任课教师名。<br><br>（4）检索LI同学不学的课程的课程号。<br><br>（5）检索至少选修四门课程的学生学号。<br><br>（6）求选修C2课程的男学生的平均成绩。<br><br>（7）检索学号比WANG同学小，而年龄比他大的学生姓名。<br><br>（8）检索姓名以M打头的所有学生的姓名和年龄。<br><br>（9）在表SC中检索成绩为空值的学生学号和课程号。<br><br>（10）把ENGLISH课不及格的成绩全改为60分。<br>
', '（1）
```sql
select c# from c where teacher=''liu''
```
（2）
```sql
select s#,sname from student where age<20 and sex=''女''
```
（3）
```sql
select cname,teacher from sc,c where sc.c#=c.c# and s#=''s1''
```
（4）
```sql
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''LI'')
```
（5）
```sql
select s# from sc group by s# having count(*)>=4
```
（6）
```sql
select avg(grade) from sc,s where s.s#=sc.s# and sex=''男'' and c#=''c2''
```
（7）
```sql
select sname from s where s#<(select s# from s where sname=''WANG'') and age>(select age from s where sname=''WANG'')
```
（8）
```sql
select sname,age from s where sname like ''M%''
```
（9）
```sql
select s#,c# from sc where grade is null
```
（10）
```sql
update sc set grade=60 where s# in (select s# from c,sc where c.c#=sc.c# and cname=''ENGLISH'' and grade<60)
```', '（1）
select c# from c where teacher=''liu''

（2）
select s#,sname from student where age&lt;20 and sex=''女''

（3）
select cname,teacher from sc,c where sc.c#=c.c# and s#=''s1''

（4）
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''LI'')

（5）
select s# from sc group by s# having count(*)&gt;=4

（6）
select avg(grade) from sc,s where s.s#=sc.s# and sex=''男'' and c#=''c2''

（7）
select sname from s where s#&lt;(select s# from s where sname=''WANG'') and age&gt;(select age from s where sname=''WANG'')

（8）
select sname,age from s where sname like ''M%''

（9）
select s#,c# from sc where grade is null

（10）
update sc set grade=60 where s# in (select s# from c,sc where c.c#=sc.c# and cname=''ENGLISH'' and grade&lt;60)

', '<p>（1）</p>
<pre><code class="lang-sql">select c# from c where teacher=''liu''
</code></pre>
<p>（2）</p>
<pre><code class="lang-sql">select s#,sname from student where age&lt;20 and sex=''女''
</code></pre>
<p>（3）</p>
<pre><code class="lang-sql">select cname,teacher from sc,c where sc.c#=c.c# and s#=''s1''
</code></pre>
<p>（4）</p>
<pre><code class="lang-sql">select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''LI'')
</code></pre>
<p>（5）</p>
<pre><code class="lang-sql">select s# from sc group by s# having count(*)&gt;=4
</code></pre>
<p>（6）</p>
<pre><code class="lang-sql">select avg(grade) from sc,s where s.s#=sc.s# and sex=''男'' and c#=''c2''
</code></pre>
<p>（7）</p>
<pre><code class="lang-sql">select sname from s where s#&lt;(select s# from s where sname=''WANG'') and age&gt;(select age from s where sname=''WANG'')
</code></pre>
<p>（8）</p>
<pre><code class="lang-sql">select sname,age from s where sname like ''M%''
</code></pre>
<p>（9）</p>
<pre><code class="lang-sql">select s#,c# from sc where grade is null
</code></pre>
<p>（10）</p>
<pre><code class="lang-sql">update sc set grade=60 where s# in (select s# from c,sc where c.c#=sc.c# and cname=''ENGLISH'' and grade&lt;60)
</code></pre>
', '2022-03-06 15:15:37', '2022-03-06 15:15:37', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (230, 20, 1, 6, 3, 14, '对于教学数据库的三个基本表：
S（S#，SNAME，AGE，SEX）
SC（S#，C#，GRADE）
C（C#，CNAME，TEACHER）
试用SQL的查询语句表达下列查询：
（1）检索“程军”老师所授课程的课程号和课程名。<br>
（2）检索年龄大于21的男学生学号和姓名。<br>
（3）检索“李强”同学不学课程的课程号。<br>
（4）检索至少选修两门课程的学生学号。<br>
（5）检索所有姓刘的学生的平均年龄。<br>
（6）检索选修课程名为“C语言”的学生学号和姓名。<br>
（7）检索选修课程号为K5的学生学号和姓名。<br>
（8）在SC表中插入一条新记录（’S5’，’C1’，98）。<br>
（9）查询选修了课程但没有成绩的学生学号及课程号。<br>
（10）把低于总平均成绩的男生的成绩提高10分。<br>', '对于教学数据库的三个基本表：S（S#，SNAME，AGE，SEX）SC（S#，C#，GRADE）C（C#，CNAME，TEACHER）试用SQL的查询语句表达下列查询：（1）检索“程军”老师所授课程的课程号和课程名。（2）检索年龄大于21的男学生学号和姓名。（3）检索“李强”同学不学课程的课程号。（4）检索至少选修两门课程的学生学号。（5）检索所有姓刘的学生的平均年龄。（6）检索选修课程名为“C语言”的学生学号和姓名。（7）检索选修课程号为K5的学生学号和姓名。（8）在SC表中插入一条新记录（’S5’，’C1’，98）。（9）查询选修了课程但没有成绩的学生学号及课程号。（10）把低于总平均成绩的男生的成绩提高10分。
', '<p>对于教学数据库的三个基本表：<br>S（S#，SNAME，AGE，SEX）<br>SC（S#，C#，GRADE）<br>C（C#，CNAME，TEACHER）<br>试用SQL的查询语句表达下列查询：<br>（1）检索“程军”老师所授课程的课程号和课程名。<br><br>（2）检索年龄大于21的男学生学号和姓名。<br><br>（3）检索“李强”同学不学课程的课程号。<br><br>（4）检索至少选修两门课程的学生学号。<br><br>（5）检索所有姓刘的学生的平均年龄。<br><br>（6）检索选修课程名为“C语言”的学生学号和姓名。<br><br>（7）检索选修课程号为K5的学生学号和姓名。<br><br>（8）在SC表中插入一条新记录（’S5’，’C1’，98）。<br><br>（9）查询选修了课程但没有成绩的学生学号及课程号。<br><br>（10）把低于总平均成绩的男生的成绩提高10分。<br>
', '（1）
```sql
select c#,cname from c where teacher=''程军''
```
（2）
```sql
select s#,sname from student where age>21 and sex=''男''
```
（3）
```sql
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''李强'')
```
（4）
```sql
select s# from sc group by s# having count(*)>=2
```
（5）
```sql
select avg(age) from s where sname like ''刘%''
```
（6）
```sql
select s#,sname from s,sc,c where s.s#=sc.s# and c.c#=sc.c# and cname=''C语言''
```
（7）
```sql
select s.s#,sname from s,sc where s.s#=sc.s# and c#=''K5''
```
（8）
```sql
insert into sc values (''S5''，''C1''，98)
```
（9）
```sql
select s#,c# from sc where grade is null
```
（10）
```sql
update sc set grade=grade+10 where s# in (select s# from sc where grade<(select avg(grade) from sc)) and sex=''男''
```', '（1）
select c#,cname from c where teacher=''程军''

（2）
select s#,sname from student where age&gt;21 and sex=''男''

（3）
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''李强'')

（4）
select s# from sc group by s# having count(*)&gt;=2

（5）
select avg(age) from s where sname like ''刘%''

（6）
select s#,sname from s,sc,c where s.s#=sc.s# and c.c#=sc.c# and cname=''C语言''

（7）
select s.s#,sname from s,sc where s.s#=sc.s# and c#=''K5''

（8）
insert into sc values (''S5''，''C1''，98)

（9）
select s#,c# from sc where grade is null

（10）
update sc set grade=grade+10 where s# in (select s# from sc where grade&lt;(select avg(grade) from sc)) and sex=''男''

', '<p>（1）</p>
<pre><code class="lang-sql">select c#,cname from c where teacher=''程军''
</code></pre>
<p>（2）</p>
<pre><code class="lang-sql">select s#,sname from student where age&gt;21 and sex=''男''
</code></pre>
<p>（3）</p>
<pre><code class="lang-sql">select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''李强'')
</code></pre>
<p>（4）</p>
<pre><code class="lang-sql">select s# from sc group by s# having count(*)&gt;=2
</code></pre>
<p>（5）</p>
<pre><code class="lang-sql">select avg(age) from s where sname like ''刘%''
</code></pre>
<p>（6）</p>
<pre><code class="lang-sql">select s#,sname from s,sc,c where s.s#=sc.s# and c.c#=sc.c# and cname=''C语言''
</code></pre>
<p>（7）</p>
<pre><code class="lang-sql">select s.s#,sname from s,sc where s.s#=sc.s# and c#=''K5''
</code></pre>
<p>（8）</p>
<pre><code class="lang-sql">insert into sc values (''S5''，''C1''，98)
</code></pre>
<p>（9）</p>
<pre><code class="lang-sql">select s#,c# from sc where grade is null
</code></pre>
<p>（10）</p>
<pre><code class="lang-sql">update sc set grade=grade+10 where s# in (select s# from sc where grade&lt;(select avg(grade) from sc)) and sex=''男''
</code></pre>
', '2022-03-06 15:20:24', '2022-03-06 15:20:24', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (231, 20, 1, 6, 3, 14, '对于教学数据库的三个基本表：
S（S#，SNAME，AGE，SEX）
SC（S#，C#，GRADE）
C（C#，CNAME，TEACHER）
试用SQL的查询语句表达下列查询：
（1）检索“数据库原理及应用”课程的课程号。<br>
（2）检索年龄大于20岁的女学生的姓名和性别。<br>
（3）检索学号为S3的学生所学课程的课程号与成绩。<br>
（4）检索WANG同学不学的课程的课程号。<br>
（5）统计每门课程的学生选修人数（超过15人的课程才统计）。要求显示课程号和人数，查询结果按人数降序排列，若人数相同，按课程号升序排列。<br>
（6）求LIU老师所授课程的每门课程的成绩的最高分和最低分。<br>
（7）求年龄大于所有女同学年龄的男学生姓名和年龄。<br>
（8）检索姓名以Y打头的所有教师所教授课程的课程号和课程名。<br>
（9）在表SC中，当某个成绩低于全部课程的平均成绩时，提高5%。<br>
（10）在SC中删除尚无成绩的选课元组。<br>', '对于教学数据库的三个基本表：S（S#，SNAME，AGE，SEX）SC（S#，C#，GRADE）C（C#，CNAME，TEACHER）试用SQL的查询语句表达下列查询：（1）检索“数据库原理及应用”课程的课程号。（2）检索年龄大于20岁的女学生的姓名和性别。（3）检索学号为S3的学生所学课程的课程号与成绩。（4）检索WANG同学不学的课程的课程号。（5）统计每门课程的学生选修人数（超过15人的课程才统计）。要求显示课程号和人数，查询结果按人数降序排列，若人数相同，按课程号升序排列。（6）求LIU老师所授课程的每门课程的成绩的最高分和最低分。（7）求年龄大于所有女同学年龄的男学生姓名和年龄。（8）检索姓名以Y打头的所有教师所教授课程的课程号和课程名。（9）在表SC中，当某个成绩低于全部课程的平均成绩时，提高5%。（10）在SC中删除尚无成绩的选课元组。
', '<p>对于教学数据库的三个基本表：<br>S（S#，SNAME，AGE，SEX）<br>SC（S#，C#，GRADE）<br>C（C#，CNAME，TEACHER）<br>试用SQL的查询语句表达下列查询：<br>（1）检索“数据库原理及应用”课程的课程号。<br><br>（2）检索年龄大于20岁的女学生的姓名和性别。<br><br>（3）检索学号为S3的学生所学课程的课程号与成绩。<br><br>（4）检索WANG同学不学的课程的课程号。<br><br>（5）统计每门课程的学生选修人数（超过15人的课程才统计）。要求显示课程号和人数，查询结果按人数降序排列，若人数相同，按课程号升序排列。<br><br>（6）求LIU老师所授课程的每门课程的成绩的最高分和最低分。<br><br>（7）求年龄大于所有女同学年龄的男学生姓名和年龄。<br><br>（8）检索姓名以Y打头的所有教师所教授课程的课程号和课程名。<br><br>（9）在表SC中，当某个成绩低于全部课程的平均成绩时，提高5%。<br><br>（10）在SC中删除尚无成绩的选课元组。<br>
', '（1）
```sql
select c# from c where cname=''数据库原理及应用''
```
（2）
```sql
select sname,sex from student where age>20 and sex=''女''
```
（3）
```sql
select c#,grade from sc where s#=''s3''
```
（4）
```sql
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''WANG'')
```
（5）
```sql
select c#,count(*) from sc group by c# having count(*)>=15 order by 2 desc,1 asc
```
（6）
```sql
select c#,max(grade),min(grade) from sc,c where c.c#=sc.c# and teacher=''LIU'' group by c.c#
```
（7）
```sql
select sname,age from s where age>(select avg(age) from s where sex=''女'') and sex=''男''
```
（8）
```sql
select c#,cname from c where teacher like ''Y%''
```
（9）
```sql
update sc set grade=grade+grade*5% where grade<(select avg(grade) from sc)
```
（10）
```sql
delete from sc where grade is null
```', '（1）
select c# from c where cname=''数据库原理及应用''

（2）
select sname,sex from student where age&gt;20 and sex=''女''

（3）
select c#,grade from sc where s#=''s3''

（4）
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''WANG'')

（5）
select c#,count(*) from sc group by c# having count(*)&gt;=15 order by 2 desc,1 asc

（6）
select c#,max(grade),min(grade) from sc,c where c.c#=sc.c# and teacher=''LIU'' group by c.c#

（7）
select sname,age from s where age&gt;(select avg(age) from s where sex=''女'') and sex=''男''

（8）
select c#,cname from c where teacher like ''Y%''

（9）
update sc set grade=grade+grade*5% where grade&lt;(select avg(grade) from sc)

（10）
delete from sc where grade is null

', '<p>（1）</p>
<pre><code class="lang-sql">select c# from c where cname=''数据库原理及应用''
</code></pre>
<p>（2）</p>
<pre><code class="lang-sql">select sname,sex from student where age&gt;20 and sex=''女''
</code></pre>
<p>（3）</p>
<pre><code class="lang-sql">select c#,grade from sc where s#=''s3''
</code></pre>
<p>（4）</p>
<pre><code class="lang-sql">select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''WANG'')
</code></pre>
<p>（5）</p>
<pre><code class="lang-sql">select c#,count(*) from sc group by c# having count(*)&gt;=15 order by 2 desc,1 asc
</code></pre>
<p>（6）</p>
<pre><code class="lang-sql">select c#,max(grade),min(grade) from sc,c where c.c#=sc.c# and teacher=''LIU'' group by c.c#
</code></pre>
<p>（7）</p>
<pre><code class="lang-sql">select sname,age from s where age&gt;(select avg(age) from s where sex=''女'') and sex=''男''
</code></pre>
<p>（8）</p>
<pre><code class="lang-sql">select c#,cname from c where teacher like ''Y%''
</code></pre>
<p>（9）</p>
<pre><code class="lang-sql">update sc set grade=grade+grade*5% where grade&lt;(select avg(grade) from sc)
</code></pre>
<p>（10）</p>
<pre><code class="lang-sql">delete from sc where grade is null
</code></pre>
', '2022-03-06 15:24:57', '2022-03-06 15:24:57', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (232, 20, 1, 6, 1, 14, '现有如下关系：
学生S（S#，SNMAE，AGE，SEX）
学习SC（S#，C#，GRADE）
课程C（C#，CNAME，TEACHER）
用SQL语言完成下列功能：
（1）统计有学生选修的课程门数。<br>
（2）求选修C4课程的学生的平均年龄。<br>
（3）求李文老师所授课程的每门课程的学生平均成绩和最高成绩。<br>
（4）检索姓名以王打头的所有学生的姓名和年龄。<br>
（5）检索比“张三”年龄大的学生学号、姓名和年龄。<br>
（6）检索所有选修“C1”课程的学生学号、姓名及成绩，并将结果按成绩降序排列。<br>
（7）检索“李强”同学不学课程的课程号。<br>
（8）往基本表S中插入一个学生元组（’S9’，’WU’，18，’F’）。<br>
（9）把低于总平均成绩的女同学的成绩提高10分。<br>
（10）把王林同学的选课记录全部删除。<br>', '现有如下关系：学生S（S#，SNMAE，AGE，SEX）学习SC（S#，C#，GRADE）课程C（C#，CNAME，TEACHER）用SQL语言完成下列功能：（1）统计有学生选修的课程门数。（2）求选修C4课程的学生的平均年龄。（3）求李文老师所授课程的每门课程的学生平均成绩和最高成绩。（4）检索姓名以王打头的所有学生的姓名和年龄。（5）检索比“张三”年龄大的学生学号、姓名和年龄。（6）检索所有选修“C1”课程的学生学号、姓名及成绩，并将结果按成绩降序排列。（7）检索“李强”同学不学课程的课程号。（8）往基本表S中插入一个学生元组（’S9’，’WU’，18，’F’）。（9）把低于总平均成绩的女同学的成绩提高10分。（10）把王林同学的选课记录全部删除。
', '<p>现有如下关系：<br>学生S（S#，SNMAE，AGE，SEX）<br>学习SC（S#，C#，GRADE）<br>课程C（C#，CNAME，TEACHER）<br>用SQL语言完成下列功能：<br>（1）统计有学生选修的课程门数。<br><br>（2）求选修C4课程的学生的平均年龄。<br><br>（3）求李文老师所授课程的每门课程的学生平均成绩和最高成绩。<br><br>（4）检索姓名以王打头的所有学生的姓名和年龄。<br><br>（5）检索比“张三”年龄大的学生学号、姓名和年龄。<br><br>（6）检索所有选修“C1”课程的学生学号、姓名及成绩，并将结果按成绩降序排列。<br><br>（7）检索“李强”同学不学课程的课程号。<br><br>（8）往基本表S中插入一个学生元组（’S9’，’WU’，18，’F’）。<br><br>（9）把低于总平均成绩的女同学的成绩提高10分。<br><br>（10）把王林同学的选课记录全部删除。<br>
', '（1）
```sql
select count(distinct c#) from sc
```
（2）
```sql
select avg(age) from s where s# in (select s# from sc where c#=''c4'')
```
（3）
```sql
select c#,max(grade),min(grade) from sc,c where c.c#=sc.c# and teacher=''李文'' group by c.c#
```
（4）
```sql
select sname,age from s where sname like ''王%''
```
（5）
```sql
select s#,sname,age from s where age>(select age from s where sname=''张三'')
```
（6）
```sql
select s#,sname,grade from s# in (select s# from sc where c#=''c1'') order by grade desc
```
（7）
```sql
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''李强'')
```
（8）
```sql
insert into s values（''S9'',''WU'',18,''F''）
```
（9）
```sql
update sc set grade=grade+10 where s# in (select s# from sc where grade<(select avg(grade) from sc)) and sex=''女''
```
（10）
```sql
delete from sc where s#=(select s# from s where sname=''王林'')
```', '（1）
select count(distinct c#) from sc

（2）
select avg(age) from s where s# in (select s# from sc where c#=''c4'')

（3）
select c#,max(grade),min(grade) from sc,c where c.c#=sc.c# and teacher=''李文'' group by c.c#

（4）
select sname,age from s where sname like ''王%''

（5）
select s#,sname,age from s where age&gt;(select age from s where sname=''张三'')

（6）
select s#,sname,grade from s# in (select s# from sc where c#=''c1'') order by grade desc

（7）
select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''李强'')

（8）
insert into s values（''S9'',''WU'',18,''F''）

（9）
update sc set grade=grade+10 where s# in (select s# from sc where grade&lt;(select avg(grade) from sc)) and sex=''女''

（10）
delete from sc where s#=(select s# from s where sname=''王林'')

', '<p>（1）</p>
<pre><code class="lang-sql">select count(distinct c#) from sc
</code></pre>
<p>（2）</p>
<pre><code class="lang-sql">select avg(age) from s where s# in (select s# from sc where c#=''c4'')
</code></pre>
<p>（3）</p>
<pre><code class="lang-sql">select c#,max(grade),min(grade) from sc,c where c.c#=sc.c# and teacher=''李文'' group by c.c#
</code></pre>
<p>（4）</p>
<pre><code class="lang-sql">select sname,age from s where sname like ''王%''
</code></pre>
<p>（5）</p>
<pre><code class="lang-sql">select s#,sname,age from s where age&gt;(select age from s where sname=''张三'')
</code></pre>
<p>（6）</p>
<pre><code class="lang-sql">select s#,sname,grade from s# in (select s# from sc where c#=''c1'') order by grade desc
</code></pre>
<p>（7）</p>
<pre><code class="lang-sql">select c# from c where c# not in (select c# from s,sc where s.s#=sc.s# and sname=''李强'')
</code></pre>
<p>（8）</p>
<pre><code class="lang-sql">insert into s values（''S9'',''WU'',18,''F''）
</code></pre>
<p>（9）</p>
<pre><code class="lang-sql">update sc set grade=grade+10 where s# in (select s# from sc where grade&lt;(select avg(grade) from sc)) and sex=''女''
</code></pre>
<p>（10）</p>
<pre><code class="lang-sql">delete from sc where s#=(select s# from s where sname=''王林'')
</code></pre>
', '2022-03-06 15:30:01', '2022-03-06 15:30:01', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (233, 20, 1, 6, 3, 14, '现有图书借阅关系数据库如下：
图书（图书号，书名，作者，单价，库存量）
读者（读者号，姓名，工作单位，地址）
借阅（图书号，读者号，借期，还期，备注）其中，还期为NULL表示该书未还。
用SQL语言实现下列查询：
（1）检索读者号为R6的读者姓名、工作单位。<br>
（2）检索借阅图书号为B6的读者姓名。<br>
（3）检索读者“李红”所借图书的书名。<br>
（4）检索读者号为R1的读者所借图书中未还的书名。<br>
（5）检索书名为“操作系统”的图书的最高单价和最低单价。<br><br>
（6）检索单价在20到30元（包含20和30）之间的图书的书名及库存量。<br>
（7）检索所有姓王的读者所借图书的图书号、借期和还期。<br>
（8）检索与“张三”同一工作单位的读者号和读者姓名。<br>
（9）将读者“李红”所借图书的信息从借阅表中删除。<br>
（10）将读者号为R2的读者所借图书的还期增加10天。<br>', '现有图书借阅关系数据库如下：图书（图书号，书名，作者，单价，库存量）读者（读者号，姓名，工作单位，地址）借阅（图书号，读者号，借期，还期，备注）其中，还期为NULL表示该书未还。用SQL语言实现下列查询：（1）检索读者号为R6的读者姓名、工作单位。（2）检索借阅图书号为B6的读者姓名。（3）检索读者“李红”所借图书的书名。（4）检索读者号为R1的读者所借图书中未还的书名。（5）检索书名为“操作系统”的图书的最高单价和最低单价。（6）检索单价在20到30元（包含20和30）之间的图书的书名及库存量。（7）检索所有姓王的读者所借图书的图书号、借期和还期。（8）检索与“张三”同一工作单位的读者号和读者姓名。（9）将读者“李红”所借图书的信息从借阅表中删除。（10）将读者号为R2的读者所借图书的还期增加10天。
', '<p>现有图书借阅关系数据库如下：<br>图书（图书号，书名，作者，单价，库存量）<br>读者（读者号，姓名，工作单位，地址）<br>借阅（图书号，读者号，借期，还期，备注）其中，还期为NULL表示该书未还。<br>用SQL语言实现下列查询：<br>（1）检索读者号为R6的读者姓名、工作单位。<br><br>（2）检索借阅图书号为B6的读者姓名。<br><br>（3）检索读者“李红”所借图书的书名。<br><br>（4）检索读者号为R1的读者所借图书中未还的书名。<br><br>（5）检索书名为“操作系统”的图书的最高单价和最低单价。<br><br><br>（6）检索单价在20到30元（包含20和30）之间的图书的书名及库存量。<br><br>（7）检索所有姓王的读者所借图书的图书号、借期和还期。<br><br>（8）检索与“张三”同一工作单位的读者号和读者姓名。<br><br>（9）将读者“李红”所借图书的信息从借阅表中删除。<br><br>（10）将读者号为R2的读者所借图书的还期增加10天。<br>
', '（1）
```sql
select 姓名,工作单位 from 读者 where 读者号=''R6''
```
（2）
```sql
select 姓名 from 读者 a,借阅 b where a.读者号=b.读者号 and 图书号=''B6''
```
（3）
```sql
select 书名 from 图书 a,读者 b,借阅 c where a.图书号=c.图书号 and b.读者号=c.读者号 and 姓名=''李红''
```
（4）
```sql
select 书名 from 图书 a,借阅 b where a.图书号=b.图书号 and 读者号=''R1'' and 还期 is null
```
（5）
```sql
select max(单价),min(单价) from 图书 where 书名=''操作系统''
```
（6）
```sql
select 书名,库存量 from 图书 where 单价 between 20 and 30
```
（7）
```sql
select 图书号,借期,还期 from 借阅 where 读者号 in (select 读者号 from 读者 where 姓名like ''王%'')
```
（8）
```sql
select 读者号,姓名 from 读者where 工作单位=(select 工作单位 from 读者where 姓名=''张三'')
```
（9）
```sql
delete from 借阅 where 读者号 in (select 读者号 from 读者where 姓名=''李红'')
```
（10）
```sql
update 借阅 set 还期=还期+10 where 读者号=''R2''
```', '（1）
select 姓名,工作单位 from 读者 where 读者号=''R6''

（2）
select 姓名 from 读者 a,借阅 b where a.读者号=b.读者号 and 图书号=''B6''

（3）
select 书名 from 图书 a,读者 b,借阅 c where a.图书号=c.图书号 and b.读者号=c.读者号 and 姓名=''李红''

（4）
select 书名 from 图书 a,借阅 b where a.图书号=b.图书号 and 读者号=''R1'' and 还期 is null

（5）
select max(单价),min(单价) from 图书 where 书名=''操作系统''

（6）
select 书名,库存量 from 图书 where 单价 between 20 and 30

（7）
select 图书号,借期,还期 from 借阅 where 读者号 in (select 读者号 from 读者 where 姓名like ''王%'')

（8）
select 读者号,姓名 from 读者where 工作单位=(select 工作单位 from 读者where 姓名=''张三'')

（9）
delete from 借阅 where 读者号 in (select 读者号 from 读者where 姓名=''李红'')

（10）
update 借阅 set 还期=还期+10 where 读者号=''R2''

', '<p>（1）</p>
<pre><code class="lang-sql">select 姓名,工作单位 from 读者 where 读者号=''R6''
</code></pre>
<p>（2）</p>
<pre><code class="lang-sql">select 姓名 from 读者 a,借阅 b where a.读者号=b.读者号 and 图书号=''B6''
</code></pre>
<p>（3）</p>
<pre><code class="lang-sql">select 书名 from 图书 a,读者 b,借阅 c where a.图书号=c.图书号 and b.读者号=c.读者号 and 姓名=''李红''
</code></pre>
<p>（4）</p>
<pre><code class="lang-sql">select 书名 from 图书 a,借阅 b where a.图书号=b.图书号 and 读者号=''R1'' and 还期 is null
</code></pre>
<p>（5）</p>
<pre><code class="lang-sql">select max(单价),min(单价) from 图书 where 书名=''操作系统''
</code></pre>
<p>（6）</p>
<pre><code class="lang-sql">select 书名,库存量 from 图书 where 单价 between 20 and 30
</code></pre>
<p>（7）</p>
<pre><code class="lang-sql">select 图书号,借期,还期 from 借阅 where 读者号 in (select 读者号 from 读者 where 姓名like ''王%'')
</code></pre>
<p>（8）</p>
<pre><code class="lang-sql">select 读者号,姓名 from 读者where 工作单位=(select 工作单位 from 读者where 姓名=''张三'')
</code></pre>
<p>（9）</p>
<pre><code class="lang-sql">delete from 借阅 where 读者号 in (select 读者号 from 读者where 姓名=''李红'')
</code></pre>
<p>（10）</p>
<pre><code class="lang-sql">update 借阅 set 还期=还期+10 where 读者号=''R2''
</code></pre>
', '2022-03-06 15:35:07', '2022-03-06 15:35:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (234, 5, 1, 5, 1, 14, '用一条SQL 语句 查询出每门课都大于80 分的学生姓名:

| name  | course  | grade  |
| ------------ | ------------ | ------------ |
| 张三 | 语文 | 81 |
| 张三 | 数学 | 75 |
| 李四 | 语文 | 76 |
| 李四 | 数学 | 90 |
| 王五 | 语文 | 81 |
| 王五 | 数学 | 100 |
| 王五 | 英语 | 90 |
<br><br><br>', '用一条SQL 语句 查询出每门课都大于80 分的学生姓名:



name
course
grade




张三
语文
81


张三
数学
75


李四
语文
76


李四
数学
90


王五
语文
81


王五
数学
100


王五
英语
90




', '<p>用一条SQL 语句 查询出每门课都大于80 分的学生姓名:</p>
<table>
<thead>
<tr>
<th>name</th>
<th>course</th>
<th>grade</th>
</tr>
</thead>
<tbody>
<tr>
<td>张三</td>
<td>语文</td>
<td>81</td>
</tr>
<tr>
<td>张三</td>
<td>数学</td>
<td>75</td>
</tr>
<tr>
<td>李四</td>
<td>语文</td>
<td>76</td>
</tr>
<tr>
<td>李四</td>
<td>数学</td>
<td>90</td>
</tr>
<tr>
<td>王五</td>
<td>语文</td>
<td>81</td>
</tr>
<tr>
<td>王五</td>
<td>数学</td>
<td>100</td>
</tr>
<tr>
<td>王五</td>
<td>英语</td>
<td>90</td>
</tr>
</tbody>
</table>
<p><br><br><br>
', 'select name from table group by name having min(grade) > 80', 'select name from table group by name having min(grade) &gt; 80
', '<p>select name from table group by name having min(grade) &gt; 80</p>
', '2022-03-06 15:42:07', '2022-03-06 15:42:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (235, 5, 1, 5, 2, 14, '现有学生表如下:

|自动编号 |学号 |姓名 |课程编号 |课程名称 |分数|
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
|1 |2005001 |张三 |0001| 数学 |69|
|2 |2005002 |李四 |0001| 数学 |89|
|3 |2005001 |张三 |0001| 数学 |69|
删除除了自动编号不同, 其他都相同的学生冗余信息
<br><br><br>', '现有学生表如下:



自动编号
学号
姓名
课程编号
课程名称
分数




1
2005001
张三
0001
数学
69


2
2005002
李四
0001
数学
89


3
2005001
张三
0001
数学
69



删除除了自动编号不同, 其他都相同的学生冗余信息
', '<p>现有学生表如下:</p>
<table>
<thead>
<tr>
<th>自动编号</th>
<th>学号</th>
<th>姓名</th>
<th>课程编号</th>
<th>课程名称</th>
<th>分数</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>2005001</td>
<td>张三</td>
<td>0001</td>
<td>数学</td>
<td>69</td>
</tr>
<tr>
<td>2</td>
<td>2005002</td>
<td>李四</td>
<td>0001</td>
<td>数学</td>
<td>89</td>
</tr>
<tr>
<td>3</td>
<td>2005001</td>
<td>张三</td>
<td>0001</td>
<td>数学</td>
<td>69</td>
</tr>
</tbody>
</table>
<p>删除除了自动编号不同, 其他都相同的学生冗余信息<br><br><br><br>
', '```sql
delete tablename where 自动编号 not in (
    select min( 自动编号)
    from tablename
    group by 学号, 姓名, 课程编号, 课程名称, 分数
)
```', 'delete tablename where 自动编号 not in (
    select min( 自动编号)
    from tablename
    group by 学号, 姓名, 课程编号, 课程名称, 分数
)

', '<pre><code class="lang-sql">delete tablename where 自动编号 not in (
    select min( 自动编号)
    from tablename
    group by 学号, 姓名, 课程编号, 课程名称, 分数
)
</code></pre>
', '2022-03-06 15:44:12', '2022-03-06 15:44:12', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (236, 5, 1, 5, 3, 14, '一个叫 team 的表，里面只有一个字段name, 一共有4 条纪录，分别是a,b,c,d, 对应四个球对，现在四个球对进行比赛，用一条sql 语句显示所有可能的比赛组合<br><br><br>', '一个叫 team 的表，里面只有一个字段name, 一共有4 条纪录，分别是a,b,c,d, 对应四个球对，现在四个球对进行比赛，用一条sql 语句显示所有可能的比赛组合
', '<p>一个叫 team 的表，里面只有一个字段name, 一共有4 条纪录，分别是a,b,c,d, 对应四个球对，现在四个球对进行比赛，用一条sql 语句显示所有可能的比赛组合<br><br><br>
', '```sql
select a.name, b.name
from team a, team b
where a.name < b.name
```', 'select a.name, b.name
from team a, team b
where a.name &lt; b.name

', '<pre><code class="lang-sql">select a.name, b.name
from team a, team b
where a.name &lt; b.name
</code></pre>
', '2022-03-06 15:44:50', '2022-03-06 15:44:50', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (237, 5, 1, 5, 3, 14, '请用SQL 语句实现：从TestDB 数据表中查询出所有月份的发生额都比101 科目相应月份的发生额高的科目。
请注意：TestDB 中有很多科目，都有1~12月份的发生额。
AccID ：科目代码，Occmonth ：发生额月份，DebitOccur ：发生额。
数据库名：JcyAudit ，数据集：Select * from TestDB<br><br><br>', '请用SQL 语句实现：从TestDB 数据表中查询出所有月份的发生额都比101 科目相应月份的发生额高的科目。请注意：TestDB 中有很多科目，都有1~12月份的发生额。AccID ：科目代码，Occmonth ：发生额月份，DebitOccur ：发生额。数据库名：JcyAudit ，数据集：Select * from TestDB
', '<p>请用SQL 语句实现：从TestDB 数据表中查询出所有月份的发生额都比101 科目相应月份的发生额高的科目。<br>请注意：TestDB 中有很多科目，都有1~12月份的发生额。<br>AccID ：科目代码，Occmonth ：发生额月份，DebitOccur ：发生额。<br>数据库名：JcyAudit ，数据集：Select * from TestDB<br><br><br>
', '```sql
select a.*
from TestDB a,
    (select Occmonth, max(DebitOccur) as Debit101ccur
    from TestDB
    where AccID=''101''
    group by Occmonth) b
where a.Occmonth = b.Occmonth and a.DebitOccur > b.Debit101ccur
```', 'select a.*
from TestDB a,
    (select Occmonth, max(DebitOccur) as Debit101ccur
    from TestDB
    where AccID=''101''
    group by Occmonth) b
where a.Occmonth = b.Occmonth and a.DebitOccur &gt; b.Debit101ccur

', '<pre><code class="lang-sql">select a.*
from TestDB a,
    (select Occmonth, max(DebitOccur) as Debit101ccur
    from TestDB
    where AccID=''101''
    group by Occmonth) b
where a.Occmonth = b.Occmonth and a.DebitOccur &gt; b.Debit101ccur
</code></pre>
', '2022-03-06 15:45:24', '2022-03-06 15:45:24', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (238, 5, 1, 5, 3, 14, '怎么把这样一个数据表

|year |month |amount|
|-----|------|-------|
|1991| 1| 1.1|
|1991 |2 |1.2|
|1991| 3 |1.3|
|1991 |4 |1.4|
|1992| 1 |2.1|
|1992 |2 |2.2|
|1992 |3 |2.3|
|1992 |4 |2.4|
查成这样一个结果？

|year |m1 |m2 |m3 |m4|
|-----|----|----|----|----|
|1991 |1.1 |1.2 |1.3 |1.4|
|1992| 2.1| 2.2 |2.3 |2.4|
<br><br><br>', '怎么把这样一个数据表



year
month
amount




1991
1
1.1


1991
2
1.2


1991
3
1.3


1991
4
1.4


1992
1
2.1


1992
2
2.2


1992
3
2.3


1992
4
2.4



查成这样一个结果？



year
m1
m2
m3
m4




1991
1.1
1.2
1.3
1.4


1992
2.1
2.2
2.3
2.4




', '<p>怎么把这样一个数据表</p>
<table>
<thead>
<tr>
<th>year</th>
<th>month</th>
<th>amount</th>
</tr>
</thead>
<tbody>
<tr>
<td>1991</td>
<td>1</td>
<td>1.1</td>
</tr>
<tr>
<td>1991</td>
<td>2</td>
<td>1.2</td>
</tr>
<tr>
<td>1991</td>
<td>3</td>
<td>1.3</td>
</tr>
<tr>
<td>1991</td>
<td>4</td>
<td>1.4</td>
</tr>
<tr>
<td>1992</td>
<td>1</td>
<td>2.1</td>
</tr>
<tr>
<td>1992</td>
<td>2</td>
<td>2.2</td>
</tr>
<tr>
<td>1992</td>
<td>3</td>
<td>2.3</td>
</tr>
<tr>
<td>1992</td>
<td>4</td>
<td>2.4</td>
</tr>
</tbody>
</table>
<p>查成这样一个结果？</p>
<table>
<thead>
<tr>
<th>year</th>
<th>m1</th>
<th>m2</th>
<th>m3</th>
<th>m4</th>
</tr>
</thead>
<tbody>
<tr>
<td>1991</td>
<td>1.1</td>
<td>1.2</td>
<td>1.3</td>
<td>1.4</td>
</tr>
<tr>
<td>1992</td>
<td>2.1</td>
<td>2.2</td>
<td>2.3</td>
<td>2.4</td>
</tr>
</tbody>
</table>
<p><br><br><br>
', '```sql
select year,
    (select amount from table m where month=1 and m.year=table.year) as m1,
    (select amount from table m where month=2 and m.year=table.year) as m2,
    (select amount from table m where month=3 and m.year=table.year) as m3,
    (select amount from table m where month=4 and m.year=table.year) as m4
from table group by year
```', 'select year,
    (select amount from table m where month=1 and m.year=table.year) as m1,
    (select amount from table m where month=2 and m.year=table.year) as m2,
    (select amount from table m where month=3 and m.year=table.year) as m3,
    (select amount from table m where month=4 and m.year=table.year) as m4
from table group by year

', '<pre><code class="lang-sql">select year,
    (select amount from table m where month=1 and m.year=table.year) as m1,
    (select amount from table m where month=2 and m.year=table.year) as m2,
    (select amount from table m where month=3 and m.year=table.year) as m3,
    (select amount from table m where month=4 and m.year=table.year) as m4
from table group by year
</code></pre>
', '2022-03-06 15:48:11', '2022-03-06 15:48:11', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (239, 5, 1, 5, 3, 14, 'InnoDB存储引擎核心特性?<br><br><br>', 'InnoDB存储引擎核心特性?
', '<p>InnoDB存储引擎核心特性?<br><br><br>
', '支持事务 行级锁 热备 多版本控制 自动故障安全恢复', '支持事务 行级锁 热备 多版本控制 自动故障安全恢复
', '<p>支持事务 行级锁 热备 多版本控制 自动故障安全恢复</p>
', '2022-03-06 15:50:07', '2022-03-06 15:50:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (240, 5, 1, 5, 3, 14, '创建管理员用户：oldboy能通过10.0.0.0/24网段任意地址登录管理MySQL
<br><br><br>', '创建管理员用户：oldboy能通过10.0.0.0/24网段任意地址登录管理MySQL
', '<p>创建管理员用户：oldboy能通过10.0.0.0/24网段任意地址登录管理MySQL<br><br><br><br>
', '```sql
create user oldboy@''10.0.0.%'';
```', 'create user oldboy@''10.0.0.%'';

', '<pre><code class="lang-sql">create user oldboy@''10.0.0.%'';
</code></pre>
', '2022-03-06 15:51:01', '2022-03-06 15:51:01', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (241, 5, 1, 5, 1, 14, '创建应用用户：wordpress能通过172.16.1.0/24网段任意地址登录操作wordpress库下的所有表<br><br><br>', '创建应用用户：wordpress能通过172.16.1.0/24网段任意地址登录操作wordpress库下的所有表
', '<p>创建应用用户：wordpress能通过172.16.1.0/24网段任意地址登录操作wordpress库下的所有表<br><br><br>
', '```sql
create user wordpress@''172.16.1.%'';
grant insert, update, delete, select on wordpress.* to wordpress@''172.16.1.%'';
```', 'create user wordpress@''172.16.1.%'';
grant insert, update, delete, select on wordpress.* to wordpress@''172.16.1.%'';

', '<pre><code class="lang-sql">create user wordpress@''172.16.1.%'';
grant insert, update, delete, select on wordpress.* to wordpress@''172.16.1.%'';
</code></pre>
', '2022-03-06 15:51:37', '2022-03-06 15:51:37', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (242, 5, 1, 5, 1, 14, '请写出使用oldboy用户远程登录MySQL的具体语句<br><br><br>', '请写出使用oldboy用户远程登录MySQL的具体语句
', '<p>请写出使用oldboy用户远程登录MySQL的具体语句<br><br><br>
', '```shell
mysql -uroot -p -h 10.0.0.51
```', 'mysql -uroot -p -h 10.0.0.51

', '<pre><code class="lang-shell">mysql -uroot -p -h 10.0.0.51
</code></pre>
', '2022-03-06 15:52:28', '2022-03-06 15:52:28', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (243, 5, 1, 5, 1, 14, '创建GBK字符集的数据库oldboy，并查看已建库完整语句<br><br><br>', '创建GBK字符集的数据库oldboy，并查看已建库完整语句
', '<p>创建GBK字符集的数据库oldboy，并查看已建库完整语句<br><br><br>
', '```sql
create database oldboy charset=GBK;
show  create database oldboy;
```', 'create database oldboy charset=GBK;
show  create database oldboy;

', '<pre><code class="lang-sql">create database oldboy charset=GBK;
show  create database oldboy;
</code></pre>
', '2022-03-06 15:53:15', '2022-03-06 15:53:15', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (244, 5, 1, 5, 2, 14, '请介绍 NOT NULL default auto_increament 的作用<br><br><br>', '请介绍 NOT NULL default auto_increament 的作用
', '<p>请介绍 NOT NULL default auto_increament 的作用<br><br><br>
', '非空 此字段不能为空
自增 ', '非空 此字段不能为空自增
', '<p>非空 此字段不能为空<br>自增
', '2022-03-06 15:53:56', '2022-03-06 15:53:56', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (245, 5, 1, 5, 2, 14, '创建用户oldboy，使之可以管理数据库oldboy<br><br><br>', '创建用户oldboy，使之可以管理数据库oldboy
', '<p>创建用户oldboy，使之可以管理数据库oldboy<br><br><br>
', '```sql
create user oldboy@''%'';
grant all on oldboy.* to oldboy@''%'';
```', 'create user oldboy@''%'';
grant all on oldboy.* to oldboy@''%'';

', '<pre><code class="lang-sql">create user oldboy@''%'';
grant all on oldboy.* to oldboy@''%'';
</code></pre>
', '2022-03-06 15:54:33', '2022-03-06 15:54:33', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (246, 5, 1, 5, 2, 14, '收回oldboy用户的drop权限<br><br><br>', '收回oldboy用户的drop权限
', '<p>收回oldboy用户的drop权限<br><br><br>
', '```sql
revoke drop  on oldboy.* from oldboy@''%'';
```', 'revoke drop  on oldboy.* from oldboy@''%'';

', '<pre><code class="lang-sql">revoke drop  on oldboy.* from oldboy@''%'';
</code></pre>
', '2022-03-06 15:55:04', '2022-03-06 15:55:04', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (247, 5, 1, 5, 2, 14, '查看创建的用户oldboy拥有哪些权限<br><br><br>', '查看创建的用户oldboy拥有哪些权限
', '<p>查看创建的用户oldboy拥有哪些权限<br><br><br>
', '```sql
show grants for oldboy@''%'';
```', 'show grants for oldboy@''%'';

', '<pre><code class="lang-sql">show grants for oldboy@''%'';
</code></pre>
', '2022-03-06 15:55:37', '2022-03-06 15:55:37', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (248, 5, 1, 5, 2, 14, '查看建表结构及表结构的SQL语句<br><br><br>', '查看建表结构及表结构的SQL语句
', '<p>查看建表结构及表结构的SQL语句<br><br><br>
', '```sql
desc 表名
show create database 表名
```', 'desc 表名
show create database 表名

', '<pre><code class="lang-sql">desc 表名
show create database 表名
</code></pre>
', '2022-03-06 15:56:04', '2022-03-06 15:56:04', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (249, 5, 1, 5, 1, 14, '查看数据库中所有引擎的类型<br><br><br>', '查看数据库中所有引擎的类型
', '<p>查看数据库中所有引擎的类型<br><br><br>
', 'show engines;', 'show engines;
', '<p>show engines;</p>
', '2022-03-06 15:56:40', '2022-03-06 15:56:40', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (250, 5, 1, 5, 1, 14, '查看数据库关于日志的参数配置<br><br><br>', '查看数据库关于日志的参数配置
', '<p>查看数据库关于日志的参数配置<br><br><br>
', '```sql
select @@general_log_file;
show variables
```', 'select @@general_log_file;
show variables

', '<pre><code class="lang-sql">select @@general_log_file;
show variables
</code></pre>
', '2022-03-06 15:57:06', '2022-03-06 15:57:06', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (251, 5, 1, 5, 1, 14, '如何查看world数据库下city表中population列的重复值情况<br><br><br>', '如何查看world数据库下city表中population列的重复值情况
', '<p>如何查看world数据库下city表中population列的重复值情况<br><br><br>
', 'SELECT NAME,COUNT(population) FROM city GROUP BY NAME ;', 'SELECT NAME,COUNT(population) FROM city GROUP BY NAME ;
', '<p>SELECT NAME,COUNT(population) FROM city GROUP BY NAME ;</p>
', '2022-03-06 15:57:35', '2022-03-06 15:57:35', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (252, 5, 1, 5, 2, 14, '请列出explain命令中type中多种类型<br><br><br>', '请列出explain命令中type中多种类型
', '<p>请列出explain命令中type中多种类型<br><br><br>
', 'ALL,index,range,ref,eq_ref,system(const),NULL', 'ALL,index,range,ref,eq_ref,system(const),NULL
', '<p>ALL,index,range,ref,eq_ref,system(const),NULL</p>
', '2022-03-06 15:58:09', '2022-03-06 15:58:09', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (253, 5, 1, 5, 2, 14, '一张表，里面有ID自增主键，当insert了17条记录之后，删除了第15,16,17条记录，再把Mysql重启，再insert一条记录，这条记录的ID是18还是15 ？', '一张表，里面有ID自增主键，当insert了17条记录之后，删除了第15,16,17条记录，再把Mysql重启，再insert一条记录，这条记录的ID是18还是15 ？
', '<p>一张表，里面有ID自增主键，当insert了17条记录之后，删除了第15,16,17条记录，再把Mysql重启，再insert一条记录，这条记录的ID是18还是15 ？</p>
', '![](/files/1646553585357.png)', '
', '<p><img src="/files/1646553585357.png" alt="">
', '2022-03-06 15:59:55', '2022-03-06 15:59:55', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (254, 5, 1, 5, 3, 14, 'Mysql服务器默认端口是什么？', 'Mysql服务器默认端口是什么？
', '<p>Mysql服务器默认端口是什么？</p>
', '3306', '3306
', '<p>3306</p>
', '2022-03-06 16:00:29', '2022-03-06 16:00:29', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (255, 5, 1, 5, 3, 14, '与Oracle相比，Mysql有什么优势？', '与Oracle相比，Mysql有什么优势？
', '<p>与Oracle相比，Mysql有什么优势？</p>
', 'Mysql是开源软件，随时可用，无需付费。
Mysql是便携式的
带有命令提示符的GUI。
使用Mysql查询浏览器支持管理', 'Mysql是开源软件，随时可用，无需付费。Mysql是便携式的带有命令提示符的GUI。使用Mysql查询浏览器支持管理
', '<p>Mysql是开源软件，随时可用，无需付费。<br>Mysql是便携式的<br>带有命令提示符的GUI。<br>使用Mysql查询浏览器支持管理
', '2022-03-06 16:00:54', '2022-03-06 16:00:54', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (256, 5, 1, 5, 3, 14, '如何区分FLOAT和DOUBLE？', '如何区分FLOAT和DOUBLE？
', '<p>如何区分FLOAT和DOUBLE？</p>
', '浮点数以8位精度存储在FLOAT中，并且有四个字节。
浮点数存储在DOUBLE中，精度为18位，有八个字节。', '浮点数以8位精度存储在FLOAT中，并且有四个字节。浮点数存储在DOUBLE中，精度为18位，有八个字节。
', '<p>浮点数以8位精度存储在FLOAT中，并且有四个字节。<br>浮点数存储在DOUBLE中，精度为18位，有八个字节。
', '2022-03-06 16:01:18', '2022-03-06 16:01:18', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (257, 5, 1, 5, 3, 14, 'CHAR和VARCHAR的区别？<br><br><br>', 'CHAR和VARCHAR的区别？
', '<p>CHAR和VARCHAR的区别？<br><br><br>
', 'CHAR和VARCHAR类型在存储和检索方面有所不同
CHAR列长度固定为创建表时声明的长度，长度值范围是1到255', 'CHAR和VARCHAR类型在存储和检索方面有所不同CHAR列长度固定为创建表时声明的长度，长度值范围是1到255
', '<p>CHAR和VARCHAR类型在存储和检索方面有所不同<br>CHAR列长度固定为创建表时声明的长度，长度值范围是1到255
', '2022-03-06 16:02:03', '2022-03-06 16:02:03', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (258, 1, 1, 4, 2, 14, '数据库系统的核心是数据库。（ ）', '数据库系统的核心是数据库。（ ）
', '<p>数据库系统的核心是数据库。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 16:53:18', '2022-03-06 16:53:18', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (259, 1, 1, 4, 2, 14, '数据库系统的核心和基础是数据模型。（ ）', '数据库系统的核心和基础是数据模型。（ ）
', '<p>数据库系统的核心和基础是数据模型。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 16:54:11', '2022-03-06 16:54:11', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (260, 1, 1, 4, 2, 14, 'DROP是DDL。（ ）', 'DROP是DDL。（ ）
', '<p>DROP是DDL。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 16:55:44', '2022-03-06 16:55:44', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (261, 1, 1, 4, 2, 14, 'CREATE是DDL。（ ）', 'CREATE是DDL。（ ）
', '<p>CREATE是DDL。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 16:56:07', '2022-03-06 16:56:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (262, 1, 1, 4, 2, 14, 'ALTER是DML。（ ）', 'ALTER是DML。（ ）
', '<p>ALTER是DML。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 16:56:29', '2022-03-06 16:56:29', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (263, 1, 1, 4, 2, 14, 'ALTER是DDL。（ ）', 'ALTER是DDL。（ ）
', '<p>ALTER是DDL。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 16:56:54', '2022-03-06 16:56:54', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (264, 1, 1, 4, 2, 14, 'CREATE是DML。（ ）', 'CREATE是DML。（ ）
', '<p>CREATE是DML。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 16:57:18', '2022-03-06 16:57:18', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (265, 1, 1, 4, 2, 14, 'TRUNCATE是DDL。（ ）', 'TRUNCATE是DDL。（ ）
', '<p>TRUNCATE是DDL。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 16:57:42', '2022-03-06 16:57:42', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (266, 1, 1, 4, 2, 14, 'TRUNCATE是DML。（ ）', 'TRUNCATE是DML。（ ）
', '<p>TRUNCATE是DML。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 16:58:01', '2022-03-06 16:58:01', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (267, 1, 1, 4, 3, 14, 'COMMENT是DML。（ ）', 'COMMENT是DML。（ ）
', '<p>COMMENT是DML。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 16:58:38', '2022-03-06 16:58:38', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (268, 1, 1, 4, 3, 14, 'COMMENT是DDL。（ ）', 'COMMENT是DDL。（ ）
', '<p>COMMENT是DDL。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 16:58:58', '2022-03-06 16:58:58', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (269, 1, 1, 4, 3, 14, 'GRANT是DML。（ ）', 'GRANT是DML。（ ）
', '<p>GRANT是DML。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 16:59:20', '2022-03-06 16:59:20', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (270, 1, 1, 4, 3, 14, 'GRANT是DDL。（ ）', 'GRANT是DDL。（ ）
', '<p>GRANT是DDL。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 16:59:38', '2022-03-06 16:59:38', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (271, 1, 1, 4, 3, 14, 'REVOKE是DML。（ ）', 'REVOKE是DML。（ ）
', '<p>REVOKE是DML。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 17:00:01', '2022-03-06 17:00:01', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (272, 1, 1, 4, 3, 14, 'REVOKE是DDL。（ ）', 'REVOKE是DDL。（ ）
', '<p>REVOKE是DDL。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 17:00:19', '2022-03-06 17:00:19', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (273, 1, 1, 4, 3, 14, 'SELECT是DML。（ ）', 'SELECT是DML。（ ）
', '<p>SELECT是DML。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 17:00:39', '2022-03-06 17:00:39', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (274, 1, 1, 4, 3, 14, 'SELECTT是DDL。（ ）', 'SELECTT是DDL。（ ）
', '<p>SELECTT是DDL。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 17:00:59', '2022-03-06 17:00:59', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (275, 1, 1, 4, 3, 14, 'UPDATE是DML。（ ）', 'UPDATE是DML。（ ）
', '<p>UPDATE是DML。（ ）</p>
', '√', '√
', '<p>√</p>
', '2022-03-06 17:01:19', '2022-03-06 17:01:19', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (276, 1, 1, 4, 3, 14, 'UPDATE是DDL。（ ）', 'UPDATE是DDL。（ ）
', '<p>UPDATE是DDL。（ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-06 17:01:39', '2022-03-06 17:01:39', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (277, 1, 1, 1, 2, 14, 'SQL语言中数据定义语言DDL中包括哪个语句（ ）
A、DROP
B、DELETE
C、select
D、grant', 'SQL语言中数据定义语言DDL中包括哪个语句（ ）A、DROPB、DELETEC、selectD、grant
', '<p>SQL语言中数据定义语言DDL中包括哪个语句（ ）<br>A、DROP<br>B、DELETE<br>C、select<br>D、grant
', 'A', 'A
', '<p>A</p>
', '2022-03-06 17:02:28', '2022-03-06 17:02:28', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (278, 1, 1, 1, 2, 14, 'SQL语句中REVOKE all on auth.* from ‘zhangsan’@‘localhost’；表述正确的是（ ）
A、zhangsan账户可以在localhost登陆
B、撤销zhangsan用户的auth库权限
C、Zhangsan对ON库没有权限
D、撤销全部命令', 'SQL语句中REVOKE all on auth.* from ‘zhangsan’@‘localhost’；表述正确的是（ ）A、zhangsan账户可以在localhost登陆B、撤销zhangsan用户的auth库权限C、Zhangsan对ON库没有权限D、撤销全部命令
', '<p>SQL语句中REVOKE all on auth.* from ‘zhangsan’@‘localhost’；表述正确的是（ ）<br>A、zhangsan账户可以在localhost登陆<br>B、撤销zhangsan用户的auth库权限<br>C、Zhangsan对ON库没有权限<br>D、撤销全部命令
', 'B', 'B
', '<p>B</p>
', '2022-03-06 17:03:03', '2022-03-06 17:03:03', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (279, 1, 1, 1, 2, 14, '备份所有数据库（ ）
A、mysqldump -u root -p mysql user > msyql-user.sql
B、mysqldump -u root -p auth > auth.sql
C、mysqldump -u root -p --all-databases > all-db.sql
D、Mysqldump -u root -p --databases > all-db.sql', '备份所有数据库（ ）A、mysqldump -u root -p mysql user &gt; msyql-user.sqlB、mysqldump -u root -p auth &gt; auth.sqlC、mysqldump -u root -p —all-databases &gt; all-db.sqlD、Mysqldump -u root -p —databases > all-db.sql
', '<p>备份所有数据库（ ）<br>A、mysqldump -u root -p mysql user &gt; msyql-user.sql<br>B、mysqldump -u root -p auth &gt; auth.sql<br>C、mysqldump -u root -p —all-databases &gt; all-db.sql<br>D、Mysqldump -u root -p —databases > all-db.sql
', 'C', 'C
', '<p>C</p>
', '2022-03-06 17:03:25', '2022-03-06 17:03:25', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (280, 1, 1, 1, 2, 14, 'SELECT user,host,password FROM mysql.user WHERE user=’’ ,描述正确的有（ ）
A、全部用户都会被显示
B、显示表中的三列
C、只显示user库中的mysql表
D、显示mysql库中的表', 'SELECT user,host,password FROM mysql.user WHERE user=’’ ,描述正确的有（ ）A、全部用户都会被显示B、显示表中的三列C、只显示user库中的mysql表D、显示mysql库中的表
', '<p>SELECT user,host,password FROM mysql.user WHERE user=’’ ,描述正确的有（ ）<br>A、全部用户都会被显示<br>B、显示表中的三列<br>C、只显示user库中的mysql表<br>D、显示mysql库中的表
', 'B', 'B
', '<p>B</p>
', '2022-03-06 17:03:42', '2022-03-06 17:03:42', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (281, 1, 1, 1, 2, 14, 'UPDATE auth.user SET user_password=PASSWORD(‘’) WHERE user_name =’lisi’; 描述错误的是（ ）
A、设置密码格式
B、修改users表内的单行数据
C、Root密码为空
D、Auth库不存在', 'UPDATE auth.user SET user_password=PASSWORD(‘’) WHERE user_name =’lisi’; 描述错误的是（ ）A、设置密码格式B、修改users表内的单行数据C、Root密码为空D、Auth库不存在
', '<p>UPDATE auth.user SET user_password=PASSWORD(‘’) WHERE user_name =’lisi’; 描述错误的是（ ）<br>A、设置密码格式<br>B、修改users表内的单行数据<br>C、Root密码为空<br>D、Auth库不存在
', 'B', 'B
', '<p>B</p>
', '2022-03-06 17:04:00', '2022-03-06 17:04:00', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (282, 1, 1, 1, 2, 14, '在MySQL中，通常使用( )语句来指定一个已有数据库作为当前工作数据库。
A、USING
B、USED
C、USESD
D、USE', '在MySQL中，通常使用( )语句来指定一个已有数据库作为当前工作数据库。A、USINGB、USEDC、USESDD、USE
', '<p>在MySQL中，通常使用( )语句来指定一个已有数据库作为当前工作数据库。<br>A、USING<br>B、USED<br>C、USESD<br>D、USE
', 'D', 'D
', '<p>D</p>
', '2022-03-06 17:04:26', '2022-03-06 17:04:26', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (283, 1, 1, 1, 2, 14, '在MySQL中创建一个名为db_test的数据库，一下正确的是（ ）
A、CREATE TABLE db_test；
B、CREATE DATABASE db_test；
C、CREATE DATABASES db_test；
D、INSERT INTO db_test VALUES(1);', '在MySQL中创建一个名为db_test的数据库，一下正确的是（ ）A、CREATE TABLE db_test；B、CREATE DATABASE db_test；C、CREATE DATABASES db_test；D、INSERT INTO db_test VALUES(1);
', '<p>在MySQL中创建一个名为db_test的数据库，一下正确的是（ ）<br>A、CREATE TABLE db_test；<br>B、CREATE DATABASE db_test；<br>C、CREATE DATABASES db_test；<br>D、INSERT INTO db_test VALUES(1);
', 'B', 'B
', '<p>B</p>
', '2022-03-06 17:04:45', '2022-03-06 17:04:45', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (284, 1, 1, 1, 2, 14, '设置表的默认字符集关键字是（ ）
A、DEFAULT CHARACTER
B、DEFAULT SET
C、DEFAULT DEFAULT
D、CHARACTER SET', '设置表的默认字符集关键字是（ ）A、DEFAULT CHARACTERB、DEFAULT SETC、DEFAULT DEFAULTD、CHARACTER SET
', '<p>设置表的默认字符集关键字是（ ）<br>A、DEFAULT CHARACTER<br>B、DEFAULT SET<br>C、DEFAULT DEFAULT<br>D、CHARACTER SET
', 'D', 'D
', '<p>D</p>
', '2022-03-06 17:05:11', '2022-03-06 17:05:11', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (285, 1, 1, 1, 3, 14, '在数据管理技术的发展过程中，经历了人工管理阶段、文件系统阶段和数据库系统阶段。在这几个阶段中，数据独立性最高的是（ ）阶段。
A. 数据库系统
B. 文件系统
C. 人工管理
D.数据项管理', '在数据管理技术的发展过程中，经历了人工管理阶段、文件系统阶段和数据库系统阶段。在这几个阶段中，数据独立性最高的是（ ）阶段。A. 数据库系统B. 文件系统C. 人工管理D.数据项管理
', '<p>在数据管理技术的发展过程中，经历了人工管理阶段、文件系统阶段和数据库系统阶段。在这几个阶段中，数据独立性最高的是（ ）阶段。<br>A. 数据库系统<br>B. 文件系统<br>C. 人工管理<br>D.数据项管理
', 'A', 'A
', '<p>A</p>
', '2022-03-19 10:41:48', '2022-03-19 10:41:48', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (286, 1, 1, 1, 3, 14, '数据库系统与文件系统的主要区别是（ ）。
A. 数据库系统复杂，而文件系统简单
B. 文件系统不能解决数据冗余和数据独立性问题，而数据库系统可以解决
C. 文件系统只能管理程序文件，而数据库系统能够管理各种类型的文件
D. 文件系统管理的数据量较少，而数据库系统可以管理庞大的数据量', '数据库系统与文件系统的主要区别是（ ）。A. 数据库系统复杂，而文件系统简单B. 文件系统不能解决数据冗余和数据独立性问题，而数据库系统可以解决C. 文件系统只能管理程序文件，而数据库系统能够管理各种类型的文件D. 文件系统管理的数据量较少，而数据库系统可以管理庞大的数据量
', '<p>数据库系统与文件系统的主要区别是（ ）。<br>A. 数据库系统复杂，而文件系统简单<br>B. 文件系统不能解决数据冗余和数据独立性问题，而数据库系统可以解决<br>C. 文件系统只能管理程序文件，而数据库系统能够管理各种类型的文件<br>D. 文件系统管理的数据量较少，而数据库系统可以管理庞大的数据量
', 'B', 'B
', '<p>B</p>
', '2022-03-19 10:42:17', '2022-03-19 10:42:17', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (287, 1, 1, 1, 3, 14, '在数据库中存储的是（ ）。
A. 数据
B. 数据模型
C. 数据及数据之间的联系
D. 信息', '在数据库中存储的是（ ）。A. 数据B. 数据模型C. 数据及数据之间的联系D. 信息
', '<p>在数据库中存储的是（ ）。<br>A. 数据<br>B. 数据模型<br>C. 数据及数据之间的联系<br>D. 信息
', 'C', 'C
', '<p>C</p>
', '2022-03-19 10:42:42', '2022-03-19 10:42:42', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (288, 1, 1, 1, 3, 14, '数据库的特点之一是数据的共享，严格地讲，这里的数据共享是指（ ）。
A. 同一个应用中的多个程序共享一个数据集合
B. 多个用户、同一种语言共享数据
C. 多个用户共享一个数据文件
D. 多种应用、多种语言、多个用户相互覆盖地使用数据集合', '数据库的特点之一是数据的共享，严格地讲，这里的数据共享是指（ ）。A. 同一个应用中的多个程序共享一个数据集合B. 多个用户、同一种语言共享数据C. 多个用户共享一个数据文件D. 多种应用、多种语言、多个用户相互覆盖地使用数据集合
', '<p>数据库的特点之一是数据的共享，严格地讲，这里的数据共享是指（ ）。<br>A. 同一个应用中的多个程序共享一个数据集合<br>B. 多个用户、同一种语言共享数据<br>C. 多个用户共享一个数据文件<br>D. 多种应用、多种语言、多个用户相互覆盖地使用数据集合
', 'D', 'D
', '<p>D</p>
', '2022-03-19 10:43:07', '2022-03-19 10:43:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (289, 1, 1, 1, 3, 14, '数据库（DB）、数据库系统（DBS）和数据库管理系统（DBMS）三者之间的关系是（ ）。
A. DBS包括DB和DBMS
B. DBMS包括DB和DBS
C. DB包括DBS和DBMS
D. DBS就是DB,也就是DBMS', '数据库（DB）、数据库系统（DBS）和数据库管理系统（DBMS）三者之间的关系是（ ）。A. DBS包括DB和DBMSB. DBMS包括DB和DBSC. DB包括DBS和DBMSD. DBS就是DB,也就是DBMS
', '<p>数据库（DB）、数据库系统（DBS）和数据库管理系统（DBMS）三者之间的关系是（ ）。<br>A. DBS包括DB和DBMS<br>B. DBMS包括DB和DBS<br>C. DB包括DBS和DBMS<br>D. DBS就是DB,也就是DBMS
', 'A', 'A
', '<p>A</p>
', '2022-03-19 10:43:54', '2022-03-19 10:43:54', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (290, 1, 1, 1, 3, 14, '数据库管理系统（DBMS）是（ ）。
A. 一个完整的数据库应用系统
B.一组硬件
C. 一组系统软件
D.既有硬件，也有软件', '数据库管理系统（DBMS）是（ ）。A. 一个完整的数据库应用系统B.一组硬件C. 一组系统软件D.既有硬件，也有软件
', '<p>数据库管理系统（DBMS）是（ ）。<br>A. 一个完整的数据库应用系统<br>B.一组硬件<br>C. 一组系统软件<br>D.既有硬件，也有软件
', 'C', 'C
', '<p>C</p>
', '2022-03-19 10:44:19', '2022-03-19 10:44:19', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (291, 1, 1, 1, 3, 14, '数据库是在计算机系统中按照一定的数据模型组织、存储和应用的（ ）。
A. 文件的集合
B. 数据的集合
C. 命令的集合
D. 程序的集合', '数据库是在计算机系统中按照一定的数据模型组织、存储和应用的（ ）。A. 文件的集合B. 数据的集合C. 命令的集合D. 程序的集合
', '<p>数据库是在计算机系统中按照一定的数据模型组织、存储和应用的（ ）。<br>A. 文件的集合<br>B. 数据的集合<br>C. 命令的集合<br>D. 程序的集合
', 'B', 'B
', '<p>B</p>
', '2022-03-19 10:44:43', '2022-03-19 10:44:43', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (292, 1, 1, 1, 3, 14, '支持数据库各种操作的软件系统是（ ）。
A. 命令系统
B. 数据库管理系统
C. 数据库系统
D. 操作系统', '支持数据库各种操作的软件系统是（ ）。A. 命令系统B. 数据库管理系统C. 数据库系统D. 操作系统
', '<p>支持数据库各种操作的软件系统是（ ）。<br>A. 命令系统<br>B. 数据库管理系统<br>C. 数据库系统<br>D. 操作系统
', 'B', 'B
', '<p>B</p>
', '2022-03-19 10:45:03', '2022-03-19 10:45:03', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (293, 1, 1, 4, 1, 14, 'SQL语句中的查询只能针对一个表进行，一个查询不能同时涉及两个以上表。 （ ）', 'SQL语句中的查询只能针对一个表进行，一个查询不能同时涉及两个以上表。 （ ）
', '<p>SQL语句中的查询只能针对一个表进行，一个查询不能同时涉及两个以上表。 （ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-19 16:56:27', '2022-03-19 16:56:27', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (294, 1, 1, 4, 1, 14, '在各种范式中，3NF⊂NCNF⊂2NF⊂1NF成立。 （ ）', '在各种范式中，3NF⊂NCNF⊂2NF⊂1NF成立。 （ ）
', '<p>在各种范式中，3NF⊂NCNF⊂2NF⊂1NF成立。 （ ）</p>
', '×', '×
', '<p>×</p>
', '2022-03-19 16:56:56', '2022-03-19 16:56:56', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (295, 1, 1, 1, 1, 14, '文件系统与数据库系统相比较，其缺陷主要表现在数据联系弱、数据冗余和（  ）
A 、数据存储量低
B 、处理速度慢
C 、数据不一致
D 、操作繁琐', '文件系统与数据库系统相比较，其缺陷主要表现在数据联系弱、数据冗余和（  ）A 、数据存储量低B 、处理速度慢C 、数据不一致D 、操作繁琐
', '<p>文件系统与数据库系统相比较，其缺陷主要表现在数据联系弱、数据冗余和（  ）<br>A 、数据存储量低<br>B 、处理速度慢<br>C 、数据不一致<br>D 、操作繁琐
', 'C', 'C
', '<p>C</p>
', '2022-03-19 16:59:09', '2022-03-19 16:59:09', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (296, 1, 1, 1, 1, 14, '数据的存储结构与数据逻辑结构之间的独立性成为数据的（  ）
A 、结构独立性
B 、物理独立性
C 、逻辑独立性
D 、分布独立性', '数据的存储结构与数据逻辑结构之间的独立性成为数据的（  ）A 、结构独立性B 、物理独立性C 、逻辑独立性D 、分布独立性
', '<p>数据的存储结构与数据逻辑结构之间的独立性成为数据的（  ）<br>A 、结构独立性<br>B 、物理独立性<br>C 、逻辑独立性<br>D 、分布独立性
', 'B', 'B
', '<p>B</p>
', '2022-03-19 16:59:37', '2022-03-19 16:59:37', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (298, 2, 1, 2, 1, 14, '以下选项中，不是物理结构设计阶段主要内容的是( )
A.局部视图设计
B.计算机系统设计
C.数据通信网络设计
D.集成视图设计
', '以下选项中，不是物理结构设计阶段主要内容的是( )A.局部视图设计B.计算机系统设计C.数据通信网络设计D.集成视图设计
', '<p>以下选项中，不是物理结构设计阶段主要内容的是( )<br>A.局部视图设计<br>B.计算机系统设计<br>C.数据通信网络设计<br>D.集成视图设计
', 'AD', 'AD
', '<p>AD</p>
', '2022-04-10 14:57:18', '2022-04-10 14:57:18', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (299, 2, 1, 2, 1, 14, '以下属于日常生活中的数据库应用系统的是( )
A.银行业务系统
B.超市销售系统
C.大厦监控系统
D.教学管理系统
', '以下属于日常生活中的数据库应用系统的是( )A.银行业务系统B.超市销售系统C.大厦监控系统D.教学管理系统
', '<p>以下属于日常生活中的数据库应用系统的是( )<br>A.银行业务系统<br>B.超市销售系统<br>C.大厦监控系统<br>D.教学管理系统
', 'ABD', 'ABD
', '<p>ABD</p>
', '2022-04-10 14:57:58', '2022-04-10 14:57:58', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (300, 2, 1, 2, 1, 14, '以下关于文件管理的特点描述不正确的是(  )
A.数据可以长期保存
B.通过文件系统管理数据，应用程序和数据之间不存在独立性
C.数据共享性差、冗余量大
D.数据的独立性较强，灵活性较高
', '以下关于文件管理的特点描述不正确的是(  )A.数据可以长期保存B.通过文件系统管理数据，应用程序和数据之间不存在独立性C.数据共享性差、冗余量大D.数据的独立性较强，灵活性较高
', '<p>以下关于文件管理的特点描述不正确的是(  )<br>A.数据可以长期保存<br>B.通过文件系统管理数据，应用程序和数据之间不存在独立性<br>C.数据共享性差、冗余量大<br>D.数据的独立性较强，灵活性较高
', 'BD', 'BD
', '<p>BD</p>
', '2022-04-10 14:58:35', '2022-04-10 14:58:35', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (301, 2, 1, 2, 1, 14, '关于模式和实例之间的关系，以下描述不正确的是(  )
A.模式的一个具体值称为模式的-一个实例
B.模式是相对稳定的，而实例是相对变动的
C.实例反映的是数据的结构及其联系
D.模式反映的是数据库某- -时刻的状态
', '关于模式和实例之间的关系，以下描述不正确的是(  )A.模式的一个具体值称为模式的-一个实例B.模式是相对稳定的，而实例是相对变动的C.实例反映的是数据的结构及其联系D.模式反映的是数据库某- -时刻的状态
', '<p>关于模式和实例之间的关系，以下描述不正确的是(  )<br>A.模式的一个具体值称为模式的-一个实例<br>B.模式是相对稳定的，而实例是相对变动的<br>C.实例反映的是数据的结构及其联系<br>D.模式反映的是数据库某- -时刻的状态
', 'CD', 'CD
', '<p>CD</p>
', '2022-04-10 14:59:04', '2022-04-10 14:59:04', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (302, 2, 1, 2, 1, 14, '在概念结构设计阶段中，设计概念结构的方法有( )
A.自项向下
B.自底向上
C.逐步扩张
D.混合策略
', '在概念结构设计阶段中，设计概念结构的方法有( )A.自项向下B.自底向上C.逐步扩张D.混合策略
', '<p>在概念结构设计阶段中，设计概念结构的方法有( )<br>A.自项向下<br>B.自底向上<br>C.逐步扩张<br>D.混合策略
', 'ABCD', 'ABCD
', '<p>ABCD</p>
', '2022-04-10 14:59:34', '2022-04-10 14:59:34', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (303, 2, 1, 2, 2, 14, '事务是保证数据一-致性的基本手段，事务处理技术主要包括( )
A.数据库备份技术
B.数据库恢复技术
C.数据库安全技术
D.并发控制技术
', '事务是保证数据一-致性的基本手段，事务处理技术主要包括( )A.数据库备份技术B.数据库恢复技术C.数据库安全技术D.并发控制技术
', '<p>事务是保证数据一-致性的基本手段，事务处理技术主要包括( )<br>A.数据库备份技术<br>B.数据库恢复技术<br>C.数据库安全技术<br>D.并发控制技术
', 'BD', 'BD
', '<p>BD</p>
', '2022-04-10 15:00:10', '2022-04-10 15:00:10', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (304, 2, 1, 2, 2, 14, '数据库恢复设计的两个关键问题是(  )
A.如何解决数据库故障
B.如何执行并发控制
C.如何建立冗余数据
D.如何利用冗余数据进行数据库恢复
', '数据库恢复设计的两个关键问题是(  )A.如何解决数据库故障B.如何执行并发控制C.如何建立冗余数据D.如何利用冗余数据进行数据库恢复
', '<p>数据库恢复设计的两个关键问题是(  )<br>A.如何解决数据库故障<br>B.如何执行并发控制<br>C.如何建立冗余数据<br>D.如何利用冗余数据进行数据库恢复
', 'CD', 'CD
', '<p>CD</p>
', '2022-04-10 15:00:48', '2022-04-10 15:00:48', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (305, 2, 1, 2, 2, 14, '并发控制的主要技术是封锁，基本的封锁类型有( )
A.排它锁
B.意图锁
C.模式锁
D.共享锁
', '并发控制的主要技术是封锁，基本的封锁类型有( )A.排它锁B.意图锁C.模式锁D.共享锁
', '<p>并发控制的主要技术是封锁，基本的封锁类型有( )<br>A.排它锁<br>B.意图锁<br>C.模式锁<br>D.共享锁
', 'AD', 'AD
', '<p>AD</p>
', '2022-04-10 15:01:20', '2022-04-10 15:01:20', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (306, 2, 1, 2, 2, 14, '以下关于事务的说法，正确的是( )
A.事务是用户定义的一个操作序列，这些操作要么全做要么全不做，是一个不可分割的工
作单位
B.用户不能控制事务的开始与结束
C.事务通常是以BEGIN TRANSACTION开始，以COMMIT或ROLLBACK结束
D.事务具有ACID特性
', '以下关于事务的说法，正确的是( )A.事务是用户定义的一个操作序列，这些操作要么全做要么全不做，是一个不可分割的工作单位B.用户不能控制事务的开始与结束C.事务通常是以BEGIN TRANSACTION开始，以COMMIT或ROLLBACK结束D.事务具有ACID特性
', '<p>以下关于事务的说法，正确的是( )<br>A.事务是用户定义的一个操作序列，这些操作要么全做要么全不做，是一个不可分割的工<br>作单位<br>B.用户不能控制事务的开始与结束<br>C.事务通常是以BEGIN TRANSACTION开始，以COMMIT或ROLLBACK结束<br>D.事务具有ACID特性
', 'ACD', 'ACD
', '<p>ACD</p>
', '2022-04-10 15:01:50', '2022-04-10 15:01:50', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (307, 2, 1, 2, 2, 14, '以下关于介质故障恢复的描述正确的是( )
A.发生介质故障后，磁盘上的数据和日志文件都将被破坏
B.介质故障的恢复需要DBA的介入
C.可以通过多种方法从介质故障中恢复
D.介质故障恢复的具体步骤是:装入最新的DBA转储的数据库后备副本，然后装入相应
的日志文件副本，重做已经完成的事务
', '以下关于介质故障恢复的描述正确的是( )A.发生介质故障后，磁盘上的数据和日志文件都将被破坏B.介质故障的恢复需要DBA的介入C.可以通过多种方法从介质故障中恢复D.介质故障恢复的具体步骤是:装入最新的DBA转储的数据库后备副本，然后装入相应的日志文件副本，重做已经完成的事务
', '<p>以下关于介质故障恢复的描述正确的是( )<br>A.发生介质故障后，磁盘上的数据和日志文件都将被破坏<br>B.介质故障的恢复需要DBA的介入<br>C.可以通过多种方法从介质故障中恢复<br>D.介质故障恢复的具体步骤是:装入最新的DBA转储的数据库后备副本，然后装入相应<br>的日志文件副本，重做已经完成的事务
', 'ABD', 'ABD
', '<p>ABD</p>
', '2022-04-10 15:02:20', '2022-04-10 15:02:20', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (308, 2, 1, 2, 3, 14, 'SQL Server的安全身份验证模式决定了什么样的账户可以连接到服务器中，SQL Server 2008提供的身份验证模式有( )
A.Windows身份验证模式
B.SQL Server和Windows身份验证模式
C.仅SQL身份验证模式
D.加密身份验证模式', 'SQL Server的安全身份验证模式决定了什么样的账户可以连接到服务器中，SQL Server 2008提供的身份验证模式有( )A.Windows身份验证模式B.SQL Server和Windows身份验证模式C.仅SQL身份验证模式D.加密身份验证模式
', '<p>SQL Server的安全身份验证模式决定了什么样的账户可以连接到服务器中，SQL Server 2008提供的身份验证模式有( )<br>A.Windows身份验证模式<br>B.SQL Server和Windows身份验证模式<br>C.仅SQL身份验证模式<br>D.加密身份验证模式
', 'AB', 'AB
', '<p>AB</p>
', '2022-04-10 15:03:53', '2022-04-10 15:03:53', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (309, 2, 1, 2, 3, 14, '分离和附加数据库可以实现将数据库从一个服务移到另一个服务器上，但有些情况下不能进行分离数据库的操作。以下情况一定不能进行分离数据库的操作( )
A.Northwind数据库
B.Master数据库
C.用户正在使用的数据库
D.用户自己创建的benet数据库
', '分离和附加数据库可以实现将数据库从一个服务移到另一个服务器上，但有些情况下不能进行分离数据库的操作。以下情况一定不能进行分离数据库的操作( )A.Northwind数据库B.Master数据库C.用户正在使用的数据库D.用户自己创建的benet数据库
', '<p>分离和附加数据库可以实现将数据库从一个服务移到另一个服务器上，但有些情况下不能进行分离数据库的操作。以下情况一定不能进行分离数据库的操作( )<br>A.Northwind数据库<br>B.Master数据库<br>C.用户正在使用的数据库<br>D.用户自己创建的benet数据库
', 'BC', 'BC
', '<p>BC</p>
', '2022-04-10 15:04:47', '2022-04-10 15:04:47', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (310, 2, 1, 2, 3, 14, '在SQL SERVER中，声明并创建以下存储过程，正确调用该存储过程的的语句是( )
```sql
CREATE PROCEDURE PRO
@passNum int OUTPUT,
@passPoint int=60
AS
Select @passNum -count(*) From stuTable Where point >@passPoint
GO
```
A.Declare @sum int;EXEC PRO @passNum，70
B.Declare @sum int;EXEC PRO @sum output，70
C.Declare @sum int;EXEC PRO @sum output
D.EXEC PRO 70
', '在SQL SERVER中，声明并创建以下存储过程，正确调用该存储过程的的语句是( )
CREATE PROCEDURE PRO
@passNum int OUTPUT,
@passPoint int=60
AS
Select @passNum -count(*) From stuTable Where point &gt;@passPoint
GO

A.Declare @sum int;EXEC PRO @passNum，70B.Declare @sum int;EXEC PRO @sum output，70C.Declare @sum int;EXEC PRO @sum outputD.EXEC PRO 70
', '<p>在SQL SERVER中，声明并创建以下存储过程，正确调用该存储过程的的语句是( )</p>
<pre><code class="lang-sql">CREATE PROCEDURE PRO
@passNum int OUTPUT,
@passPoint int=60
AS
Select @passNum -count(*) From stuTable Where point &gt;@passPoint
GO
</code></pre>
<p>A.Declare <a href="https://github.com/sum" title="@sum" class="at-link">@sum</a> int;EXEC PRO <a href="https://github.com/passNum" title="@passNum" class="at-link">@passNum</a>，70<br>B.Declare <a href="https://github.com/sum" title="@sum" class="at-link">@sum</a> int;EXEC PRO <a href="https://github.com/sum" title="@sum" class="at-link">@sum</a> output，70<br>C.Declare <a href="https://github.com/sum" title="@sum" class="at-link">@sum</a> int;EXEC PRO <a href="https://github.com/sum" title="@sum" class="at-link">@sum</a> output<br>D.EXEC PRO 70
', 'BC', 'BC
', '<p>BC</p>
', '2022-04-10 15:06:13', '2022-04-10 15:06:13', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (311, 2, 1, 2, 3, 14, '数据库管理员希望对数据库进行性能优化，以下操作中行之有效的方法为( )
A.将数据库的数据库文件和日志文件分别放在不同的分区上
B.在数据库服务器上尽量不要安装其他无关服务
C.一个表中的数据行过多时，将其划分为两个或多个表
D.将数据库涉及到的所有文件单独放在-一个分区上供用户访问
', '数据库管理员希望对数据库进行性能优化，以下操作中行之有效的方法为( )A.将数据库的数据库文件和日志文件分别放在不同的分区上B.在数据库服务器上尽量不要安装其他无关服务C.一个表中的数据行过多时，将其划分为两个或多个表D.将数据库涉及到的所有文件单独放在-一个分区上供用户访问
', '<p>数据库管理员希望对数据库进行性能优化，以下操作中行之有效的方法为( )<br>A.将数据库的数据库文件和日志文件分别放在不同的分区上<br>B.在数据库服务器上尽量不要安装其他无关服务<br>C.一个表中的数据行过多时，将其划分为两个或多个表<br>D.将数据库涉及到的所有文件单独放在-一个分区上供用户访问
', 'AB', 'AB
', '<p>AB</p>
', '2022-04-10 15:07:14', '2022-04-10 15:07:14', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (312, 2, 1, 2, 3, 14, '某公司使用SQL Server 2000作为数据信息存储的平台，其中Sales数据库有-一个用于存放产品信息的表Products，其结构为
```sql
Products(*ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
```
现在销售部门的人员临时需要一张商 品价格表，要求列出所有产品的名称和其单价，并且以中文显示列名，那么下面SQL语句中可以满足条件的是( )
A.SELECT ProductName AS产品的名称"，UnitPrice AS ''单价'' FROM Products
B.SELECT ProductName=产品的名称, UnitPrice=单价FROM Products
C.SELECT ProductName=“产品的名称”，UnitPrice=“ 单价”FROM Products
D.SELECT ProductName产品的名称"，UnitPrice ''单价'' FROM Products
', '某公司使用SQL Server 2000作为数据信息存储的平台，其中Sales数据库有-一个用于存放产品信息的表Products，其结构为
Products(*ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)

现在销售部门的人员临时需要一张商 品价格表，要求列出所有产品的名称和其单价，并且以中文显示列名，那么下面SQL语句中可以满足条件的是( )A.SELECT ProductName AS产品的名称”，UnitPrice AS ‘单价’ FROM ProductsB.SELECT ProductName=产品的名称, UnitPrice=单价FROM ProductsC.SELECT ProductName=“产品的名称”，UnitPrice=“ 单价”FROM ProductsD.SELECT ProductName产品的名称”，UnitPrice ‘单价’ FROM Products
', '<p>某公司使用SQL Server 2000作为数据信息存储的平台，其中Sales数据库有-一个用于存放产品信息的表Products，其结构为</p>
<pre><code class="lang-sql">Products(*ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
</code></pre>
<p>现在销售部门的人员临时需要一张商 品价格表，要求列出所有产品的名称和其单价，并且以中文显示列名，那么下面SQL语句中可以满足条件的是( )<br>A.SELECT ProductName AS产品的名称”，UnitPrice AS ‘单价’ FROM Products<br>B.SELECT ProductName=产品的名称, UnitPrice=单价FROM Products<br>C.SELECT ProductName=“产品的名称”，UnitPrice=“ 单价”FROM Products<br>D.SELECT ProductName产品的名称”，UnitPrice ‘单价’ FROM Products
', 'AD', 'AD
', '<p>AD</p>
', '2022-04-10 15:10:31', '2022-04-10 15:10:31', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (313, 2, 1, 2, 3, 14, '管理员在执行以下sql语句时，发生了错误，你应该建议他如何修改( )
```sql
create database benet
use benet
create table benet01 (columnl int,column2 int)
```
A.分别执行每一句
B.将各个语句使用go分开再执行
C.不能将表格命名为benet01
D.不能将数据库命名为benet
', '管理员在执行以下sql语句时，发生了错误，你应该建议他如何修改( )
create database benet
use benet
create table benet01 (columnl int,column2 int)

A.分别执行每一句B.将各个语句使用go分开再执行C.不能将表格命名为benet01D.不能将数据库命名为benet
', '<p>管理员在执行以下sql语句时，发生了错误，你应该建议他如何修改( )</p>
<pre><code class="lang-sql">create database benet
use benet
create table benet01 (columnl int,column2 int)
</code></pre>
<p>A.分别执行每一句<br>B.将各个语句使用go分开再执行<br>C.不能将表格命名为benet01<br>D.不能将数据库命名为benet
', 'AB', 'AB
', '<p>AB</p>
', '2022-04-10 15:12:01', '2022-04-10 15:12:01', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (314, 2, 1, 2, 3, 14, '已知数据库的排序规则是默认设置。在northwind数据库中有一个表[order details]，表示所有定单的详情，该表中有一列 quantity,表示定单中某产品的数量。你想实现按照产品数量从小到大排序来查询定单，使用orderby子句为( )
A.Select * from [order details] Order by quantity desc
B.Select * from [order details] Order by quantity asc
C.Select * from [order details] Order by quantity
D.Select * from [order details] Order by desc quantity
', '已知数据库的排序规则是默认设置。在northwind数据库中有一个表[order details]，表示所有定单的详情，该表中有一列 quantity,表示定单中某产品的数量。你想实现按照产品数量从小到大排序来查询定单，使用orderby子句为( )A.Select  from [order details] Order by quantity descB.Select  from [order details] Order by quantity ascC.Select  from [order details] Order by quantityD.Select  from [order details] Order by desc quantity
', '<p>已知数据库的排序规则是默认设置。在northwind数据库中有一个表[order details]，表示所有定单的详情，该表中有一列 quantity,表示定单中某产品的数量。你想实现按照产品数量从小到大排序来查询定单，使用orderby子句为( )<br>A.Select <em> from [order details] Order by quantity desc<br>B.Select  from [order details] Order by quantity asc<br>C.Select <em> from [order details] Order by quantity<br>D.Select  from [order details] Order by desc quantity</p>
', 'BC', 'BC
', '<p>BC</p>
', '2022-04-10 15:13:03', '2022-04-10 15:13:03', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (315, 2, 1, 2, 3, 14, '在SQL SERVER中，下面关于子查询的说法你认为正确的是( )
A.应用简单子查询的SQL语句的执行效率比采用SQL变量的实现方案要低
B.带子查询的查询执行顺序是，先执行父查询，再执行子查询
C.表连接一般都可以用子查询替换，但有的子查询不能用表连接替换
D.如果一个子查询语句一次返回二个字段的值，那么父查询的where子句中应该使用[NOT] EXISTS关键字', '在SQL SERVER中，下面关于子查询的说法你认为正确的是( )A.应用简单子查询的SQL语句的执行效率比采用SQL变量的实现方案要低B.带子查询的查询执行顺序是，先执行父查询，再执行子查询C.表连接一般都可以用子查询替换，但有的子查询不能用表连接替换D.如果一个子查询语句一次返回二个字段的值，那么父查询的where子句中应该使用[NOT] EXISTS关键字
', '<p>在SQL SERVER中，下面关于子查询的说法你认为正确的是( )<br>A.应用简单子查询的SQL语句的执行效率比采用SQL变量的实现方案要低<br>B.带子查询的查询执行顺序是，先执行父查询，再执行子查询<br>C.表连接一般都可以用子查询替换，但有的子查询不能用表连接替换<br>D.如果一个子查询语句一次返回二个字段的值，那么父查询的where子句中应该使用[NOT] EXISTS关键字
', 'CD', 'CD
', '<p>CD</p>
', '2022-04-10 15:14:08', '2022-04-10 15:14:08', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (316, 2, 1, 2, 3, 14, '在关系数据库中存在的完整性规则有( )
A.实体完整性规则
B.索引完整性规则
C.引用完整性规则
D.用户定义的完整性规则', '在关系数据库中存在的完整性规则有( )A.实体完整性规则B.索引完整性规则C.引用完整性规则D.用户定义的完整性规则
', '<p>在关系数据库中存在的完整性规则有( )<br>A.实体完整性规则<br>B.索引完整性规则<br>C.引用完整性规则<br>D.用户定义的完整性规则
', 'ACD', 'ACD
', '<p>ACD</p>
', '2022-04-10 15:14:46', '2022-04-10 15:14:46', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (317, 2, 1, 2, 3, 14, '新建的数据库至少包含( )
A.主要数据文件
B.次要数据文件
C.日志文件
D.系统文件', '新建的数据库至少包含( )A.主要数据文件B.次要数据文件C.日志文件D.系统文件
', '<p>新建的数据库至少包含( )<br>A.主要数据文件<br>B.次要数据文件<br>C.日志文件<br>D.系统文件
', 'AC', 'AC
', '<p>AC</p>
', '2022-04-10 15:15:30', '2022-04-10 15:15:30', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (318, 2, 1, 2, 1, 14, 'SQL Server 2008支持的安装方式有( )
A.本地安装
B.远程安装
C.无人值守安装
D.nfs网络安装
', 'SQL Server 2008支持的安装方式有( )A.本地安装B.远程安装C.无人值守安装D.nfs网络安装
', '<p>SQL Server 2008支持的安装方式有( )<br>A.本地安装<br>B.远程安装<br>C.无人值守安装<br>D.nfs网络安装
', 'ABC', 'ABC
', '<p>ABC</p>
', '2022-04-10 15:21:10', '2022-04-10 15:21:10', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (319, 2, 1, 2, 1, 14, '下面对于关系数据库中表的主键描述正确的是( )
A.使用主键可以唯-地标识表中的一行数据
B.主键的值可以为空值
C.能唯一标识一行记录的列只有主键
D.在一个表中主键列的值是唯- -的
', '下面对于关系数据库中表的主键描述正确的是( )A.使用主键可以唯-地标识表中的一行数据B.主键的值可以为空值C.能唯一标识一行记录的列只有主键D.在一个表中主键列的值是唯- -的
', '<p>下面对于关系数据库中表的主键描述正确的是( )<br>A.使用主键可以唯-地标识表中的一行数据<br>B.主键的值可以为空值<br>C.能唯一标识一行记录的列只有主键<br>D.在一个表中主键列的值是唯- -的
', 'AD', 'AD
', '<p>AD</p>
', '2022-04-10 15:22:10', '2022-04-10 15:22:10', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (320, 2, 1, 2, 1, 14, '关于Truncate table,以下( )描述是错误的
A.Truncate table可跟Where从句，根据条件进行删除
B.Truncate table用来删除表中所有数据
C.触发器对Truncate table 无效
D.delete比Truncate table速度快
', '关于Truncate table,以下( )描述是错误的A.Truncate table可跟Where从句，根据条件进行删除B.Truncate table用来删除表中所有数据C.触发器对Truncate table 无效D.delete比Truncate table速度快
', '<p>关于Truncate table,以下( )描述是错误的<br>A.Truncate table可跟Where从句，根据条件进行删除<br>B.Truncate table用来删除表中所有数据<br>C.触发器对Truncate table 无效<br>D.delete比Truncate table速度快
', 'AD', 'AD
', '<p>AD</p>
', '2022-04-10 15:22:54', '2022-04-10 15:22:54', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (321, 2, 1, 2, 1, 14, '在SQL Server 数据库中，以下对变量的定义错误的是( )
A.DECLARE @usermame varchar(10)
B.DECLARE @RowCount varchar(30)
C.DECLARE @@usermname varchar(10)
D.DECLARE @@RowCount varchar(30)', '在SQL Server 数据库中，以下对变量的定义错误的是( )A.DECLARE @usermame varchar(10)B.DECLARE @RowCount varchar(30)C.DECLARE @@usermname varchar(10)D.DECLARE @@RowCount varchar(30)
', '<p>在SQL Server 数据库中，以下对变量的定义错误的是( )<br>A.DECLARE <a href="https://github.com/usermame" title="@usermame" class="at-link">@usermame</a> varchar(10)<br>B.DECLARE <a href="https://github.com/RowCount" title="@RowCount" class="at-link">@RowCount</a> varchar(30)<br>C.DECLARE @<a href="https://github.com/usermname" title="@usermname" class="at-link">@usermname</a> varchar(10)<br>D.DECLARE @<a href="https://github.com/RowCount" title="@RowCount" class="at-link">@RowCount</a> varchar(30)</p>
', 'CD', 'CD
', '<p>CD</p>
', '2022-04-10 15:23:34', '2022-04-10 15:23:34', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (322, 2, 1, 2, 1, 14, '下列关于SQL Server 2005数据库的分离和附加的说法，正确的是( )
A.数据库一旦被分离，数据文件就被删除了
B.数据库被分离后，数据文件还在，被分离的数据文件能且仅能被重新附加到原来与之分离的SQL Server实例上
C.数据库被分离后，数据文件还在，被分离的数据文件能被重新附加到其它的SQL Server 2005实例上
D.数据库附加时，要重新附加所有与数据库相关联的文件，而不仅仅是主文件', '下列关于SQL Server 2005数据库的分离和附加的说法，正确的是( )A.数据库一旦被分离，数据文件就被删除了B.数据库被分离后，数据文件还在，被分离的数据文件能且仅能被重新附加到原来与之分离的SQL Server实例上C.数据库被分离后，数据文件还在，被分离的数据文件能被重新附加到其它的SQL Server 2005实例上D.数据库附加时，要重新附加所有与数据库相关联的文件，而不仅仅是主文件
', '<p>下列关于SQL Server 2005数据库的分离和附加的说法，正确的是( )<br>A.数据库一旦被分离，数据文件就被删除了<br>B.数据库被分离后，数据文件还在，被分离的数据文件能且仅能被重新附加到原来与之分离的SQL Server实例上<br>C.数据库被分离后，数据文件还在，被分离的数据文件能被重新附加到其它的SQL Server 2005实例上<br>D.数据库附加时，要重新附加所有与数据库相关联的文件，而不仅仅是主文件
', 'CD', 'CD
', '<p>CD</p>
', '2022-04-10 15:24:36', '2022-04-10 15:24:36', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (323, 2, 1, 2, 2, 14, '以下关于SQL Server 2000中的视图和存储过程说法正确的是( )
A.存储过程可以比相同的T-SQL代码执行速度快
B.视图可以包含来自多个表中的列
C.视图中不包含任何存放在基表中的数据
D.存储过程中不能包含大量的T-SQL代码', '以下关于SQL Server 2000中的视图和存储过程说法正确的是( )A.存储过程可以比相同的T-SQL代码执行速度快B.视图可以包含来自多个表中的列C.视图中不包含任何存放在基表中的数据D.存储过程中不能包含大量的T-SQL代码
', '<p>以下关于SQL Server 2000中的视图和存储过程说法正确的是( )<br>A.存储过程可以比相同的T-SQL代码执行速度快<br>B.视图可以包含来自多个表中的列<br>C.视图中不包含任何存放在基表中的数据<br>D.存储过程中不能包含大量的T-SQL代码
', 'ABC', 'ABC
', '<p>ABC</p>
', '2022-04-10 15:25:17', '2022-04-10 15:25:17', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (324, 2, 1, 2, 2, 14, '在SQL Server 2008中无法在SSMS中进行“分离数据库”操作的有( ) 数据库
A.master
B.model
C.pubs
D.msdb
E.Northwind', '在SQL Server 2008中无法在SSMS中进行“分离数据库”操作的有( ) 数据库A.masterB.modelC.pubsD.msdbE.Northwind
', '<p>在SQL Server 2008中无法在SSMS中进行“分离数据库”操作的有( ) 数据库<br>A.master<br>B.model<br>C.pubs<br>D.msdb<br>E.Northwind
', 'ABD', 'ABD
', '<p>ABD</p>
', '2022-04-10 15:26:01', '2022-04-10 15:26:01', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (325, 2, 1, 2, 2, 14, 'SQLServer数据库管理员创建了一个数据库Benet，下列叙述正确的是( )
A.Benet数据库只能有一个主数据文件
B.Benet数据库可以有多个主数据文件
C.Benet数据库只能有一个事务日志文件
D.Benet数据库可以有多个事务日志文件', 'SQLServer数据库管理员创建了一个数据库Benet，下列叙述正确的是( )A.Benet数据库只能有一个主数据文件B.Benet数据库可以有多个主数据文件C.Benet数据库只能有一个事务日志文件D.Benet数据库可以有多个事务日志文件
', '<p>SQLServer数据库管理员创建了一个数据库Benet，下列叙述正确的是( )<br>A.Benet数据库只能有一个主数据文件<br>B.Benet数据库可以有多个主数据文件<br>C.Benet数据库只能有一个事务日志文件<br>D.Benet数据库可以有多个事务日志文件
', 'AD', 'AD
', '<p>AD</p>
', '2022-04-10 15:26:41', '2022-04-10 15:26:41', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (326, 2, 1, 2, 2, 14, 'Julv是BENET公司的数据库管理员，公司数据库采用SQL Server 2005，应公司业务需求，需要将一台服务器中的数据库BENET转移到公司新购置的数据库服务器上，下面( )方法可以帮助July完成此项任务。
A.通过SSMS导入导出工具
B.可以在原服务器上找到BENET数据库文件直接拷贝到新服务器中
C.在原服务器上对BENET进行分离，然后将相应的数据文件拷贝到新服务器上进行附加
D.以上三种方法均可实现数据库的迁移', 'Julv是BENET公司的数据库管理员，公司数据库采用SQL Server 2005，应公司业务需求，需要将一台服务器中的数据库BENET转移到公司新购置的数据库服务器上，下面( )方法可以帮助July完成此项任务。A.通过SSMS导入导出工具B.可以在原服务器上找到BENET数据库文件直接拷贝到新服务器中C.在原服务器上对BENET进行分离，然后将相应的数据文件拷贝到新服务器上进行附加D.以上三种方法均可实现数据库的迁移
', '<p>Julv是BENET公司的数据库管理员，公司数据库采用SQL Server 2005，应公司业务需求，需要将一台服务器中的数据库BENET转移到公司新购置的数据库服务器上，下面( )方法可以帮助July完成此项任务。<br>A.通过SSMS导入导出工具<br>B.可以在原服务器上找到BENET数据库文件直接拷贝到新服务器中<br>C.在原服务器上对BENET进行分离，然后将相应的数据文件拷贝到新服务器上进行附加<br>D.以上三种方法均可实现数据库的迁移
', 'AC', 'AC
', '<p>AC</p>
', '2022-04-10 15:27:42', '2022-04-10 15:27:42', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (327, 2, 1, 2, 2, 14, '学生成绩表grade中有字段score(float) ,现在要把所有在55分至60之间的分数提高5分，以下sql语句正确的是( )
A.Update grade set score- =score+5
B.Update grade set score= -score+5 where score>= -55 or score <=60
C.Update grade set score= =score+5 where score between 55 and 60
D.Update grade set score= =score+5 where score >= -55 and score <=60', '学生成绩表grade中有字段score(float) ,现在要把所有在55分至60之间的分数提高5分，以下sql语句正确的是( )A.Update grade set score- =score+5B.Update grade set score= -score+5 where score&gt;= -55 or score &lt;=60C.Update grade set score= =score+5 where score between 55 and 60D.Update grade set score= =score+5 where score >= -55 and score <=60
', '<p>学生成绩表grade中有字段score(float) ,现在要把所有在55分至60之间的分数提高5分，以下sql语句正确的是( )<br>A.Update grade set score- =score+5<br>B.Update grade set score= -score+5 where score&gt;= -55 or score &lt;=60<br>C.Update grade set score= =score+5 where score between 55 and 60<br>D.Update grade set score= =score+5 where score >= -55 and score <=60
', 'CD', 'CD
', '<p>CD</p>
', '2022-04-10 15:28:35', '2022-04-10 15:28:35', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (328, 2, 1, 2, 2, 14, '主键，超键，候选键的关系是( )
A.主键一定是超键，候选键不一定是超键
B.候选键一定是主键，候选键不一定是超键
C.超键不一定是主键，候选键一定是超键
D.主键一定是超键，候选键一定是超键', '主键，超键，候选键的关系是( )A.主键一定是超键，候选键不一定是超键B.候选键一定是主键，候选键不一定是超键C.超键不一定是主键，候选键一定是超键D.主键一定是超键，候选键一定是超键
', '<p>主键，超键，候选键的关系是( )<br>A.主键一定是超键，候选键不一定是超键<br>B.候选键一定是主键，候选键不一定是超键<br>C.超键不一定是主键，候选键一定是超键<br>D.主键一定是超键，候选键一定是超键
', 'CD', 'CD
', '<p>CD</p>
', '2022-04-10 15:29:22', '2022-04-10 15:29:22', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (329, 2, 1, 2, 2, 14, 'Northwind数据库中有一名为Producets的表用于存放所有产品的信息，其结构为Products(*PrductID,...UnitPrice,...)现在要想列出所有单价(UnitPrice)在20和40元之间的产品信息，则下列满足要求的SQL语句有( )
A.SELECT * FROM Products WHERE UnitPrice >= 20 OR UnitPrice <= 40
B.SELECT * FROM Products WHERE UnitPrice BETWEEN 20 OR 40
C.SELECT * FROM Products WHERE UnitPrice>= 20 AND UnitPrice <= 40
D.SELECT * FROM Products WHERE UnitPrice BETWEEN 20 AND 40 ;', 'Northwind数据库中有一名为Producets的表用于存放所有产品的信息，其结构为Products(PrductID,…UnitPrice,…)现在要想列出所有单价(UnitPrice)在20和40元之间的产品信息，则下列满足要求的SQL语句有( )A.SELECT  FROM Products WHERE UnitPrice &gt;= 20 OR UnitPrice &lt;= 40B.SELECT  FROM Products WHERE UnitPrice BETWEEN 20 OR 40C.SELECT  FROM Products WHERE UnitPrice&gt;= 20 AND UnitPrice &lt;= 40D.SELECT * FROM Products WHERE UnitPrice BETWEEN 20 AND 40 ;
', '<p>Northwind数据库中有一名为Producets的表用于存放所有产品的信息，其结构为Products(<em>PrductID,…UnitPrice,…)现在要想列出所有单价(UnitPrice)在20和40元之间的产品信息，则下列满足要求的SQL语句有( )<br>A.SELECT  FROM Products WHERE UnitPrice &gt;= 20 OR UnitPrice &lt;= 40<br>B.SELECT <em> FROM Products WHERE UnitPrice BETWEEN 20 OR 40<br>C.SELECT  FROM Products WHERE UnitPrice&gt;= 20 AND UnitPrice &lt;= 40<br>D.SELECT * FROM Products WHERE UnitPrice BETWEEN 20 AND 40 ;
', 'CD', 'CD
', '<p>CD</p>
', '2022-04-10 15:31:07', '2022-04-10 15:31:07', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (330, 4, 1, 7, 1, 14, '现有关系数据库如下:
学生(学号，姓名，性别，专业，奖学金)
课程(课程号，名称，学分)
学习(学号，课程号，分数)
用关系代数表达式实现下列1-4小题:
(1).检索"英语"专业学生所学课程的信息，包括学号、姓名、课程名和分数。

(2).检索"数据库原理"课程成绩高于90分的所有学生的学号、姓名、专业和分数。

(3).检索不学课程号为"C135"课程的学生信息，包括学号，姓名和专业。

(4).检索没有任何一门课程成绩不及格的所有学生的信息，包括学号、姓名和专业。
', '现有关系数据库如下:学生(学号，姓名，性别，专业，奖学金)课程(课程号，名称，学分)学习(学号，课程号，分数)用关系代数表达式实现下列1-4小题:(1).检索”英语”专业学生所学课程的信息，包括学号、姓名、课程名和分数。
(2).检索”数据库原理”课程成绩高于90分的所有学生的学号、姓名、专业和分数。
(3).检索不学课程号为”C135”课程的学生信息，包括学号，姓名和专业。
(4).检索没有任何一门课程成绩不及格的所有学生的信息，包括学号、姓名和专业。
', '<p>现有关系数据库如下:<br>学生(学号，姓名，性别，专业，奖学金)<br>课程(课程号，名称，学分)<br>学习(学号，课程号，分数)<br>用关系代数表达式实现下列1-4小题:<br>(1).检索”英语”专业学生所学课程的信息，包括学号、姓名、课程名和分数。
<p>(2).检索”数据库原理”课程成绩高于90分的所有学生的学号、姓名、专业和分数。</p>
<p>(3).检索不学课程号为”C135”课程的学生信息，包括学号，姓名和专业。</p>
<p>(4).检索没有任何一门课程成绩不及格的所有学生的信息，包括学号、姓名和专业。</p>
', '(1).
![1](/files/1649576134063.png)
(2).
![2](/files/1649576184854.png)
(3).
![3](/files/1649576215689.png)
(4).
![4](/files/1649576236316.png)', '(1).(2).(3).(4).
', '<p>(1).<br><img src="/files/1649576134063.png" alt="1"><br>(2).<br><img src="/files/1649576184854.png" alt="2"><br>(3).<br><img src="/files/1649576215689.png" alt="3"><br>(4).<br><img src="/files/1649576236316.png" alt="4">
', '2022-04-10 15:37:29', '2022-04-10 15:37:29', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (331, 4, 1, 7, 1, 14, '现有关系数据库如下:
学生(学号，姓名，性别，专业、奖学金)
课程(课程号，名称，学分)
学习(学号，课程号，分数)
用关系代数表达式实现下列1-4小题:
(1).检索“国际贸易”专业中获得奖学金的学生信息，包括学号、姓名、课程名和分数。

(2).检索学生成绩得过满分(100分)的课程的课程号、名称和学分。

(3).检索没有获得奖学金、同时至少有-门课程成绩在95分以上的学生信息，包括学号、姓名和专业。

(4).检索没有任何一门课程成绩在80 分以下的学生的信息，包括学号、姓名和专业。
', '现有关系数据库如下:学生(学号，姓名，性别，专业、奖学金)课程(课程号，名称，学分)学习(学号，课程号，分数)用关系代数表达式实现下列1-4小题:(1).检索“国际贸易”专业中获得奖学金的学生信息，包括学号、姓名、课程名和分数。
(2).检索学生成绩得过满分(100分)的课程的课程号、名称和学分。
(3).检索没有获得奖学金、同时至少有-门课程成绩在95分以上的学生信息，包括学号、姓名和专业。
(4).检索没有任何一门课程成绩在80 分以下的学生的信息，包括学号、姓名和专业。
', '<p>现有关系数据库如下:<br>学生(学号，姓名，性别，专业、奖学金)<br>课程(课程号，名称，学分)<br>学习(学号，课程号，分数)<br>用关系代数表达式实现下列1-4小题:<br>(1).检索“国际贸易”专业中获得奖学金的学生信息，包括学号、姓名、课程名和分数。
<p>(2).检索学生成绩得过满分(100分)的课程的课程号、名称和学分。</p>
<p>(3).检索没有获得奖学金、同时至少有-门课程成绩在95分以上的学生信息，包括学号、姓名和专业。</p>
<p>(4).检索没有任何一门课程成绩在80 分以下的学生的信息，包括学号、姓名和专业。</p>
', '(1).
![1](/files/1649576377427.png)
(2).
![2](/files/1649576393162.png)
(3).
![3](/files/1649576409316.png)
(4).
![4](/files/1649576429700.png)', '(1).(2).(3).(4).
', '<p>(1).<br><img src="/files/1649576377427.png" alt="1"><br>(2).<br><img src="/files/1649576393162.png" alt="2"><br>(3).<br><img src="/files/1649576409316.png" alt="3"><br>(4).<br><img src="/files/1649576429700.png" alt="4">
', '2022-04-10 15:40:40', '2022-04-10 15:40:40', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (332, 4, 1, 7, 1, 14, '表间关系:
Stu表里有学号(sno),姓名(sname),系(sdept),性别(ssex)
Ss表里有学号(sno)，书籍号(sjno)，借阅天数(jyts),书籍名(sjname)
Sj表里有书籍号(sjno),书籍名(sjname),借阅状态(state)
用关系代数表示以下内容:
(1).查询CS系得学生，列出学号。

(2).查询借阅《数据库》或者《艺术史》，并且超过天数30的男生的信息

(3).查询没有借阅《数据库》的学生，列出学号

(4).查询借阅过当前可借阅的全部图书(借阅状态为1)的学生的信息，列出学号
', '表间关系:Stu表里有学号(sno),姓名(sname),系(sdept),性别(ssex)Ss表里有学号(sno)，书籍号(sjno)，借阅天数(jyts),书籍名(sjname)Sj表里有书籍号(sjno),书籍名(sjname),借阅状态(state)用关系代数表示以下内容:(1).查询CS系得学生，列出学号。
(2).查询借阅《数据库》或者《艺术史》，并且超过天数30的男生的信息
(3).查询没有借阅《数据库》的学生，列出学号
(4).查询借阅过当前可借阅的全部图书(借阅状态为1)的学生的信息，列出学号
', '<p>表间关系:<br>Stu表里有学号(sno),姓名(sname),系(sdept),性别(ssex)<br>Ss表里有学号(sno)，书籍号(sjno)，借阅天数(jyts),书籍名(sjname)<br>Sj表里有书籍号(sjno),书籍名(sjname),借阅状态(state)<br>用关系代数表示以下内容:<br>(1).查询CS系得学生，列出学号。
<p>(2).查询借阅《数据库》或者《艺术史》，并且超过天数30的男生的信息</p>
<p>(3).查询没有借阅《数据库》的学生，列出学号</p>
<p>(4).查询借阅过当前可借阅的全部图书(借阅状态为1)的学生的信息，列出学号</p>
', '(1).
![1](/files/1649576643091.png)
(2).
![2](/files/1649576670257.png)
(3).
![3](/files/1649576693111.png)
(4).
![4](/files/1649576723040.png)', '(1).(2).(3).(4).
', '<p>(1).<br><img src="/files/1649576643091.png" alt="1"><br>(2).<br><img src="/files/1649576670257.png" alt="2"><br>(3).<br><img src="/files/1649576693111.png" alt="3"><br>(4).<br><img src="/files/1649576723040.png" alt="4">
', '2022-04-10 15:45:46', '2022-04-10 15:45:46', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (333, 4, 1, 7, 1, 14, '设教学数据库中有3个关系:
学生关系S(SNO, SNAME, AGE,SEX)
学习关系SC(SNO,CNO,GRADE)
课程关系C(CNO,CNAME,TEACHER)
下面用关系代数表达式表达每个查询语句。
(1).检索学习课程号为C2的学生学号与成绩

(2).检索学习课程号为C2的学生学号与姓名

(3).检索选修课程名为MATHS的学生学号与姓名

(4).检索选修课程号为C2或C4的学生学号
', '设教学数据库中有3个关系:学生关系S(SNO, SNAME, AGE,SEX)学习关系SC(SNO,CNO,GRADE)课程关系C(CNO,CNAME,TEACHER)下面用关系代数表达式表达每个查询语句。(1).检索学习课程号为C2的学生学号与成绩
(2).检索学习课程号为C2的学生学号与姓名
(3).检索选修课程名为MATHS的学生学号与姓名
(4).检索选修课程号为C2或C4的学生学号
', '<p>设教学数据库中有3个关系:<br>学生关系S(SNO, SNAME, AGE,SEX)<br>学习关系SC(SNO,CNO,GRADE)<br>课程关系C(CNO,CNAME,TEACHER)<br>下面用关系代数表达式表达每个查询语句。<br>(1).检索学习课程号为C2的学生学号与成绩
<p>(2).检索学习课程号为C2的学生学号与姓名</p>
<p>(3).检索选修课程名为MATHS的学生学号与姓名</p>
<p>(4).检索选修课程号为C2或C4的学生学号</p>
', '(1).
![1](/files/1649576879625.png)
(2).
![2](/files/1649576914501.png)
(3).
![3](/files/1649576963512.png)
(4).
![4](/files/1649576999232.png)', '(1).(2).(3).(4).
', '<p>(1).<br><img src="/files/1649576879625.png" alt="1"><br>(2).<br><img src="/files/1649576914501.png" alt="2"><br>(3).<br><img src="/files/1649576963512.png" alt="3"><br>(4).<br><img src="/files/1649576999232.png" alt="4">
', '2022-04-10 15:50:16', '2022-04-10 15:50:16', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (334, 4, 1, 7, 1, 14, '设教学数据库中有3个关系:
学生关系S(SNO, SNAME, AGE,SEX)
学习关系SC(SNO,CNO,GRADE)
课程关系C(CNO,CNAME,TEACHER)
下面用关系代数表达式表达每个查询语句。
(1).检索至少选修课程号为C2或C4的学生学号

(2).检索不学C2课的学生姓名与年龄

(3).检索学习全部课程的学生姓名

(4).检索所学课程包含S3所学课程的学生学号
', '设教学数据库中有3个关系:学生关系S(SNO, SNAME, AGE,SEX)学习关系SC(SNO,CNO,GRADE)课程关系C(CNO,CNAME,TEACHER)下面用关系代数表达式表达每个查询语句。(1).检索至少选修课程号为C2或C4的学生学号
(2).检索不学C2课的学生姓名与年龄
(3).检索学习全部课程的学生姓名
(4).检索所学课程包含S3所学课程的学生学号
', '<p>设教学数据库中有3个关系:<br>学生关系S(SNO, SNAME, AGE,SEX)<br>学习关系SC(SNO,CNO,GRADE)<br>课程关系C(CNO,CNAME,TEACHER)<br>下面用关系代数表达式表达每个查询语句。<br>(1).检索至少选修课程号为C2或C4的学生学号
<p>(2).检索不学C2课的学生姓名与年龄</p>
<p>(3).检索学习全部课程的学生姓名</p>
<p>(4).检索所学课程包含S3所学课程的学生学号</p>
', '(1).
![1](/files/1649577172219.png)
(2).
![2](/files/1649577213607.png)
(3).
![3](/files/1649577257960.png)
(4).
![4](/files/1649577305795.png)', '(1).(2).(3).(4).
', '<p>(1).<br><img src="/files/1649577172219.png" alt="1"><br>(2).<br><img src="/files/1649577213607.png" alt="2"><br>(3).<br><img src="/files/1649577257960.png" alt="3"><br>(4).<br><img src="/files/1649577305795.png" alt="4">
', '2022-04-10 15:55:17', '2022-04-10 15:55:17', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (335, 4, 1, 7, 2, 14, '设有如图所示的关系R、W和D,计算下列关系代数:
![0](/files/1649577405543.png)
![1](/files/1649577441137.png)
<br/>
![2](/files/1649577465893.png)
<br/>', '设有如图所示的关系R、W和D,计算下列关系代数:
', '<p>设有如图所示的关系R、W和D,计算下列关系代数:<br><img src="/files/1649577405543.png" alt="0"><br><img src="/files/1649577441137.png" alt="1"><br><br/><br><img src="/files/1649577465893.png" alt="2"><br><br>
', '(1).
![1](/files/1649577518011.png)
(2).
![2](/files/1649577539967.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649577518011.png" alt="1"><br>(2).<br><img src="/files/1649577539967.png" alt="2">
', '2022-04-10 15:59:14', '2022-04-10 15:59:14', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (336, 4, 1, 7, 2, 14, '设有如下关系:
学生(学号，姓名，性别，专业，出生日期)
教师(教师编号，姓名，所在部门，职称)
授课(教师编号，学号，课程编号，课程名称，教材，学分，成绩)
(1)查找学习“数据库原理”课程且成绩不及格的学生学号和任课教师编号

(2)查找学习“英语”课程的“计算机应用”专业学生的学号、姓名和成绩
', '设有如下关系:学生(学号，姓名，性别，专业，出生日期)教师(教师编号，姓名，所在部门，职称)授课(教师编号，学号，课程编号，课程名称，教材，学分，成绩)(1)查找学习“数据库原理”课程且成绩不及格的学生学号和任课教师编号
(2)查找学习“英语”课程的“计算机应用”专业学生的学号、姓名和成绩
', '<p>设有如下关系:<br>学生(学号，姓名，性别，专业，出生日期)<br>教师(教师编号，姓名，所在部门，职称)<br>授课(教师编号，学号，课程编号，课程名称，教材，学分，成绩)<br>(1)查找学习“数据库原理”课程且成绩不及格的学生学号和任课教师编号
<p>(2)查找学习“英语”课程的“计算机应用”专业学生的学号、姓名和成绩</p>
', '(1).
![1](/files/1649577681375.png)
(2).
![2](/files/1649577706558.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649577681375.png" alt="1"><br>(2).<br><img src="/files/1649577706558.png" alt="2">
', '2022-04-10 16:01:59', '2022-04-10 16:01:59', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (337, 4, 1, 7, 2, 14, '设有如下关系:
S(S#,SNAME,AGE,SEX) /*学生(学号，姓名，年龄，性别) */
C(C#,CNAME,TEACHER) /*课程(课程号，课程名，任课教师) */
SC(S#,C#,GRADE) /*成绩(学号，课程号，成绩) */
使用关系代数查询:
(1)教师“程军”所授课程的课程号和课程名;

(2)“李强”同学不学课程的课程号;
', '设有如下关系:S(S#,SNAME,AGE,SEX) /学生(学号，姓名，年龄，性别) /C(C#,CNAME,TEACHER) /课程(课程号，课程名，任课教师) /SC(S#,C#,GRADE) /成绩(学号，课程号，成绩) /使用关系代数查询:(1)教师“程军”所授课程的课程号和课程名;
(2)“李强”同学不学课程的课程号;
', '<p>设有如下关系:<br>S(S#,SNAME,AGE,SEX) /<em>学生(学号，姓名，年龄，性别) </em>/<br>C(C#,CNAME,TEACHER) /<em>课程(课程号，课程名，任课教师) </em>/<br>SC(S#,C#,GRADE) /<em>成绩(学号，课程号，成绩) </em>/<br>使用关系代数查询:<br>(1)教师“程军”所授课程的课程号和课程名;
<p>(2)“李强”同学不学课程的课程号;</p>
', '(1).
![1](/files/1649577805681.png)
(2).
![2](/files/1649577824151.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649577805681.png" alt="1"><br>(2).<br><img src="/files/1649577824151.png" alt="2">
', '2022-04-10 16:03:56', '2022-04-10 16:03:56', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (338, 4, 1, 7, 2, 14, '设有如下关系:
图书关系B(图书编号B#，图书名T，作者A，出版社P)
读者关系R(借书证号C#，读者名N，读者地址D);
借阅关系L(C#，B#，借书日期E，还书标志BZ)
BZ= ''1''表示已还; BZ= ''0'' 表示未还
使用关系代数查询:
(1) “工业出版社”出版的图书名

(2)查询99年12月31日以前借书未还的读者名与书名
', '设有如下关系:图书关系B(图书编号B#，图书名T，作者A，出版社P)读者关系R(借书证号C#，读者名N，读者地址D);借阅关系L(C#，B#，借书日期E，还书标志BZ)BZ= ‘1’表示已还; BZ= ‘0’ 表示未还使用关系代数查询:(1) “工业出版社”出版的图书名
(2)查询99年12月31日以前借书未还的读者名与书名
', '<p>设有如下关系:<br>图书关系B(图书编号B#，图书名T，作者A，出版社P)<br>读者关系R(借书证号C#，读者名N，读者地址D);<br>借阅关系L(C#，B#，借书日期E，还书标志BZ)<br>BZ= ‘1’表示已还; BZ= ‘0’ 表示未还<br>使用关系代数查询:<br>(1) “工业出版社”出版的图书名
<p>(2)查询99年12月31日以前借书未还的读者名与书名</p>
', '(1).
![1](/files/1649577922909.png)
(2).
![2](/files/1649577946159.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649577922909.png" alt="1"><br>(2).<br><img src="/files/1649577946159.png" alt="2">
', '2022-04-10 16:06:00', '2022-04-10 16:06:00', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (339, 4, 1, 7, 2, 14, '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:
![0](/files/1649578098877.png)
(1).检索“程军”老师所授课的课程号(C#)和课程名(CNAME)

(2).检索年龄大于21的男学生学号(S#)和姓名(SNAME)
', '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:(1).检索“程军”老师所授课的课程号(C#)和课程名(CNAME)
(2).检索年龄大于21的男学生学号(S#)和姓名(SNAME)
', '<p>设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:<br><img src="/files/1649578098877.png" alt="0"><br>(1).检索“程军”老师所授课的课程号(C#)和课程名(CNAME)
<p>(2).检索年龄大于21的男学生学号(S#)和姓名(SNAME)</p>
', '(1).
![1](/files/1649578178443.png)
(2).
![2](/files/1649578197005.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649578178443.png" alt="1"><br>(2).<br><img src="/files/1649578197005.png" alt="2">
', '2022-04-10 16:10:12', '2022-04-10 16:10:12', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (340, 4, 1, 7, 3, 14, '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:
![0](/files/1649578098877.png)
(1).检索至少选修“程军”老师所授全部课程的学生姓名(SNAME)

(2).检索“李强”同学不学课程的课程号(C#)', '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:(1).检索至少选修“程军”老师所授全部课程的学生姓名(SNAME)
(2).检索“李强”同学不学课程的课程号(C#)
', '<p>设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:<br><img src="/files/1649578098877.png" alt="0"><br>(1).检索至少选修“程军”老师所授全部课程的学生姓名(SNAME)
<p>(2).检索“李强”同学不学课程的课程号(C#)</p>
', '(1).
![1](/files/1649578297343.png)
(2).
![2](/files/1649578314249.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649578297343.png" alt="1"><br>(2).<br><img src="/files/1649578314249.png" alt="2">
', '2022-04-10 16:12:03', '2022-04-10 16:12:03', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (341, 4, 1, 7, 3, 14, '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:
![0](/files/1649578098877.png)
(1).检索至少选修两门课程的课程号(S#)

(2).检索全部学生都选修的课程的课程号(C#)和课程名(CNAME)
', '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:(1).检索至少选修两门课程的课程号(S#)
(2).检索全部学生都选修的课程的课程号(C#)和课程名(CNAME)
', '<p>设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:<br><img src="/files/1649578098877.png" alt="0"><br>(1).检索至少选修两门课程的课程号(S#)
<p>(2).检索全部学生都选修的课程的课程号(C#)和课程名(CNAME)</p>
', '(1).
![1](/files/1649578403121.png)
(2).
![2](/files/1649578409857.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649578403121.png" alt="1"><br>(2).<br><img src="/files/1649578409857.png" alt="2">
', '2022-04-10 16:13:54', '2022-04-10 16:13:54', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (342, 4, 1, 7, 3, 14, '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:
![0](/files/1649578098877.png)
(1).检索选修课程包含”程军”老师所授课程之一的学生学号(S#)

(2).检索选修课程号为k1和k5的学生学号(S#)
', '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:(1).检索选修课程包含”程军”老师所授课程之一的学生学号(S#)
(2).检索选修课程号为k1和k5的学生学号(S#)
', '<p>设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:<br><img src="/files/1649578098877.png" alt="0"><br>(1).检索选修课程包含”程军”老师所授课程之一的学生学号(S#)
<p>(2).检索选修课程号为k1和k5的学生学号(S#)</p>
', '(1).
![1](/files/1649578522995.png)
(2).
![2](/files/1649578529975.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649578522995.png" alt="1"><br>(2).<br><img src="/files/1649578529975.png" alt="2">
', '2022-04-10 16:15:40', '2022-04-10 16:15:40', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (343, 4, 1, 7, 3, 14, '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:
![0](/files/1649578098877.png)
(1).检索选修全部课程的学生姓名(SNAME)

(2).检索选修课程包含学号为2的学生所选修课程的学生学号(S#)
', '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:(1).检索选修全部课程的学生姓名(SNAME)
(2).检索选修课程包含学号为2的学生所选修课程的学生学号(S#)
', '<p>设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:<br><img src="/files/1649578098877.png" alt="0"><br>(1).检索选修全部课程的学生姓名(SNAME)
<p>(2).检索选修课程包含学号为2的学生所选修课程的学生学号(S#)</p>
', '(1).
![1](/files/1649578617036.png)
(2).
![2](/files/1649578635001.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649578617036.png" alt="1"><br>(2).<br><img src="/files/1649578635001.png" alt="2">
', '2022-04-10 16:17:32', '2022-04-10 16:17:32', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (344, 4, 1, 7, 3, 14, '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:
![0](/files/1649578098877.png)
(1).检索选修课程名为“C语言”的学生学号(S#)和姓名(SNAME)

(2).检索没有一门课程成绩不及格的学生学号，姓名
', '设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:(1).检索选修课程名为“C语言”的学生学号(S#)和姓名(SNAME)
(2).检索没有一门课程成绩不及格的学生学号，姓名
', '<p>设有如图所示的关系S、SC和C,试用关系代数表达式表示下列查询语句:<br><img src="/files/1649578098877.png" alt="0"><br>(1).检索选修课程名为“C语言”的学生学号(S#)和姓名(SNAME)
<p>(2).检索没有一门课程成绩不及格的学生学号，姓名</p>
', '(1).
![1](/files/1649578746775.png)
(2).
![2](/files/1649578758526.png)', '(1).(2).
', '<p>(1).<br><img src="/files/1649578746775.png" alt="1"><br>(2).<br><img src="/files/1649578758526.png" alt="2">
', '2022-04-10 16:19:28', '2022-04-10 16:19:28', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (345, 2, 1, 8, 1, 14, '选择部门30中的所有员工', '选择部门30中的所有员工
', '<p>选择部门30中的所有员工</p>
', 'select * from emp where deptno = 30;', 'select * from emp where deptno = 30;
', '<p>select * from emp where deptno = 30;</p>
', '2022-04-10 19:25:29', '2022-04-10 19:25:29', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (346, 2, 1, 8, 1, 14, '列出所有办事员(CLERK)的姓名，编号和部门编号', '列出所有办事员(CLERK)的姓名，编号和部门编号
', '<p>列出所有办事员(CLERK)的姓名，编号和部门编号</p>
', 'select empno,ename,deptno from emp where job=''CLERK'';', 'select empno,ename,deptno from emp where job=’CLERK’;
', '<p>select empno,ename,deptno from emp where job=’CLERK’;</p>
', '2022-04-10 19:25:52', '2022-04-10 19:25:52', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (347, 2, 1, 8, 1, 14, '找出奖金高于薪金的员工', '找出奖金高于薪金的员工
', '<p>找出奖金高于薪金的员工</p>
', 'select * from emp where comm>sal;', 'select * from emp where comm&gt;sal;
', '<p>select * from emp where comm&gt;sal;</p>
', '2022-04-10 19:26:09', '2022-04-10 19:26:09', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (348, 2, 1, 8, 1, 14, '找出奖金高于薪金的60%的员工', '找出奖金高于薪金的60%的员工
', '<p>找出奖金高于薪金的60%的员工</p>
', 'select * from emp where comm > (sal * 0.6);', 'select  from emp where comm &gt; (sal  0.6);
', '<p>select <em> from emp where comm &gt; (sal </em> 0.6);</p>
', '2022-04-10 19:26:44', '2022-04-10 19:26:44', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (349, 2, 1, 8, 1, 14, '找出部门10中的所有经理(MANAGER)和部门20中所有的办事员(CLERK)的详细资料', '找出部门10中的所有经理(MANAGER)和部门20中所有的办事员(CLERK)的详细资料
', '<p>找出部门10中的所有经理(MANAGER)和部门20中所有的办事员(CLERK)的详细资料</p>
', 'select * from emp where (deptno=10 and job=''MANAGER'') or (deptno=20 and job=''CLERK'');', 'select * from emp where (deptno=10 and job=’MANAGER’) or (deptno=20 and job=’CLERK’);
', '<p>select * from emp where (deptno=10 and job=’MANAGER’) or (deptno=20 and job=’CLERK’);</p>
', '2022-04-10 19:27:18', '2022-04-10 19:27:18', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (350, 2, 1, 8, 1, 14, '找出部门10中所有的经理(MANAGER),部门20中所有办事员(CLERK),既不是经理又不是办事员但其薪金大于或等于2000的所有员工的详细资料', '找出部门10中所有的经理(MANAGER),部门20中所有办事员(CLERK),既不是经理又不是办事员但其薪金大于或等于2000的所有员工的详细资料
', '<p>找出部门10中所有的经理(MANAGER),部门20中所有办事员(CLERK),既不是经理又不是办事员但其薪金大于或等于2000的所有员工的详细资料</p>
', 'select * from emp
where (deptno=10 and job=''MANAGER'')
or (deptno=20 and job=''CLERK'')
or ((Job!=''MANAGER'' and job!=''CLERK'') and sal > =2000);
', 'select * from empwhere (deptno=10 and job=’MANAGER’)or (deptno=20 and job=’CLERK’)or ((Job!=’MANAGER’ and job!=’CLERK’) and sal > =2000);
', '<p>select * from emp<br>where (deptno=10 and job=’MANAGER’)<br>or (deptno=20 and job=’CLERK’)<br>or ((Job!=’MANAGER’ and job!=’CLERK’) and sal > =2000);
', '2022-04-10 19:27:51', '2022-04-10 19:27:51', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (351, 2, 1, 8, 1, 14, '找出收取奖金的员工的不同工作', '找出收取奖金的员工的不同工作
', '<p>找出收取奖金的员工的不同工作</p>
', 'select job from emp where comm is not null;', 'select job from emp where comm is not null;
', '<p>select job from emp where comm is not null;</p>
', '2022-04-10 19:28:19', '2022-04-10 19:28:19', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (352, 2, 1, 8, 1, 14, '找出不收取奖金或者收取的奖金低于100的员工', '找出不收取奖金或者收取的奖金低于100的员工
', '<p>找出不收取奖金或者收取的奖金低于100的员工</p>
', 'select * from emp where comm is null or comm <100;', 'select * from emp where comm is null or comm &lt;100;
', '<p>select * from emp where comm is null or comm &lt;100;</p>
', '2022-04-10 19:29:03', '2022-04-10 19:29:03', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (353, 2, 1, 8, 1, 14, '找出各月倒数第三天受雇的所有员工', '找出各月倒数第三天受雇的所有员工
', '<p>找出各月倒数第三天受雇的所有员工</p>
', 'select * from emp where ((to_char(last_day(hiredate),''  dd'') - to_char(hiredate,''  dd'')) =2);', 'select * from emp where ((to_char(last_day(hiredate),’  dd’) - to_char(hiredate,’  dd’)) =2);
', '<p>select * from emp where ((to_char(last_day(hiredate),’  dd’) - to_char(hiredate,’  dd’)) =2);</p>
', '2022-04-10 19:31:12', '2022-04-10 19:31:12', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (354, 2, 1, 8, 1, 14, '找出早于十三年前受雇的员工', '找出早于十三年前受雇的员工
', '<p>找出早于十三年前受雇的员工</p>
', 'select * from emp where (to_char(sysdate,'' yyyy'') - to_char(hiredate,''yyyy'')) > 13 ;', 'select * from emp where (to_char(sysdate,’ yyyy’) - to_char(hiredate,’yyyy’)) &gt; 13 ;
', '<p>select * from emp where (to_char(sysdate,’ yyyy’) - to_char(hiredate,’yyyy’)) &gt; 13 ;</p>
', '2022-04-10 19:34:13', '2022-04-10 19:34:13', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (355, 2, 1, 8, 2, 14, '以首字母大写的方式显示所有员工的姓名；', '以首字母大写的方式显示所有员工的姓名；
', '<p>以首字母大写的方式显示所有员工的姓名；</p>
', 'select initcap(ename) from emp;', 'select initcap(ename) from emp;
', '<p>select initcap(ename) from emp;</p>
', '2022-04-10 19:34:37', '2022-04-10 19:34:37', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (356, 2, 1, 8, 2, 14, '显示正好为5个字符的员工的姓名', '显示正好为5个字符的员工的姓名
', '<p>显示正好为5个字符的员工的姓名</p>
', 'select ename from emp where length(ename)=5;', 'select ename from emp where length(ename)=5;
', '<p>select ename from emp where length(ename)=5;</p>
', '2022-04-10 19:35:08', '2022-04-10 19:35:08', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (357, 2, 1, 8, 2, 14, '显示不带有“R”的员工姓名', '显示不带有“R”的员工姓名
', '<p>显示不带有“R”的员工姓名</p>
', 'select ename from emp where ename not like ''%R%'';', 'select ename from emp where ename not like ‘%R%’;
', '<p>select ename from emp where ename not like ‘%R%’;</p>
', '2022-04-10 19:35:29', '2022-04-10 19:35:29', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (358, 2, 1, 8, 2, 14, '显示所有员工姓名的前三个字符', '显示所有员工姓名的前三个字符
', '<p>显示所有员工姓名的前三个字符</p>
', 'select ename,substr(ename,1,3) from emp;', 'select ename,substr(ename,1,3) from emp;
', '<p>select ename,substr(ename,1,3) from emp;</p>
', '2022-04-10 19:35:52', '2022-04-10 19:35:52', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (359, 2, 1, 8, 2, 14, '显示所有员工的姓名，用“a”替换所有的“A”', '显示所有员工的姓名，用“a”替换所有的“A”
', '<p>显示所有员工的姓名，用“a”替换所有的“A”</p>
', 'select replace(ename,''A'',''a'') from emp;', 'select replace(ename,’A’,’a’) from emp;
', '<p>select replace(ename,’A’,’a’) from emp;</p>
', '2022-04-10 19:36:11', '2022-04-10 19:36:11', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (360, 2, 1, 8, 2, 14, '显示员工的详细资料，按姓名排序', '显示员工的详细资料，按姓名排序
', '<p>显示员工的详细资料，按姓名排序</p>
', 'select * from emp order by ename;', 'select * from emp order by ename;
', '<p>select * from emp order by ename;</p>
', '2022-04-10 19:36:37', '2022-04-10 19:36:37', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (361, 2, 1, 8, 2, 14, '显示员工的姓名和受雇日期，根据其服务年限，将最老的员工排在最前面', '显示员工的姓名和受雇日期，根据其服务年限，将最老的员工排在最前面
', '<p>显示员工的姓名和受雇日期，根据其服务年限，将最老的员工排在最前面</p>
', 'select ename,hiredate from emp order by hiredate asc;', 'select ename,hiredate from emp order by hiredate asc;
', '<p>select ename,hiredate from emp order by hiredate asc;</p>
', '2022-04-10 19:36:57', '2022-04-10 19:36:57', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (362, 2, 1, 8, 2, 14, '显示所有员工的姓名、工作和薪金，按工作的降序排序，若工作相同则按薪金排序', '显示所有员工的姓名、工作和薪金，按工作的降序排序，若工作相同则按薪金排序
', '<p>显示所有员工的姓名、工作和薪金，按工作的降序排序，若工作相同则按薪金排序</p>
', 'select ename,job,sal from emp order by job desc,sal asc;', 'select ename,job,sal from emp order by job desc,sal asc;
', '<p>select ename,job,sal from emp order by job desc,sal asc;</p>
', '2022-04-10 19:37:23', '2022-04-10 19:37:23', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (363, 2, 1, 8, 2, 14, '显示所有员工姓名、加入公司的年份和月份，按受雇日期所在月排序，若月份相同则将最早年份的员工排在最前面', '显示所有员工姓名、加入公司的年份和月份，按受雇日期所在月排序，若月份相同则将最早年份的员工排在最前面
', '<p>显示所有员工姓名、加入公司的年份和月份，按受雇日期所在月排序，若月份相同则将最早年份的员工排在最前面</p>
', 'select  ename,to_char(hiredate,''yyyy'') year,to_char(hiredate,''   mm'') month from emp order by month,year asc;', 'select  ename,to_char(hiredate,’yyyy’) year,to_char(hiredate,’   mm’) month from emp order by month,year asc;
', '<p>select  ename,to_char(hiredate,’yyyy’) year,to_char(hiredate,’   mm’) month from emp order by month,year asc;</p>
', '2022-04-10 19:37:59', '2022-04-10 19:37:59', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (364, 2, 1, 8, 3, 14, '显示在一个月为30天的情况所有员工的日薪金，忽略余数', '显示在一个月为30天的情况所有员工的日薪金，忽略余数
', '<p>显示在一个月为30天的情况所有员工的日薪金，忽略余数</p>
', 'select ename,trunc(sal/30)day_sal from emp;', 'select ename,trunc(sal/30)day_sal from emp;
', '<p>select ename,trunc(sal/30)day_sal from emp;</p>
', '2022-04-10 19:38:20', '2022-04-10 19:38:20', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (365, 2, 1, 8, 3, 14, '找出(任何年份的)2月受聘的所有员工', '找出(任何年份的)2月受聘的所有员工
', '<p>找出(任何年份的)2月受聘的所有员工</p>
', 'select * from emp where ((to_char(hiredate,'' mm'') -02)=00);', 'select * from emp where ((to_char(hiredate,’ mm’) -02)=00);
', '<p>select * from emp where ((to_char(hiredate,’ mm’) -02)=00);</p>
', '2022-04-10 19:38:53', '2022-04-10 19:38:53', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (366, 2, 1, 8, 3, 14, '对于每个员工，显示其加入公司的天数', '对于每个员工，显示其加入公司的天数
', '<p>对于每个员工，显示其加入公司的天数</p>
', 'select ename,hiredate,sysdate-hiredate from emp;', 'select ename,hiredate,sysdate-hiredate from emp;
', '<p>select ename,hiredate,sysdate-hiredate from emp;</p>
', '2022-04-10 19:39:18', '2022-04-10 19:39:18', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (367, 2, 1, 8, 3, 14, '显示姓名字段的任何位置包含“A”的所有员工的姓名', '显示姓名字段的任何位置包含“A”的所有员工的姓名
', '<p>显示姓名字段的任何位置包含“A”的所有员工的姓名</p>
', 'select ename from emp where ename like ''%A%'';', 'select ename from emp where ename like ‘%A%’;
', '<p>select ename from emp where ename like ‘%A%’;</p>
', '2022-04-10 19:39:37', '2022-04-10 19:39:37', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (368, 2, 1, 8, 3, 14, '以年月日的方式显示所有员工的服务年限', '以年月日的方式显示所有员工的服务年限
', '<p>以年月日的方式显示所有员工的服务年限</p>
', 'select ename,hiredate,
trunc(months_between(sysdate,hiredate)/12)year,            trunc(mod(months_between(sysdate,hiredate),12))month,
trunc(sysdate-add_months(hiredate,months_between(sysdate,hiredate))) day
from emp;', 'select ename,hiredate,trunc(months_between(sysdate,hiredate)/12)year,            trunc(mod(months_between(sysdate,hiredate),12))month,trunc(sysdate-add_months(hiredate,months_between(sysdate,hiredate))) dayfrom emp;
', '<p>select ename,hiredate,<br>trunc(months_between(sysdate,hiredate)/12)year,            trunc(mod(months_between(sysdate,hiredate),12))month,<br>trunc(sysdate-add_months(hiredate,months_between(sysdate,hiredate))) day<br>from emp;
', '2022-04-10 19:41:39', '2022-04-10 19:41:39', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (369, 2, 1, 8, 2, 14, '查询每个学生的学号，姓名，所修课程及成绩', '查询每个学生的学号，姓名，所修课程及成绩
', '<p>查询每个学生的学号，姓名，所修课程及成绩</p>
', 'select * from student st join sc s on st.sno=s.sno join course co on co.cno=s.cno;', 'select * from student st join sc s on st.sno=s.sno join course co on co.cno=s.cno;
', '<p>select * from student st join sc s on st.sno=s.sno join course co on co.cno=s.cno;</p>
', '2022-04-10 19:43:43', '2022-04-10 19:43:43', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (370, 2, 1, 8, 3, 14, '查询学过编号为1或2的课程的同学的学号、姓名', '查询学过编号为1或2的课程的同学的学号、姓名
', '<p>查询学过编号为1或2的课程的同学的学号、姓名</p>
', 'select * from student where sno in (select sno from course where cno=2 or cno=1);', 'select * from student where sno in (select sno from course where cno=2 or cno=1);
', '<p>select * from student where sno in (select sno from course where cno=2 or cno=1);</p>
', '2022-04-10 19:44:33', '2022-04-10 19:44:33', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (371, 2, 1, 8, 3, 14, '将课程号为2的授课老师改为“张三”', '将课程号为2的授课老师改为“张三”
', '<p>将课程号为2的授课老师改为“张三”</p>
', 'update course set tno=(select tno  from teacher where tname=''张三'') where cno=4;', 'update course set tno=(select tno  from teacher where tname=’张三’) where cno=4;
', '<p>update course set tno=(select tno  from teacher where tname=’张三’) where cno=4;</p>
', '2022-04-10 19:44:59', '2022-04-10 19:44:59', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (372, 2, 1, 8, 3, 14, '删除“002”同学的“001”课程的成绩', '删除“002”同学的“001”课程的成绩
', '<p>删除“002”同学的“001”课程的成绩</p>
', 'delete from sc where sno=2 and cno=1;', 'delete from sc where sno=2 and cno=1;
', '<p>delete from sc where sno=2 and cno=1;</p>
', '2022-04-10 19:45:35', '2022-04-10 19:45:35', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (373, 2, 1, 8, 3, 14, '查询不及格的课程，并按课程号从大到小排列', '查询不及格的课程，并按课程号从大到小排列
', '<p>查询不及格的课程，并按课程号从大到小排列</p>
', 'select score , cno  from  sc where score < 60 order by cno desc;', 'select score , cno  from  sc where score &lt; 60 order by cno desc;
', '<p>select score , cno  from  sc where score &lt; 60 order by cno desc;</p>
', '2022-04-10 19:46:09', '2022-04-10 19:46:09', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (374, 2, 1, 8, 3, 14, '查询两门以上不及格课程的同学的学号及其平均成绩', '查询两门以上不及格课程的同学的学号及其平均成绩
', '<p>查询两门以上不及格课程的同学的学号及其平均成绩</p>
', 'select sno, avg(score) from sc where score < 60  group by sno having count(sno) > =2;', 'select sno, avg(score) from sc where score &lt; 60  group by sno having count(sno) &gt; =2;
', '<p>select sno, avg(score) from sc where score &lt; 60  group by sno having count(sno) &gt; =2;</p>
', '2022-04-10 19:46:58', '2022-04-10 19:46:58', 0);
INSERT INTO tpcs.question_info (ID, SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT, QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML, GMT_CREATE, GMT_MODIFIED, REMOVED) VALUES (375, 2, 1, 8, 3, 14, '查询姓“李”的老师的姓名及授课情况', '查询姓“李”的老师的姓名及授课情况
', '<p>查询姓“李”的老师的姓名及授课情况</p>
', 'select * from teacher t join course c on t.tno=c.tno where tname like ''张%'';', 'select * from teacher t join course c on t.tno=c.tno where tname like ‘张%’;
', '<p>select * from teacher t join course c on t.tno=c.tno where tname like ‘张%’;</p>
', '2022-04-10 19:47:19', '2022-04-10 19:47:19', 0);