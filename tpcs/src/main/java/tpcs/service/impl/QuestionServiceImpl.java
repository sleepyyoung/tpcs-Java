package tpcs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tpcs.dao.QuestionMapper;
import tpcs.pojo.*;
import tpcs.service.IQuestionService;

import java.util.List;

@Service
public class QuestionServiceImpl implements IQuestionService {
    private static final Logger logger = LoggerFactory.getLogger(QuestionServiceImpl.class);

    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public List<Question> questionList() {
        return questionMapper.questionList();
    }

    /** 获取题目列表 */
    @Override
    public PageInfo<Question> questionListSimple(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.questionListSimple();
        return new PageInfo<>(questionList);
    }

    /** 获取题库题型数据 */
    @Override
    public List<QuestionBankType> questionBankTypeList(Integer id) {
        return questionMapper.questionBankTypeList(id);
    }

    /** 根据分值查询题目 */
    @Override
    public PageInfo<Question> queryByScore(Double score, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByScore(score, null, null);
        return new PageInfo<>(questionList);
    }

    @Override
    public PageInfo<Question> queryByScore(Double min, Double max, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByScore(null, min, max);
        return new PageInfo<>(questionList);
    }

    /** 根据题型查询题目 */
    @Override
    public PageInfo<Question> queryByType(Integer type, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByType(type);
        return new PageInfo<>(questionList);
    }

    /** 根据难度查询题目 */
    @Override
    public PageInfo<Question> queryByDifficulty(Integer difficulty, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByDifficulty(difficulty);
        return new PageInfo<>(questionList);
    }

    /** 根据所属课程查询题目 */
    @Override
    public PageInfo<Question> queryByCourse(Integer course, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByCourse(course);
        return new PageInfo<>(questionList);
    }

    /** 根据题目内容查询题目 */
    @Override
    public PageInfo<Question> queryByQuestionContent(String content, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByQuestionContent(content);
        return new PageInfo<>(questionList);
    }

    /** 根据答案内容查询题目 */
    @Override
    public PageInfo<Question> queryByAnswerContent(String content, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByAnswerContent(content);
        return new PageInfo<>(questionList);
    }

    /** 综合所有条件查询题目 */
    @Override
    public PageInfo<Question> queryByAnything(Double score, Integer type, Integer difficulty, Integer course, String questionContent, String answerContent, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByAnything(score, null, null, type, difficulty, course, questionContent, answerContent);
        return new PageInfo<>(questionList);
    }

    @Override
    public PageInfo<Question> queryByAnything(Double min, Double max, Integer type, Integer difficulty, Integer course, String questionContent, String answerContent, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByAnything(null, min, max, type, difficulty, course, questionContent, answerContent);
        return new PageInfo<>(questionList);
    }

    /** 通过id获取题目 */
    @Override
    public Question getQuestionById(Integer id) {
        return questionMapper.getQuestionById(id);
    }

    /**
     * 添加题目
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result addQuestion(SimplifyQuestion question) {
        Boolean success;
        String msg = null;
        try {
            success = questionMapper.addQuestion(question);
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("添加题目失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /**
     * 修改题目
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result updateQuestion(SimplifyQuestion question) {
        boolean success;
        String msg = null;
        try {
            success = questionMapper.updateQuestion(question) == 1;
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("修改题目失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 逻辑删除题目（移动到回收站） */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result removeQuestion2Garbage(Integer id) {
        boolean success;
        String msg = null;
        try {
            success = questionMapper.removeQuestion2Garbage(id) == 1;
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("逻辑删除题目失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 批量逻辑删除题目（移动到回收站） */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result batchRemoveQuestion2Garbage(List<Integer> ids) {
        boolean success;
        String msg = null;
        try {
            success = ids.size() == questionMapper.batchRemoveQuestion2Garbage(ids);
            if (!success) {
                msg = "未知原因，没能将所有选中的题目移动到回收站...";
            }
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("批量逻辑删除题目失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 获取题型列表 */
    @Override
    public List<QuestionType> questionTypeList() {
        return questionMapper.questionTypeList();
    }

    /** 获取分值列表 */
    @Override
    public List<Double> scoreList() {
        return questionMapper.scoreList();
    }

    /** 通过课程、题型和分值获取题目数量 */
    @Override
    public Integer getQuestionCountByCourseIdAndQuestionTypeAndScoreAndDifficulty(Integer courseId, Integer typeId, Double score, Integer difficultyId) {
        return questionMapper.getQuestionCountByCourseIdAndQuestionTypeAndScoreAndDifficulty(courseId, typeId, score, difficultyId);
    }

    /** 获取题型列表 */
    @Override
    public PageInfo<QuestionType> questionTypeList(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<QuestionType> questionTypeList = questionMapper.questionTypeList();
        return new PageInfo<>(questionTypeList);
    }

    /** 根据id获取题型 */
    @Override
    public QuestionType getQuestionTypeById(int id) {
        return questionMapper.getQuestionTypeById(id);
    }

    /** 根据name获取题型 */
    @Override
    public QuestionType getQuestionTypeByName(String name) {
        return questionMapper.getQuestionTypeByName(name);
    }

    /** 添加题型 */
    @Override
    public Result addQuestionType(String name) {
        if (questionMapper.getQuestionTypeByName(name) != null) {
            return new Result(false, "名字为 " + name + " 的题型已存在！");
        }
        Boolean success;
        String msg = null;
        try {
            success = questionMapper.addQuestionType(name);
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
        }
        return new Result(success, msg);
    }

    /** 获取题目难度列表 */
    @Override
    public List<QuestionDifficulty> questionDifficultyList() {
        return questionMapper.questionDifficultyList();
    }

    /** 根据题目难度Id获取题目难度 */
    @Override
    public QuestionDifficulty getQuestionDifficultyById(Integer id) {
        return questionMapper.getQuestionDifficultyById(id);
    }

    /** 根据所属用户id查询题目 */
    @Override
    public PageInfo<Question> queryByUserId(Integer userId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionMapper.queryByUserId(userId);
        return new PageInfo<>(questionList);
    }
}
