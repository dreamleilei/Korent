package com.korent.action;

import org.apache.struts2.StrutsSpringTestCase;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import static org.junit.Assert.*;

@ContextConfiguration(locations = "classpath*:spring-hibernate.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
/*@RunWith(SpringJUnit4ClassRunner.class)*/
@TestExecutionListeners({})
public class UserOperateActionTest extends StrutsSpringTestCase{


    @Before
    public void setUp() throws Exception {
        super.setUp();

    }

    @After
    public void tearDown() throws Exception {

    }

    @Override
    protected String[] getContextLocations() {
        return new String[]{"classpath:spring-hibernate.xml"};
    }

    @Test
    public void testOrderRent() throws Exception {
        //request.setParameter("uid", String.valueOf(12));
        request.setParameter("rid", String.valueOf(17));
        request.getSession().setAttribute("user", 12);
        executeAction("/korent/orderRent.action");

    }

    @Test
    public void testCancelRent() throws Exception {

        request.setParameter("rid", String.valueOf(17));
        request.getSession().setAttribute("user", 12);
        executeAction("/korent/cancelRent.action");
    }

    @Test
    public void testFollowGoods() throws Exception {
        request.setParameter("rid", String.valueOf(17));
        request.getSession().setAttribute("user", 12);
        executeAction("/korent/followGoods.action");
    }

    @Test
    public void testCancelFollowGoods() throws Exception {
        request.setParameter("rid", String.valueOf(17));
        request.getSession().setAttribute("user", 12);
        executeAction("/korent/cancelFollowGoods.action");

    }

    @Test
    public void testCancelSendGoods() throws Exception {
        request.setParameter("rid", String.valueOf(19));
        request.getSession().setAttribute("user", 4);
        executeAction("/korent/cancelSendGoods.action");

    }
}