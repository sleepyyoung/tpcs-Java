package tpcs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tpcs.dao.QuestionGarbageMapper;
import tpcs.pojo.Question;
import tpcs.pojo.Result;
import tpcs.service.IQuestionGarbageService;

import java.util.List;

@Service
public class QuestionGarbageServiceImpl implements IQuestionGarbageService {
    private static final Logger logger = LoggerFactory.getLogger(QuestionGarbageServiceImpl.class);

    @Autowired
    private QuestionGarbageMapper questionGarbageMapper;

    /** 获取题目列表 */
    @Override
    public PageInfo<Question> questionGarbageListSimple(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.questionGarbageListSimple();
        return new PageInfo<>(questionList);
    }

    /** 根据分值查询题目 */
    @Override
    public PageInfo<Question> queryByScore(Double score, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByScore(score, null, null);
        return new PageInfo<>(questionList);
    }

    @Override
    public PageInfo<Question> queryByScore(Double min, Double max, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByScore(null, min, max);
        return new PageInfo<>(questionList);
    }

    /** 根据题型查询题目 */
    @Override
    public PageInfo<Question> queryByType(Integer type, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByType(type);
        return new PageInfo<>(questionList);
    }

    /** 根据难度查询题目 */
    @Override
    public PageInfo<Question> queryByDifficulty(Integer difficulty, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByDifficulty(difficulty);
        return new PageInfo<>(questionList);
    }

    /** 根据所属课程查询题目 */
    @Override
    public PageInfo<Question> queryByCourse(Integer course, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByCourse(course);
        return new PageInfo<>(questionList);
    }

    /** 根据题目内容查询题目 */
    @Override
    public PageInfo<Question> queryByQuestionContent(String content, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByQuestionContent(content);
        return new PageInfo<>(questionList);
    }

    /** 根据答案内容查询题目 */
    @Override
    public PageInfo<Question> queryByAnswerContent(String content, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByAnswerContent(content);
        return new PageInfo<>(questionList);
    }

    /** 综合所有条件查询题目 */
    @Override
    public PageInfo<Question> queryByAnything(Double score, Integer type, Integer difficulty, Integer course, String questionContent, String answerContent, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByAnything(score, null, null, type, difficulty, course, questionContent, answerContent);
        return new PageInfo<>(questionList);
    }

    @Override
    public PageInfo<Question> queryByAnything(Double min, Double max, Integer type, Integer difficulty, Integer course, String questionContent, String answerContent, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByAnything(null, min, max, type, difficulty, course, questionContent, answerContent);
        return new PageInfo<>(questionList);
    }

    /** 通过id获取题目 */
    @Override
    public Question getQuestionById(Integer id) {
        return questionGarbageMapper.getQuestionById(id);
    }

    /** 彻底删除题目 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteQuestionById(Integer id) {
        boolean success;
        String msg = null;
        try {
            success = questionGarbageMapper.deleteQuestionById(id) == 1;
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("彻底删除题目失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 批量彻底删除题目 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result batchDeleteQuestion(List<Integer> ids) {
        boolean success;
        String msg = null;
        try {
            success = ids.size() == questionGarbageMapper.batchDeleteQuestion(ids);
            if (!success) {
                msg = "未知原因，没能将所有选中的题目进行删除...";
            }
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("批量彻底删除题目失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 恢复题目 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result recoverQuestionById(Integer id) {
        boolean success;
        String msg = null;
        try {
            success = questionGarbageMapper.recoverQuestionById(id) == 1;
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("恢复题目失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 批量恢复题目 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result batchRecoverQuestion(List<Integer> ids) {
        boolean success;
        String msg = null;
        try {
            success = ids.size() == questionGarbageMapper.batchRecoverQuestion(ids);
            if (!success) {
                msg = "未知原因，没能将所有选中的题目进行恢复...";
            }
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("批量恢复题目失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 根据所属用户id查询题目 */
    @Override
    public PageInfo<Question> queryByUserId(Integer userId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questionList = questionGarbageMapper.queryByUserId(userId);
        return new PageInfo<>(questionList);
    }
}
