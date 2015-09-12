package com.korent.dao;

import com.korent.entity.Notification;
import com.korent.entity.User;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by lei on 15-8-28.
 */
public class NotificationDao extends BaseDao<Notification>{


    /*获取用户是否有未读的消息*/
    public Boolean isHaveUnReadNote(Serializable id) {
        List<Notification> list = getUnReadNotificationByPage(id, 1, -1);
        System.out.println(list);
        if(list == null || list.size() == 0){
            return false;
        }
        return true;
    }

/*获取站内信的通知*/
    @SuppressWarnings("unchecked")
    public List<Notification> getLetterByToId(Serializable id, int time) {
        List<Notification> list = currentSession().createCriteria(Notification.class).
                add(Restrictions.eq("ToId", id)).
                add(Restrictions.gt("date", new Date(System.currentTimeMillis() - time)))
                .add(Restrictions.eq("status", 0))
                .addOrder(Order.desc("id"))
                .list();
        return list;
    }

    /*分页获取用户所有的通知*/
    @SuppressWarnings("unchecked")
    public List<Notification> getNotificationByPage(Serializable uid, int pageNo, int pageSize) {
        List<Notification> list = currentSession().createCriteria(Notification.class).
                add(Restrictions.eq("ToId", uid)).
                addOrder(Order.desc("id")).
                setMaxResults(pageSize).
                setFirstResult(pageNo)
                .list();
        return list;
    }

    /*获取通知的页数*/
    public Integer getNotificationPageCount(Serializable uid, int pageSize){
        int resultCount = getNotificationByPage(uid, 1, -1).size();
        return resultCount % pageSize == 0 ? resultCount /pageSize : resultCount /pageSize + 1;

    }

    /*分页获取用户所有未读的通知*/
    @SuppressWarnings("unchecked")
    public List<Notification> getUnReadNotificationByPage(Serializable uid, int pageNo, int pageSize) {
        List<Notification> list = currentSession().createCriteria(Notification.class).
                add(Restrictions.eq("ToId", uid)).
                add(Restrictions.eq("status", 0)).
                addOrder(Order.desc("id")).
                setMaxResults(pageSize).
                setFirstResult((pageNo - 1) * pageSize)
                .list();
        System.out.println(list);
        return list;
    }

    /*分页获取未读来信的页数*/
    public Integer getUnReadNotificationPageCount(Serializable uid, int pageSize){
        int resultCount = getUnReadNotificationByPage(uid, 1, -1).size();
        return resultCount % pageSize == 0 ? resultCount /pageSize : resultCount /pageSize + 1;

    }

    /*分页获取用已读读的通知*/
    @SuppressWarnings("unchecked")
    public List<Notification> getReadNotificationByPage(Serializable uid, int pageNo, int pageSize) {
        List<Notification> list = currentSession().createCriteria(Notification.class).
                add(Restrictions.eq("ToId", uid)).
                add(Restrictions.eq("status", 1)).
                addOrder(Order.desc("id")).
                setMaxResults(pageSize).
                setFirstResult((pageNo -1)*pageSize)
                .list();
        System.out.println(list);
        return list;
    }

    /*分页获取已读来信的页数*/
    public Integer getReadNotificationPageCount(Serializable uid, int pageSize){
        int resultCount = getReadNotificationByPage(uid, 1, -1).size();
        return resultCount % pageSize == 0 ? resultCount /pageSize : resultCount /pageSize + 1;

    }

    /*分页获取用户所有删除的通知*/
    @SuppressWarnings("unchecked")
    public List<Notification> getDeleteNotificationByPage(Serializable uid, int pageNo, int pageSize) {
        List<Notification> list = currentSession().createCriteria(Notification.class).
                add(Restrictions.eq("ToId", uid)).
                add(Restrictions.eq("status", 2)).
                addOrder(Order.desc("id")).
                setMaxResults(pageSize).
                setFirstResult((pageNo -1)*pageSize)
                .list();
        return list;
    }

    /*分页获取删除来信的页数*/
    public Integer getDeleteNotificationPageCount(Serializable uid, int pageSize){
        int resultCount = getDeleteNotificationByPage(uid, 1, -1).size();
        return resultCount % pageSize == 0 ? resultCount /pageSize : resultCount /pageSize + 1;

    }

    /*用户阅读来信*/
    public void readNotification(Serializable nid){
        Notification note = get(Notification.class, nid);
        note.setStatus(1);
        update(note);
    }

    /*用户删除来信*/
    public void deleteNotification(Serializable nid){
        Notification note = get(Notification.class, nid);
        note.setStatus(2);
        update(note);
    }
    
    
    public NotificationDao() {
    }
}
