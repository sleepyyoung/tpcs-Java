package tpcs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tpcs.dao.UserMapper;
import tpcs.pojo.User;
import tpcs.service.IUserService;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public PageInfo<User> notAdminUserList(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> userList = userMapper.notAdminUserList();
        return new PageInfo<>(userList);
    }

    @Override
    public PageInfo<User> adminUserList(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> userList = userMapper.adminUserList();
        return new PageInfo<>(userList);
    }

    @Override
    public List<User> adminUserList() {
        return userMapper.adminUserList();
    }

    @Override
    public Boolean addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public Integer selectUserCountByUsername(String username) {
        return userMapper.selectUserCountByUsername(username);
    }

    @Override
    public Integer selectUserCountByEmail(String email) {
        return userMapper.selectUserCountByEmail(email);
    }

    @Override
    public User selectByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public User selectById(Integer id) {
        return userMapper.selectById(id);
    }

    @Override
    public User selectByUsernameAndPassword(String username, String password){
        return userMapper.selectByUsernameAndPassword(username,password);
    }

    @Override
    public Boolean modifyPassword(User user) {
        return userMapper.modifyPassword(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean modifyUser(User user) {
        return userMapper.modifyUser(user);
    }

    /** 更新用户状态 */
    @Override
    public Boolean updateUserStatus(Integer id, Integer status) {
        return userMapper.updateUserStatus(id, status);
    }

    /** 删除用户 */
    @Override
    public Boolean deleteUser(Integer id) {
        return userMapper.deleteUser(id);
    }

    @Override
    public Integer queryUserIdByUsername(String username) {
        return userMapper.queryUserIdByUsername(username);
    }

    @Override
    public String queryUsernameById(Integer id) {
        return userMapper.queryUsernameById(id);
    }

    @Override
    public Boolean isAdminByUsername(String username) {
        User user = userMapper.selectByUsername(username);
        if (user == null) {
            return false;
        }
        return user.getIsAdministrator();
    }

    /** 根据用户名判断用户是否为普通老师 */
    @Override
    public Boolean isTeacherByUsername(String username) {
        User user = userMapper.selectByUsername(username);
        if (user == null) {
            return false;
        }
        return !user.getIsAdministrator();
    }
}
