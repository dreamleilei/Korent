package com.korent.dao;

import com.korent.entity.RentGoods;
import com.korent.entity.User;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;

import javax.jws.soap.SOAPBinding;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /*获取所有用户的列表*/
    @SuppressWarnings("unchecked")
    public List<String> getAllUserName() {
        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        criteria.setProjection((Projections.property("name")));
        List<String> list = (List<String>)getHibernateTemplate().findByCriteria(criteria);
        return list;
    }

    /*获取用户姓名和密码的map序列*/
    @SuppressWarnings("unchecked")
    public Map<Object, Object> getLoginList() {

        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        criteria.setProjection((Projections.projectionList()
                .add(Projections.property("name"))
                .add(Projections.property("password"))));
        List<Object[]> list = (List<Object[]>)getHibernateTemplate().findByCriteria(criteria);
        Map<Object, Object> map = new HashMap<Object, Object>();
        for(Object[] o: list) {
            map.put(o[0], o[1]);
        }
        return map;
    }

    public void orderRentGoods (User user, RentGoods rentGoods) {  //用户预定租品
        user.getOrder().add(rentGoods);
        update(user);
    }

    public List<RentGoods> getSendGoods(User user, int pageNo, int pageSize) { //获取用户发布的消息
        List<RentGoods> list = user.getSend();
        return list.subList((pageNo -1) * pageSize, pageNo * pageSize + 1);
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