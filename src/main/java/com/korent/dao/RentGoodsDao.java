package com.korent.dao;

import com.google.gson.Gson;
import com.korent.entity.RentGoods;
import com.korent.entity.User;
import com.korent.util.RentGson;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.HibernateCallback;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by lei on 15-8-28.
 */
public class RentGoodsDao extends BaseDao<RentGoods> {

    /*根据属性查询*/
    @SuppressWarnings("unchecked")
    public List<RentGoods> findByProperty(String propertyName, Object value, final int pageNo,final int pageSize ) {  //根据属性查询
        List<RentGoods> list = currentSession().createCriteria(RentGoods.class).
                setFirstResult((pageNo - 1) * pageSize).
                setMaxResults(pageSize).add(Restrictions.eq(propertyName, value)).list();
        return list;


    }

    /*根据地址查询租品*/
    public List<RentGoods> findByAddress(Object address,final int pageNo,final int pageSize ) {  //根据地址查询
        return findByProperty("address", address, pageNo, pageSize);
    }

    /*根据状态查询租品*/
    public List<RentGoods> findByStatus(Object status, final int pageNo,  int pageSize) {    //根据状态查询
        return findByProperty("status", status, pageNo, pageSize);
    }

    /*获取租品的存储路径*/
    public List<String> getPicturePathList(Serializable id) {  //获取物品描述图片的存储路径
        RentGoods rentGoods = get(RentGoods.class, id);
        return rentGoods.getPicturePathList();
    }

    /*获取租品的预定者*/
    public User getOrderUser(Serializable id) {
        RentGoods rentGoods = get(RentGoods.class, id);
        return rentGoods.getOrderUser();
    }

    /*获取租品的发布者*/
    public User getOwner(Serializable id) {
        RentGoods rentGoods = get(RentGoods.class, id);
        return rentGoods.getOwner();
    }

    /*根据租品的分类获取租品*/
    @SuppressWarnings("unchecked")
    public List<RentGoods> findByClassify(String classify , int pageNo, int pageSize) {
        List<RentGoods> list = currentSession().createCriteria(RentGoods.class).
                setFirstResult((pageNo - 1) * pageSize).
                setMaxResults(pageSize).
                add(Restrictions.like("classify","%"+classify +"%" )).
                list();
        return list;
    }

    /*获取租品的关注者*/
    public List<User> findFollowUser(Serializable id, int pageNo, int pageSize) {
        RentGoods rentGoods = get(RentGoods.class, id);
        List<User> list = rentGoods.getFollower();
        if((pageNo - 1) * pageSize  > list.size() ) {
            return null;
        } else if((pageNo * pageSize > list.size())) {
            return list.subList((pageNo -1) * pageSize, list.size());
        }

        return list.subList((pageNo - 1) * pageSize, pageNo *pageSize);
    }

    /*根据发布者获取租品*/
    public List<RentGoods> findByOwner(Serializable id, final int pageNo, final int pageSize) {
        //return findByProperty("owner", id, pageNo, pageSize);
        final String query = "FROM RentGoods WHERE owner = " + id;
        List<RentGoods> list= getHibernateTemplate().execute(new HibernateCallback<List<RentGoods>>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException {
                Query query1 = session.createQuery(query);
                return query1.setFirstResult((pageNo -1) * pageSize)
                .setMaxResults(pageSize).list();
            }
        });
        return list;
    }

    /*根据关预定者获取租品*/
    public List<RentGoods> findByOrder(Serializable id, final int pageNo, final int pageSize) {
        //return findByProperty("owner", id, pageNo, pageSize);
        final String query = "FROM RentGoods WHERE orderUser = " + id;
        List<RentGoods> list= getHibernateTemplate().execute(new HibernateCallback<List<RentGoods>>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException {
                Query query1 = session.createQuery(query);
                return query1.setFirstResult((pageNo -1) * pageSize)
                        .setMaxResults(pageSize).list();
            }
        });
        return list;
    }

    /*根据租品分页获取关注者*/
    @SuppressWarnings("unchecked")
    public List<User> findFollower(Serializable id, final int pageNo, final int pageSize){
        RentGoods rentGoods = get(RentGoods.class, id);
        return (List<User>)currentSession().createFilter(rentGoods.getFollower(),"").setFirstResult((pageNo - 1) * pageSize)
        .setMaxResults(pageSize).list();
    }


    public void addPath(Serializable id, String path) { //获取租品图片的路径
        RentGoods rentGoods = get(RentGoods.class, id);
        rentGoods.getPicturePathList().add(path);
    }

    public void delPath(Serializable id, String path) { //删除租品图片路径
        RentGoods rentGoods = get(RentGoods.class, id);
        rentGoods.getPicturePathList().remove(path);
    }

    /*分页获取租品*/
    @SuppressWarnings("unchecked")
    public List<RentGoods> getRentGoodsByPage(int pageNo, int pageSize){
        List<RentGoods> list = currentSession().createCriteria(RentGoods.class).
                setFirstResult((pageNo - 1) * pageSize).
                setMaxResults(pageSize).
                addOrder(Order.desc("updateDate")).
                addOrder(Order.desc("id")).
                list();
        if(list == null) {
            return null;
        }
        return list;
    }

    /*效率最最最低的模糊查询*/
    @SuppressWarnings("unchecked")
    public List<RentGoods> getRentGoodsBySearch(String key, int pageNo, int pageSize) {
        Gson gson = RentGson.getGson();
        List<RentGoods> list = currentSession().createCriteria(RentGoods.class).addOrder(Order.desc("updateDate"))
                .addOrder(Order.desc("id")).list();

        System.out.println(list);
        Iterator<RentGoods> iterator = list.iterator();
        while(iterator.hasNext()) {
            RentGoods rentGoods = iterator.next();
            String temp = gson.toJson(rentGoods);
            System.out.println(temp);
            if(!temp.contains(key)){
                iterator.remove();
                System.out.println("remove");
            }
        }
   /*     System.out.println(list);*/

        for(RentGoods rentGoods : list){
            System.out.println(rentGoods.getId());
        }
        System.out.println(list);
        if(pageSize < 0) {
            return list;
        }
        if(pageNo < 1) {
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
    public RentGoods get(Class<RentGoods> entityClass, Serializable id) {
        return super.get(entityClass, id);
    }

    @Override
    public Serializable save(RentGoods entity) {
        return super.save(entity);
    }

    @Override
    public void update(RentGoods entity) {
        super.update(entity);
    }

    @Override
    public void delete(Class<RentGoods> entityClass, Serializable id) {
        super.delete(entityClass, id);
    }

    @Override
    public List<RentGoods> findAll(Class<RentGoods> entityClass) {
        return super.findAll(entityClass);
    }

    @Override
    public long findCount(Class<RentGoods> entityClass) {
        return super.findCount(entityClass);
    }

    @Override
    public void delete(RentGoods entity) {
        super.delete(entity);
    }
}
