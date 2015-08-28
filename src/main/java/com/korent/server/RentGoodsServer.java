package com.korent.server;

import com.korent.dao.NotificationDao;
import com.korent.dao.RentGoodsDao;
import com.korent.dao.UserDao;

/**
 * Created by lei on 15-8-28.
 */
public class RentGoodsServer {

    private UserDao userDao;
    private NotificationDao notificationDao;
    private RentGoodsDao rentGoodsDao;
    public RentGoodsServer() {
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

    public RentGoodsDao getRentGoodsDao() {
        return rentGoodsDao;
    }

    public void setRentGoodsDao(RentGoodsDao rentGoodsDao) {
        this.rentGoodsDao = rentGoodsDao;
    }
}
