package com.korent.action;

import com.korent.service.NotificationService;
import com.korent.service.UserService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsSpringTestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import static org.junit.Assert.*;

@ContextConfiguration(locations = "classpath*:spring-hibernate.xml")
/*@RunWith(SpringJUnit4ClassRunner.class)*/
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
/*@RunWith(SpringJUnit4ClassRunner.class)*/
@TestExecutionListeners({})
public class UserNoteActionTest extends StrutsSpringTestCase {
    private NotificationService notificationService;
    @Override
    protected String[] getContextLocations() {
        return new String[]{"classpath:spring-hibernate.xml"};
    }

    @Override
    protected void setUp() throws Exception {
//        dispatcherInitParams.put("config", "struts-default.xml,struts-plugin.xml,classpath:struts.xml");
        super.setUp();
    }
    @Test
    public void testReadNote() throws Exception {
        request.setParameter("uid", String.valueOf(4));
        request.setParameter("pageNo", String.valueOf(1));
        request.setParameter("pagesSize", String.valueOf(6));
        System.out.println(executeAction("/note/getReadNote"));

    }

    @Test
    public void testGetUnReadNote() throws Exception {

        request.setParameter("uid", String.valueOf(21));
        System.out.println(executeAction("/note/getUnReadNote.action"));
    }

    @Test
    public void testGetReadNote() throws Exception {

        request.setParameter("uid", String.valueOf(4));
        System.out.println(executeAction("/note/getReadNote.action"));
    }

    @Test
    public void testGetDeleteNote() throws Exception {

    }

    @Test
    public void testIsNoReadNote() throws Exception {
        request.setParameter("uid", String.valueOf(23));
        System.out.println(executeAction("/note/haveUnReadNote.action"));
    }

    public NotificationService getNotificationService() {
        return notificationService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }


}