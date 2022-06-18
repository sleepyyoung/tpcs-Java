package tpcs.service;

import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Select;
import tpcs.pojo.Course;
import tpcs.pojo.Question;
import tpcs.pojo.Result;

import java.util.List;

public interface ICourseService {
    /** 获取课程列表 */
    List<Course> courseList();

    PageInfo<Course> courseList(Integer pageNum, Integer pageSize);

    /** 新增课程 */
    Result addCourse(String courseName);

    /** 删除课程 */
    Result deleteCourseById(Integer courseId);

    /** 根据课程Id查询课程 */
    Course queryById(Integer id);
}
