package tpcs.service;

import com.github.pagehelper.PageInfo;
import tpcs.pojo.User;

import java.util.List;

public interface IUserService {
    /** 非管理员用户列表 */
    PageInfo<User> notAdminUserList(Integer pageNum, Integer pageSize);

    /** 管理员用户列表 */
    PageInfo<User> adminUserList(Integer pageNum, Integer pageSize);

    /** 管理员用户列表 */
    List<User> adminUserList();

    /** 新增用户 */
    Boolean addUser(User user);

    /** 根据用户名查询用户是否存在（通过数量查询） */
    Integer selectUserCountByUsername(String username);

    /** 根据邮箱查询用户是否存在（通过数量查询） */
    Integer selectUserCountByEmail(String email);

    /** 根据用户名查询用户 */
    User selectByUsername(String username);

    /** 根据用户id查询用户 */
    User selectById(Integer id);

    /** 根据用户名和密码查询用户 */
    User selectByUsernameAndPassword(String username,String password);

    /** 修改密码 */
    Boolean modifyPassword(User user);

    /** 修改用户 */
    Boolean modifyUser(User user);

    /** 更新用户状态 */
    Boolean updateUserStatus(Integer id,Integer status);

    /** 删除用户 */
    Boolean deleteUser(Integer id);

    /** 根据username查找userId */
    Integer queryUserIdByUsername(String username);

    /** 根据userId查找username */
    String queryUsernameById(Integer id);

    /** 根据用户名判断用户是否为管理员 */
    Boolean isAdminByUsername(String username);

    /** 根据用户名判断用户是否为普通老师 */
    Boolean isTeacherByUsername(String username);
}
