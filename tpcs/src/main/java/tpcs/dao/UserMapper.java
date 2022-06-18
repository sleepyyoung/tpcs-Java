package tpcs.dao;

import org.apache.ibatis.annotations.*;
import tpcs.pojo.User;

import java.util.List;

@Mapper
public interface UserMapper {
    /** 非管理员用户列表 */
    @Select("select ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR from user_info where IS_ADMINISTRATOR = false")
    @Result(column = "IS_ADMINISTRATOR", property = "isAdministrator")
    List<User> notAdminUserList();

    /** 管理员用户列表 */
    @Select("select ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR from user_info where IS_ADMINISTRATOR = true")
    @Result(column = "IS_ADMINISTRATOR", property = "isAdministrator")
    List<User> adminUserList();

    /** 新增用户 */
    @Insert("insert into user_info(USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR) value (#{username}, #{password}, #{email}, #{note}, #{status}, #{isAdministrator})")
    @Result(column = "IS_ADMINISTRATOR", property = "isAdministrator")
    Boolean addUser(User user);

    /** 根据用户名查询用户是否存在（通过数量查询） */
    @Select("select count(*) from user_info where USERNAME = #{username}")
    Integer selectUserCountByUsername(String username);

    /** 根据邮箱查询用户是否存在（通过数量查询） */
    @Select("select count(*) from user_info where EMAIL = #{email}")
    Integer selectUserCountByEmail(String email);

    /** 根据用户名查询用户 */
    @Select("select ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR from user_info where USERNAME = #{username}")
    @Result(column = "IS_ADMINISTRATOR", property = "isAdministrator")
    User selectByUsername(String username);

    /** 根据用户id查询用户 */
    @Select("select ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR from user_info where ID = #{id}")
    @Result(column = "IS_ADMINISTRATOR", property = "isAdministrator")
    User selectById(Integer id);

    /** 根据用户名和密码查询用户 */
    @Select("select ID, USERNAME, PASSWORD, EMAIL, NOTE, STATUS, IS_ADMINISTRATOR from user_info where USERNAME = #{username} and PASSWORD = #{password}")
    User selectByUsernameAndPassword(String username,String password);

    /** 修改密码 */
    @Update("update user_info set PASSWORD = #{password} where USERNAME = #{username}")
    Boolean modifyPassword(User user);

    /** 修改用户 */
    @Update("update user_info " +
            "set USERNAME = #{username}," +
            "    PASSWORD = #{password}, " +
            "    EMAIL = #{email}," +
            "    IS_ADMINISTRATOR = #{isAdministrator} " +
            "where ID = #{id}")
    Boolean modifyUser(User user);

    /** 更新用户状态 */
    @Update("update user_info set STATUS = #{status} where ID = #{id}")
    Boolean updateUserStatus(Integer id, Integer status);

    /** 删除用户 */
    @Delete("delete from user_info where ID = #{id}")
    Boolean deleteUser(Integer id);

    /** 根据username查找userId */
    @Select("select ID from user_info where USERNAME = #{username}")
    Integer queryUserIdByUsername(String username);

    /** 根据userId查找username */
    @Select("select USERNAME from user_info where ID = #{id}")
    String queryUsernameById(Integer id);

    /** 根据用户名判断用户是否为管理员 */
    @Select("select ID from user_info where IS_ADMINISTRATOR = true and USERNAME = #{username}")
    Boolean isAdminByUsername(String username);
}
