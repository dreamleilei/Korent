package com.korent.service;

import com.korent.dao.AdminDao;
import com.korent.dao.NotificationDao;
import com.korent.dao.UserDao;
import com.korent.entity.User;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


/**
 * Created by lei on 15-8-28.
 */
public class AdminService {
    private AdminDao adminDao;
    private UserDao userDao;
    private NotificationDao notificationDao;


    /*根据管理员姓名获取管理员的id*/
    public Integer getIdByName(String name) {
        return adminDao.getIdByName(name);
    }

     /*获取管理员名和密码的map序列*/
    public Map<Object, Object> getAdminMap() {
        return adminDao.getLoginList();
    }



    /*管理员获取 所有的用户*/
    public List<User> getAllUser() {
        return userDao.findAll(User.class);
    }

    /*管理员删除用户*/
    public void deleteUser (Serializable id) {
        userDao.delete(User.class, id);

    }

    /*管理员根据用户姓名获取用户的id*/

    public Serializable getUserIdByName(String name) {
        return userDao.getIdByName(name);
    }

    public AdminService() {
    }

    public AdminDao getAdminDao() {
        return adminDao;
    }

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public NotificationDao getNotificationDao() {
        return notificationDao;
    }

    public void setNotificationDao(NotificationDao notificationDao) {
        this.notificationDao = notificationDao;
    }
}
