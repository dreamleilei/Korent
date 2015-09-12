package com.korent.dao;

import com.korent.entity.Notification;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import java.util.List;

import static org.junit.Assert.*;
@ContextConfiguration(locations = "classpath:spring-hibernate.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class NotificationDaoTest {

    @Autowired
    private NotificationDao notificationDao;


    public void tearDown() throws Exception {

    }

    @Test
    public void testGetLetterByToId() throws Exception {
        System.out.println();
        List<Notification> notifications = notificationDao.getLetterByToId(4, 100000000);
        for(Notification note: notifications){
            System.out.println(note.getContent());
        }

    }

    @Test
    public void testReadNotification() throws Exception{
        notificationDao.readNotification(4);
    }

    @Test
    public void testDeleteeNotification() throws Exception{
        notificationDao.deleteNotification(1);

    }


    @Test
    public void testGetUnReadNotification() throws Exception {
        System.out.println();
        List<Notification> notifications = notificationDao.getUnReadNotificationByPage(4, 1, 7);
        System.out.println(notificationDao.getUnReadNotificationPageCount(4, 7));
        for(Notification note: notifications){
            System.out.println(note.getContent());


        }

    }


    public NotificationDao getNotificationDao() {
        return notificationDao;
    }

    public void setNotificationDao(NotificationDao notificationDao) {
        this.notificationDao = notificationDao;
    }
}