package com.korent.dao;

import com.korent.entity.RentGoods;
import com.korent.entity.User;
import java.io.Serializable;
import java.util.List;

/**
 * Created by lei on 15-8-27.
 */
public class UserDao extends BaseDao<User> {


    /*获取所有预定的租品的列表*/
    public List<RentGoods> findOrderRentGoods(Serializable id) {
        User user = get(User.class, id);
        return user.getOrder();
    }

    /*获取所有关注的租品的列表*/
    public List<RentGoods> findFollowRentGoods(Serializable id ) {
        User user = get(User.class, id);
        return user.getFollow();
    }

    @Override
    public User get(Class<User> entityClass, Serializable id) {
        return super.get(entityClass, id);
    }

    @Override
    public Serializable save(User entity) {
        return super.save(entity);
    }

    @Override
    public void update(User entity) {
        super.update(entity);
    }

    @Override
    public void delete(Class<User> entityClass, Serializable id) {
        super.delete(entityClass, id);
    }

    @Override
    public List<User> findAll(Class<User> entityClass) {
        return super.findAll(entityClass);
    }

    @Override
    public long findCount(Class<User> entityClass) {
        return super.findCount(entityClass);
    }

    @Override
    public void delete(User entity) {
        super.delete(entity);
    }
}