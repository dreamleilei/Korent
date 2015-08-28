package com.korent.server;

import com.korent.dao.NotificationDao;

/**
 * Created by lei on 15-8-28.
 */
public class NotificationServer {

    private NotificationDao notificationDao;

    public NotificationServer() {
    }

    public NotificationDao getNotificationDao() {
        return notificationDao;
    }

    public void setNotificationDao(NotificationDao notificationDao) {
        this.notificationDao = notificationDao;
    }
}
