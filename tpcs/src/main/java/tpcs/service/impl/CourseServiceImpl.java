package tpcs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tpcs.dao.CourseMapper;
import tpcs.pojo.Course;
import tpcs.pojo.Result;
import tpcs.service.ICourseService;

import java.util.List;

@Service
public class CourseServiceImpl implements ICourseService {
    private static final Logger logger = LoggerFactory.getLogger(CourseServiceImpl.class);

    @Autowired
    private CourseMapper courseMapper;

    /** 获取课程列表 */
    @Override
    public List<Course> courseList() {
        return courseMapper.courseList();
    }

    @Override
    public PageInfo<Course> courseList(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Course> courseList = courseList();
        return new PageInfo<>(courseList);
    }

    /** 新增课程 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result addCourse(String courseName) {
        if (courseMapper.queryByName(courseName) != null) {
            return new Result(false, "名字为 " + courseName + " 的课程已存在！");
        }
        Boolean success;
        String msg = null;
        try {
            success = courseMapper.addCourse(courseName);
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("新增课程失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 删除课程 */
    @Override
    public Result deleteCourseById(Integer courseId) {
        Boolean success;
        String msg = null;
        try {
            success = courseMapper.deleteCourseById(courseId);
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("删除课程失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }

    /** 根据课程Id查询课程 */
    @Override
    public Course queryById(Integer id) {
        return courseMapper.queryById(id);
    }
}
