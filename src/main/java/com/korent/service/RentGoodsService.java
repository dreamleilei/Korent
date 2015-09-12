package com.korent.service;

import com.google.gson.*;
import com.korent.dao.NotificationDao;
import com.korent.dao.RentGoodsDao;
import com.korent.dao.UserDao;
import com.korent.entity.RentGoods;
import com.korent.util.RentGoodsExclusionStrategy;
import com.korent.util.RentGson;
import com.korent.util.UserGson;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-8-28.
 */
public class RentGoodsService {

    private UserDao userDao;
    private NotificationDao notificationDao;
    private RentGoodsDao rentGoodsDao;
    public RentGoodsService() {
    }


    /*根据id获取租品的信息*/
    public RentGoods getRentGoodsInfo(Serializable id) {
      return rentGoodsDao.get(RentGoods.class, id);

    }

    /*分页获取租品信息*/
    public List<RentGoods> getRentGoodsByPage(int pageNo, int pageSize){

        return   rentGoodsDao.getRentGoodsByPage(pageNo, pageSize);

    }

      /*获取所有租品*/
    public List<RentGoods> getAllRentGoods(){
        return rentGoodsDao.findAll(RentGoods.class);
    }

    /*获取租品分页的总数*/
    public Integer getRentGoodsPage(int pageSize){
        List<RentGoods> list = getAllRentGoods();
        return list.size() % pageSize == 0 ? list.size() / pageSize : list.size() /pageSize + 1;
    }

    /*分类获取租品*/
    public List<RentGoods> getRentGoodsByClassifyByPage(String classify, int pageNo, int pageSize){
        return rentGoodsDao.findByClassify(classify, pageNo, pageSize);
    }

    /*获取分类的页数*/
    public Integer getRentGoodsByClassifyPageCount(String classify, int pageSize){
        List <RentGoods> list = getRentGoodsByClassifyByPage(classify, 1, -1);
        return list.size() % pageSize == 0 ? list.size() /pageSize : list.size() /pageSize + 1;
    }

    /*分页获取搜索的租品*/
    public List<RentGoods> getRentGoodsBySearchByPage(String key, int pageNo, int pageSize) {
        return rentGoodsDao.getRentGoodsBySearch(key, pageNo, pageSize);
    }

    /*获取搜索的页数*/
    public Integer getRentGoodsBySearchPageCount(String key, int pageSize) {
        List<RentGoods> list = getRentGoodsBySearchByPage(key, 1, -1);
        return list.size() % pageSize == 0 ? list.size() /pageSize : list.size() /pageSize + 1;
    }

    /*更新租品*/
    public void updateRent(RentGoods rentGoods) {
        rentGoodsDao.update(rentGoods);
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
