package com.korent.dao;

import com.korent.entity.RentGoods;
import com.korent.entity.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.io.Serializable;
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
        return rentGoods.getUser();
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
