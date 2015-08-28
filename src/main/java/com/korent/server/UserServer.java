package com.korent.server;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.korent.dao.NotificationDao;
import com.korent.dao.RentGoodsDao;
import com.korent.dao.UserDao;
import com.korent.entity.RentGoods;
import com.korent.entity.User;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lei on 15-8-28.
 */
public class UserServer {
    private UserDao userDao;
    private RentGoodsDao rentGoodsDao;
    private NotificationDao notificationDao;



    public List<RentGoods> getAllFollowRentGoods(Serializable id) {
        return userDao.findFollowRentGoods(id);
    }

    public List<RentGoods> getFollowRentGoodsByPage(Serializable id, int pageNo, int pageSize) {
        return rentGoodsDao.findByFollower(id, pageNo, pageSize);
    }

    public List<RentGoods> getAllRoderGoods(Serializable id) {
        return userDao.findOrderRentGoods(id);
    }

    public List<RentGoods> getOrderGoodsByPage(Serializable id, int pageNo, int pageSize) {
        return rentGoodsDao.findByOrder(id, pageNo, pageSize);
    }

    public String information(Serializable id) {
        Gson gson = new Gson();
        User user = userDao.get(User.class, id);
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("id", user.getId());
        jsonObject.addProperty("email", user.getEmail());
        jsonObject.addProperty("qq", user.getQq());
        jsonObject.addProperty("phone", user.getPhone());
        return gson.toJson(jsonObject);
    }

    public UserServer() {
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public RentGoodsDao getRentGoodsDao() {
        return rentGoodsDao;
    }

    public void setRentGoodsDao(RentGoodsDao rentGoodsDao) {
        this.rentGoodsDao = rentGoodsDao;
    }

    public NotificationDao getNotificationDao() {
        return notificationDao;
    }

    public void setNotificationDao(NotificationDao notificationDao) {

        this.notificationDao = notificationDao;
    }


}
