package tpcs.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import tpcs.pojo.Course;

import java.util.List;

@Mapper
public interface CourseMapper {
    /** 获取课程列表 */
    @Select("select ID, NAME from course_info order by ID")
    List<Course> courseList();

    /** 新增课程 */
    @Insert("insert into course_info(NAME) value (#{courseName})")
    Boolean addCourse(String courseName);

    /** 根据课程名称查询课程 */
    @Select("select ID, NAME from course_info where NAME = #{courseName}")
    Integer queryByName(String courseName);

    /** 根据课程Id查询课程 */
    @Select("select ID, NAME from course_info where ID = #{id}")
    Course queryById(Integer id);

    /** 删除课程 */
    @Delete("delete from course_info where ID = #{courseId}")
    Boolean deleteCourseById(Integer courseId);
}
