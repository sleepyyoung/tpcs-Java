package tpcs.dao;

import org.apache.ibatis.annotations.*;
import tpcs.pojo.*;

import java.util.List;

@Mapper
public interface QuestionGarbageMapper {
    /** 获取回收站题目列表 */
    List<Question> questionGarbageListSimple();

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

    /** 彻底删除题目 */
    @Delete("DELETE FROM question_info WHERE ID = #{id}")
    Integer deleteQuestionById(Integer id);

    /** 批量彻底删除题目 */
    Integer batchDeleteQuestion(List<Integer> ids);

    /** 恢复题目 */
    @Update("UPDATE question_info SET REMOVED = 0 where ID = #{id}")
    Integer recoverQuestionById(Integer id);

    /** 批量恢复题目 */
    Integer batchRecoverQuestion(List<Integer> ids);
}
