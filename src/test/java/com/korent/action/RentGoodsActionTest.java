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
public class RentGoodsActionTest extends StrutsSpringTestCase {

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
    public void testGetAllRentGoods() throws Exception {
        request.setParameter("pageNo", String.valueOf(1));
        request.setParameter("pageSize", String.valueOf(7));
        request.getSession().setAttribute("user", 4);
        System.out.println(executeAction("/rent/getAllRentGoods.action"));





    }

    @Test
    public void testRentGoodsInfo() throws Exception{
        request.setParameter("pageNo", String.valueOf(1));
        request.setParameter("pageSize", String.valueOf(7));
        request.getSession().setAttribute("user", 4);
        request.setParameter("rid", String.valueOf(20));
        System.out.println(executeAction("/rent/getRentGoodsInfo.action"));
    }

    @Test
    public void testGetOrderRent() throws Exception {
        request.setParameter("pageNo", String.valueOf(1));
        request.setParameter("pageSize", String.valueOf(7));
        request.getSession().setAttribute("user", 4);
        System.out.println(executeAction("/rent/getOrderGoods.action"));
    }

    @Test
    public void testGetFollowRent() throws Exception {
        request.setParameter("pageNo", String.valueOf(1));
        request.setParameter("pageSize", String.valueOf(7));
        request.getSession().setAttribute("user", 12);
        System.out.println(executeAction("/rent/getFollowGoods.action"));
    }

    @Test
    public void testGetSendRent() throws Exception {
        request.setParameter("pageNo", String.valueOf(1));
        request.setParameter("pageSize", String.valueOf(7));
        request.getSession().setAttribute("user", 4);
        System.out.println(executeAction("/rent/getSendGoods.action"));
    }
}