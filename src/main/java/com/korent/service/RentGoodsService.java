package com.korent.service;

import com.google.gson.*;
import com.korent.dao.NotificationDao;
import com.korent.dao.RentGoodsDao;
import com.korent.dao.UserDao;
import com.korent.entity.RentGoods;

import java.io.Serializable;

/**
 * Created by lei on 15-8-28.
 */
public class RentGoodsService {

    private UserDao userDao;
    private NotificationDao notificationDao;
    private RentGoodsDao rentGoodsDao;
    public RentGoodsService() {
    }

    /*获取租品的信息*/
    public String getRentGoodsInfo(Serializable id) {
        RentGoods rentGoods = rentGoodsDao.get(RentGoods.class, id);
        Gson gson = new GsonBuilder().setExclusionStrategies(new RentGoodsExclusionStrategy()).create();
        return gson.toJson(rentGoods);
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

    private static class RentGoodsExclusionStrategy implements ExclusionStrategy {
        public boolean shouldSkipClass(Class<?> clazz) {
            return false;
        }

        public boolean shouldSkipField(FieldAttributes f) {
            Boolean skip = f.getName().equals("owner") ||
                    f.getName().equals("orderUser") ||
                    f.getName().equals("follower");
            return skip;
        }
    }

}
