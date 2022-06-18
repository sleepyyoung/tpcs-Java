package tpcs.service;

import com.github.pagehelper.PageInfo;
import tpcs.pojo.*;

import java.util.List;

public interface IQuestionGarbageService {
    /** 获取回收站题目列表 */
    PageInfo<Question> questionGarbageListSimple(Integer pageNum, Integer pageSize);

    /** 根据分值查询题目 */
    PageInfo<Question> queryByScore(Double score, Integer pageNum, Integer pageSize);

    PageInfo<Question> queryByScore(Double min, Double max, Integer pageNum, Integer pageSize);

    /** 根据题型查询题目 */
    PageInfo<Question> queryByType(Integer type, Integer pageNum, Integer pageSize);

    /** 根据难度查询题目 */
    PageInfo<Question> queryByDifficulty(Integer difficulty, Integer pageNum, Integer pageSize);

    /** 根据所属课程查询题目 */
    PageInfo<Question> queryByCourse(Integer course, Integer pageNum, Integer pageSize);

    /** 根据题目内容查询题目 */
    PageInfo<Question> queryByQuestionContent(String content, Integer pageNum, Integer pageSize);

    /** 根据答案内容查询题目 */
    PageInfo<Question> queryByAnswerContent(String content, Integer pageNum, Integer pageSize);

    /** 综合所有条件查询题目 */
    PageInfo<Question> queryByAnything(Double score, Integer type, Integer difficulty, Integer course, String questionContent, String answerContent, Integer pageNum, Integer pageSize);

    PageInfo<Question> queryByAnything(Double min, Double max, Integer type, Integer difficulty, Integer course, String questionContent, String answerContent, Integer pageNum, Integer pageSize);

    /** 通过id获取题目 */
    Question getQuestionById(Integer id);

    /** 彻底删除题目 */
    Result deleteQuestionById(Integer id);

    /** 批量彻底删除题目 */
    Result batchDeleteQuestion(List<Integer> ids);

    /** 恢复题目 */
    Result recoverQuestionById(Integer id);

    /** 批量恢复题目 */
    Result batchRecoverQuestion(List<Integer> ids);

    /** 根据所属用户id查询题目 */
    PageInfo<Question> queryByUserId(Integer userId,Integer pageNum, Integer pageSize);
}
