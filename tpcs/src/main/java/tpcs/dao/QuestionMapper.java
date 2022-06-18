package tpcs.dao;

import org.apache.ibatis.annotations.*;
import tpcs.pojo.*;

import java.util.List;

@Mapper
public interface QuestionMapper {
    List<Question> questionList();

    /** 获取题目列表 */
    List<Question> questionListSimple();

    /** 获取题库题型数据 */
    List<QuestionBankType> questionBankTypeList(Integer id);

    /** 根据分值查询题目 */
    List<Question> queryByScore(Double score, Double min, Double max);

    /** 根据题型查询题目 */
    List<Question> queryByType(Integer type);

    /** 根据难度查询题目 */
    List<Question> queryByDifficulty(Integer difficulty);

    /** 根据所属课程查询题目 */
    List<Question> queryByCourse(Integer course);

    /** 根据题目内容查询题目 */
    List<Question> queryByQuestionContent(String content);

    /** 根据答案内容查询题目 */
    List<Question> queryByAnswerContent(String content);

    /** 综合所有条件查询题目 */
    List<Question> queryByAnything(@Param("score") Double score,
                                   @Param("min") Double min,
                                   @Param("max") Double max,
                                   @Param("type") Integer type,
                                   @Param("difficulty") Integer difficulty,
                                   @Param("course") Integer course,
                                   @Param("questionContent") String questionContent,
                                   @Param("answerContent") String answerContent);

    /** 根据所属用户id查询题目 */
    List<Question> queryByUserId(Integer userId);

    /** 通过id获取题目 */
    Question getQuestionById(Integer id);

    /** 添加题目 */
    @Insert(" INSERT INTO question_info (SCORE, USER_ID, TYPE_ID, DIFFICULTY_ID, COURSE_ID, QUESTION_MD, QUESTION_TXT," +
            "                              QUESTION_HTML, ANSWER_MD, ANSWER_TXT, ANSWER_HTML)" +
            " VALUES (#{score}, #{user}, #{type}, #{difficulty}, #{course}, #{questionMd}, #{questionTxt}," +
            "         #{questionHtml}, #{answerMd}, #{answerTxt}, #{answerHtml})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    Boolean addQuestion(SimplifyQuestion question);

    /** 修改题目 */
    @Update(" UPDATE question_info" +
            " SET SCORE                 =#{score}," +
            "     USER_ID               = #{user}," +
            "     TYPE_ID               = #{type}," +
            "     DIFFICULTY_ID         = #{difficulty}," +
            "     COURSE_ID             = #{course}," +
            "     QUESTION_MD           = #{questionMd}," +
            "     QUESTION_TXT          = #{questionTxt}," +
            "     QUESTION_HTML         = #{questionHtml}," +
            "     ANSWER_MD             = #{answerMd}," +
            "     ANSWER_TXT            = #{answerTxt}," +
            "     ANSWER_HTML           = #{answerHtml}" +
            " WHERE ID = #{id}")
    Integer updateQuestion(SimplifyQuestion question);

    /** 逻辑删除题目（移动到回收站） */
    @Update("UPDATE question_info SET REMOVED = 1 where ID = #{id}")
    Integer removeQuestion2Garbage(Integer id);

    /** 批量逻辑删除题目（移动到回收站） */
    Integer batchRemoveQuestion2Garbage(List<Integer> ids);

    /** 获取题型列表 */
    @Select("select ID, NAME from question_type_info order by ID")
    List<QuestionType> questionTypeList();

    /** 获取分值列表 */
    @Select("select distinct SCORE from question_info where REMOVED = 0 order by SCORE")
    List<Double> scoreList();

    /** 通过课程、题型和分值获取题目数量 */
    Integer getQuestionCountByCourseIdAndQuestionTypeAndScoreAndDifficulty(Integer courseId,Integer typeId, Double score,Integer difficultyId);

    /** 根据id获取题型 */
    @Select("select ID, NAME from question_type_info where ID = #{id}")
    QuestionType getQuestionTypeById(int id);

    /** 根据name获取题型 */
    @Select("select ID, NAME from question_type_info where NAME = #{name}")
    QuestionType getQuestionTypeByName(String name);

    /** 添加题型 */
    @Insert("insert into question_type_info(NAME) value (#{name})")
    Boolean addQuestionType(String name);

    /** 获取题目难度列表 */
    @Select("select ID, NAME from question_difficulty_info order by ID")
    List<QuestionDifficulty> questionDifficultyList();

    /** 根据题目难度Id获取题目难度 */
    @Select("select ID, NAME from question_difficulty_info where ID = #{id}")
    QuestionDifficulty getQuestionDifficultyById(Integer id);
}
