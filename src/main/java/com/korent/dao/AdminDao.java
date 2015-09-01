package com.korent.dao;

import com.korent.entity.Admin;
import com.korent.entity.User;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-8-28.
 */
public class AdminDao extends BaseDao<Admin> {

    /*获取所有管理员的列表*/
    @SuppressWarnings("unchecked")
    public List<String> getAllUserName() {
        DetachedCriteria criteria = DetachedCriteria.forClass(Admin.class);
        criteria.setProjection((Projections.property("name")));
        List<String> list = (List<String>)getHibernateTemplate().findByCriteria(criteria);
        return list;
    }

    /*获取管理员姓名和密码的map序列*/
    @SuppressWarnings("unchecked")
    public Map<Object, Object> getLoginList() {

        DetachedCriteria criteria = DetachedCriteria.forClass(Admin.class);
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

    /*根据管理员名获取管理员的id*/
    @SuppressWarnings("unchecked")
    public Integer getIdByName(String name){
        List<User> list = currentSession().createCriteria(Admin.class).
                add(Restrictions.eq("name", name)).
                list();
        return list.get(0).getId();
    }
}
