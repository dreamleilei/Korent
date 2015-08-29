package com.korent.service;

import com.korent.dao.NotificationDao;

/**
 * Created by lei on 15-8-28.
 */
public class NotificationService {

    private NotificationDao notificationDao;

    public NotificationService() {
    }

    public NotificationDao getNotificationDao() {
        return notificationDao;
    }

    public void setNotificationDao(NotificationDao notificationDao) {
        this.notificationDao = notificationDao;
    }
}
