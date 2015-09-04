package com.korent.service;

import com.google.gson.*;
import com.korent.dao.NotificationDao;
import com.korent.dao.RentGoodsDao;
import com.korent.dao.UserDao;
import com.korent.entity.RentGoods;
import com.korent.entity.User;
import com.korent.util.UserExclusionStrategy;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-8-28.
 */
public class UserService {
    private UserDao userDao;
    private RentGoodsDao rentGoodsDao;
    private NotificationDao notificationDao;



    /*根据姓名获取用户id*/
    public Integer getIdByName(String name) {
        return userDao.getIdByName(name);
    }

    /*获取所有用户的列表*/

    public List<String> getUserList() {
        return userDao.getAllUserName();
    }
    /*获取用户名和密码的map序列*/

    public Map<Object, Object> getUserMap() {
        return userDao.getLoginList();
    }
    /*获取某用户关注的所有租品*/
    public List<RentGoods> getAllFollowRentGoods(Serializable id) {
        return userDao.findFollowRentGoods(id);
    }

    /*分页获取用户关注的租品*/
    public List<RentGoods> getFollowRentGoodsByPage(Serializable id, int pageNo, int pageSize) {
        return userDao.getFollowGoodsByPage(id, pageNo, pageSize);
    }

    /*获取用户关注租品的总页数*/
    public int getFollowGoodsCount(Serializable id, int pageSize) {
        return userDao.getFollowGoodsCount(id, pageSize);
    }

    /*获取某用户所有预定的租品*/
    public List<RentGoods> getAllRoderGoods(Serializable id) {
        return userDao.findOrderRentGoods(id);
    }

    /*分页获取用户预定的租品*/
    public List<RentGoods> getOrderGoodsByPage(Serializable id, int pageNo, int pageSize) {
        return rentGoodsDao.findByOrder(id, pageNo, pageSize);
    }

    /*获取用户预定租品的总页数*/
    public int getOrderGoodsCount(Serializable id, int pageSize) {
        return userDao.getOrderGoodsCount(id, pageSize);
    }

    /*获取用户发布的租品*/
    public List<RentGoods> getSendGoods(Serializable id) {
        User user = userDao.get(User.class, id);
        return user.getSend();
    }

    /*分页获取用户发布的租品*/
    public List<RentGoods> getSendGoodsByPage(Serializable id, int pageNo, int pageSize) {
        return rentGoodsDao.findByOwner(id, pageNo, pageSize);
    }

    /*获取用户关注租品的总页数*/
    public int getSendGoodsCount(Serializable id, int pageSize) {
        return userDao.getSendGoodsCount(id, pageSize);
    }

    /*获取用户的个人信息*/
    public String information(Serializable id) {
        User user = userDao.get(User.class, id);
        Gson gson = new GsonBuilder().setExclusionStrategies(new UserExclusionStrategy()).create();
        return gson.toJson(user);
    }

    /*用户修改电话信息*/
    public void changePhone(Serializable id, Object phone) {
        userDao.changePhone(id, phone);
    }

    /*用户修改QQ信息*/
    public void changeQq(Serializable id, Object qq) {
        userDao.changeQq(id, qq);
    }

    /*用户修改email*/
    public void changeEmail(Serializable id, Object email) {
        userDao.changeEmail(id, email);
    }

    /*用户修改密码*/
    public void changePassword(Serializable id, Object password) {
        userDao.changePassword(id, password);
    }

    public List<RentGoods> searchRentGoods(String key) {

        return rentGoodsDao.findByClassify(key, 1, -1);
    }

    /*用户修改信息*/

    public void changeInformation(Serializable id, Object phone, Object qq, Object email) {
        userDao.changeInformation(id, phone, qq, email);
    }

    public void changeInformation(Serializable id, Object phone, Object qq, Object email, Object otherInformation){
        userDao.changeInformation(id, phone, qq, email, otherInformation);
    }

    /*获取用户其它的信息*/
    public String getOtherInformation(Serializable id){
        return userDao.getOtherInformation(id);
    }

    /*保存用户*/
    public void saveUser(User user) {
        userDao.save(user);
    }

    /*用户发布租品*/
    public void sendRentGoods(Serializable id, RentGoods rentGoods){
        User user = userDao.get(User.class, id);
        rentGoods.setOwner(user);
        rentGoodsDao.save(rentGoods);

    }

    public UserService() {
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
