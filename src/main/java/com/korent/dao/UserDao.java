package com.korent.dao;

import com.korent.entity.RentGoods;
import com.korent.entity.User;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import javax.jws.soap.SOAPBinding;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-8-27.
 */
public class UserDao extends BaseDao<User> {

    private static final String email = "email";
    private static final String qq = "qq";
    private static final String phone = "phone";
    private static final String password = "password";
            
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

    /*用户预定租品*/
    public void orderRentGoods (User user, RentGoods rentGoods) {  //用户预定租品
        user.getOrder().add(rentGoods);
        update(user);
    }

    /*用户预定租品*/
    public void orderRentGoods(Serializable uid, RentGoods rentGoods){
        User user = get(User.class, uid);
        user.getOrder().add(rentGoods);
        update(user);
    }

    /*根据用户名获取用户的id*/
    @SuppressWarnings("unchecked")
    public Integer getIdByName(String name){
        System.out.println(name);
        List<User> list = currentSession().createCriteria(User.class).
                add(Restrictions.eq("name",  name)).
                list();
        if(list == null) {
            return null;
        }
        return list.get(0).getId();
    }

    /*根据用户分页获关注的取租品*/
    @SuppressWarnings("unchecked")
    public List<RentGoods> getFollowGoodsByPage(Serializable id, int pageNo, int pageSize) {
        User user = get(User.class, id);
        List<RentGoods> list =currentSession().createFilter(user.getFollow(), "")
                .setMaxResults(pageSize)
                .setFirstResult((pageNo -1) *(pageSize))
                .list();
        return list;
    }

    /*获取用户关注租品的总集合页数*/
    public int getFollowGoodsCount(Serializable id, int pageSize){
        int resultCount = getFollowGoodsByPage(id, 1, -1).size();
        return resultCount % pageSize == 0 ? resultCount /pageSize : resultCount /pageSize + 1;
    }

    /*根据用户分页获取发布的租品*/
    @SuppressWarnings("unchecked")
    public List<RentGoods> getSendGoodsByPage(Serializable id, int pageNo, int pageSize) {
            User user = get(User.class, id);
            List<RentGoods> list =currentSession().createFilter(user.getSend(), "")
                    .setMaxResults(pageSize)
                    .setFirstResult((pageNo -1) *(pageSize))
                    .list();
            return list;
    }


    /*获取用户租品的总集合页数*/
    public int getSendGoodsCount(Serializable id, int pageSize){
        int resultCount = getSendGoodsByPage(id, 1, -1).size();
        return resultCount % pageSize == 0 ? resultCount /pageSize : resultCount /pageSize + 1;
    }

    /*获取用户的其它信息*/
    @SuppressWarnings("unchecked")
    public String getOtherInformation(Serializable id){
        List<User> list = currentSession().createCriteria(User.class).
                add(Restrictions.eq("id",  id)).
                list();
        if(list == null) {
            return null;
        }
        return list.get(0).getOtherInformation();
    }
    /*根据用户分页获取预定的租品*/
    @SuppressWarnings("unchecked")
    public List<RentGoods> getOrderGoodsByPage(Serializable id, int pageNo, int pageSize) {
        User user = get(User.class, id);
        List<RentGoods> list =currentSession().createFilter(user.getOrder(), "")
                .setMaxResults(pageSize)
                .setFirstResult((pageNo -1) *(pageSize))
                .list();
        return list;
    }

    /*获取用户租品的总集合页数*/
    public int getOrderGoodsCount(Serializable id, int pageSize){
        int resultCount = getOrderGoodsByPage(id, 1, -1).size();
        return resultCount % pageSize == 0 ? resultCount /pageSize : resultCount /pageSize + 1;
    }

    /*分页获取用户所有的用户*/
    @SuppressWarnings("unchecked")
    public List<User> getUserByPage(int pageNo, int pageSize){
        List<User> list = currentSession().createCriteria(User.class).
                setFirstResult((pageNo - 1) * pageSize).
                setMaxResults(pageSize).
                list();
        if(list == null) {
            return null;
        }
        return list;
    }

    /*用户修改信息*/ //暂时先留个接口
    public void changeInformation(Serializable id, String property, Object value) {
        User user = get(User.class, id);
        Field field = null;
        try {
            field = user.getClass().getDeclaredField(property);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        field.setAccessible(true);
        try {
            field.set(user, value);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        update(user);
    }

    /*修改用户的邮箱*/
    public void changeEmail(Serializable id, Object value) {
        changeInformation(id, email, value);
    }

    /*修改用户的QQ*/
    public void changeQq(Serializable id, Object value) {
        changeInformation(id, qq, value);
    }

    /*修改用户的电话*/
    public void changePhone(Serializable id, Object value) {
        changeInformation(id, phone, value);
    }

    /*修改用户的密码*/
    public void changePassword(Serializable id, Object value) {
        changeInformation(id, password, value);
    }

    /*用户修改信息*/
    public void changeInformation(Serializable id, Object phoneNumber, Object qqNumber, Object emailNumber) {
        User user = get(User.class, id);
        user.setPhone((String) phoneNumber);
        user.setEmail((String) emailNumber);
        user.setQq((String) qqNumber);
    }

    /*用户修改个人信息*/
    public void changeInformation(Serializable id, Object phoneNumber, Object qqNumber, Object emailNumber, Object otherInformation) {
        User user = get(User.class, id);
        user.setPhone((String) phoneNumber);
        user.setEmail((String) emailNumber);
        user.setQq((String) qqNumber);
        user.setOtherInformation((String)otherInformation);
    }


    public List<RentGoods> getSendGoods(User user, int pageNo, int pageSize) { //获取用户发布的消息
        List<RentGoods> list = user.getSend();
        if(pageSize < 0) {
            return list;
        }
        if((pageNo - 1) * pageSize  > list.size() ) {
            return null;
        } else if((pageNo * pageSize > list.size())) {
            return list.subList((pageNo -1) * pageSize, list.size());
        }

        return list.subList((pageNo - 1) * pageSize, pageNo *pageSize);
    }

    public List<RentGoods> getFollowGoods(User user, int pageNo, int pageSize) {
        List<RentGoods> list = user.getFollow();
        if(pageSize < 0) {
            return list;
        }
        if((pageNo - 1) * pageSize  > list.size() ) {
            return null;
        } else if((pageNo * pageSize > list.size())) {
            return list.subList((pageNo -1) * pageSize, list.size());
        }

        return list.subList((pageNo - 1) * pageSize, pageNo *pageSize);
    }

    public List<RentGoods> getOrderGoods(User user, int pageNo, int pageSize) {
        List<RentGoods> list = user.getOrder();
        if(pageSize < 0) {
            return list;
        }
        if((pageNo - 1) * pageSize  > list.size() ) {
            return null;
        } else if((pageNo * pageSize > list.size())) {
            return list.subList((pageNo -1) * pageSize, list.size());
        }

        return list.subList((pageNo - 1) * pageSize, pageNo *pageSize);
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