package com.korent.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lei on 15-8-27.
 */
public class BaseDao<T> extends HibernateDaoSupport implements IBaseDao<T>{
    @Override
    public T get(Class<T> entityClass, Serializable id) {
        return getHibernateTemplate().get(entityClass, id);
    }

    @Override
    public Serializable save(T entity) {
        return getHibernateTemplate().save(entity);
    }

    @Override
    public void update(T entity) {
        getHibernateTemplate().update(entity);

    }

    @Override
    public void delete(Class<T> entityClass, Serializable id) {
        getHibernateTemplate().delete(get(entityClass, id));
        getHibernateTemplate().flush();

    }

    @Override
    @SuppressWarnings("unchecked")
    public List<T> findAll(Class<T> entityClass) {
        DetachedCriteria criteria = DetachedCriteria.forClass(entityClass);
        return (List<T>)getHibernateTemplate().findByCriteria(criteria);
    }

    @Override
    public long findCount(Class<T> entityClass) {
        return findAll(entityClass).size();

    }

    @Override
    public void delete(T entity) {
        getHibernateTemplate().delete(entity);
    }

}