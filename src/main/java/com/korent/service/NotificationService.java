package com.korent.service;

import com.korent.dao.NotificationDao;
import com.korent.entity.Notification;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lei on 15-8-28.
 */
public class NotificationService {

    private NotificationDao notificationDao;

    public void save(Notification notification) {


        notificationDao.save(notification);
    }

    /*获取用户是否有未读来信*/
    public Boolean isNoReadNote(Serializable id) {
       return  notificationDao.isHaveUnReadNote(id);

    }

    /*站内信被阅读*/
    public void readNotification(Serializable id) {
        Notification notification = notificationDao.get(Notification.class, id);
        notification.setStatus(1);
        notificationDao.update(notification);
    }

    /*站内信删除*/
    public void deleteNotification(Serializable id) {


        notificationDao.delete(Notification.class, id);
    }

    /*据当前time秒的站内信*/
    public List<Notification> getLetter(Serializable id, int time ) {  //time为秒
        return notificationDao.getLetterByToId(id, time * 1000);

    }

    /*分页获取未读的站内信*/
    public List<Notification> getUnReadNoteByPage(Serializable id, int pageNo, int pageSize){
        return notificationDao.getUnReadNotificationByPage(id, pageNo, pageSize);

    }

    /*获取未读来信的页数*/
    public Integer getUnReadNoteCount(Serializable id, int pageSize){
        return notificationDao.getUnReadNotificationPageCount(id, pageSize);
    }

    /*分页获取已读的站内信*/
    public List<Notification> getReadNoteByPage(Serializable id, int pageNo, int pageSize){
        return notificationDao.getReadNotificationByPage(id, pageNo, pageSize);

    }

    /*获取已读来信的页数*/
    public Integer getReadNoteCount(Serializable id, int pageSize){
        return notificationDao.getReadNotificationPageCount(id, pageSize);
    }

    /*分页获取删除的站内信*/
    public List<Notification> getDeleteNoteByPage(Serializable id, int pageNo, int pageSize){
        return notificationDao.getDeleteNotificationByPage(id, pageNo, pageSize);

    }

    /*获取删除来信的页数*/
    public Integer getDeleteNoteCount(Serializable id, int pageSize){
        return notificationDao.getDeleteNotificationPageCount(id, pageSize);
    }


    /*用户删除来信*/
    public void deleteNote(Serializable id){
        notificationDao.deleteNotification(id);
    }

    /*用户阅读来信*/
    public void readNote(Serializable id){
        notificationDao.readNotification(id);
    }


    public NotificationService() {
    }

    public NotificationDao getNotificationDao() {
        return notificationDao;
    }

    public void setNotificationDao(NotificationDao notificationDao) {
        this.notificationDao = notificationDao;
    }
}
