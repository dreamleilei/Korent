package com.korent.service;

import com.korent.dao.AdminDao;
import com.korent.dao.NotificationDao;
import com.korent.dao.UserDao;

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



    public String getAllUser() {
        userDao.getAllUserName();
        return null;
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
