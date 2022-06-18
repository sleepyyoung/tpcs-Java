package tpcs.service;

import com.github.pagehelper.PageInfo;
import tpcs.pojo.*;

import java.util.List;

public interface IQuestionService {
    List<Question> questionList();

    /** 获取题目列表 */
    PageInfo<Question> questionListSimple(Integer pageNum, Integer pageSize);

    /** 获取题库题型数据 */
    List<QuestionBankType> questionBankTypeList(Integer id);

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

    /** 添加题目 */
    Result addQuestion(SimplifyQuestion question);

    /** 修改题目 */
    Result updateQuestion(SimplifyQuestion question);

    /** 逻辑删除题目（移动到回收站） */
    Result removeQuestion2Garbage(Integer id);

    /** 批量逻辑删除题目（移动到回收站） */
    Result batchRemoveQuestion2Garbage(List<Integer> ids);

    /** 获取题型列表 */
    List<QuestionType> questionTypeList();

    /** 获取分值列表 */
    List<Double> scoreList();

    /** 通过课程、题型和分值获取题目数量 */
    Integer getQuestionCountByCourseIdAndQuestionTypeAndScoreAndDifficulty(Integer courseId,Integer typeId, Double score,Integer difficultyId);

    /** 获取题型列表 */
    PageInfo<QuestionType> questionTypeList(Integer pageNum, Integer pageSize);

    /** 根据id获取题型 */
    QuestionType getQuestionTypeById(int id);

    /** 根据name获取题型 */
    QuestionType getQuestionTypeByName(String name);

    /** 添加题型 */
    Result addQuestionType(String name);

    /** 获取题目难度列表 */
    List<QuestionDifficulty> questionDifficultyList();

    /** 根据题目难度Id获取题目难度 */
    QuestionDifficulty getQuestionDifficultyById(Integer id);

    /** 根据所属用户id查询题目 */
    PageInfo<Question> queryByUserId(Integer userId,Integer pageNum, Integer pageSize);
}
