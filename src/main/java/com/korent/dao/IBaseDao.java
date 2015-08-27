package com.korent.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lei on 15-8-27.
 */
public interface IBaseDao<T> {

    /*根据ID获得实例*/
    public T get(Class<T> entityClass, Serializable id); //根据id获取实体

    public Serializable save(T entity);          //保存实体

    public void update(T entity);  //更新实体

    public void delete(Class<T> entityClass, Serializable id);  //根据id删除实体

    public List<T> findAll(Class<T> entityClass);  //获取所有实体


    public long findCount(Class<T> entityClass);  //获取实体总数

    public void delete(T entity) ;          //根据实体删除


}