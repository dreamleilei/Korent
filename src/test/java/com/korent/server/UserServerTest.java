package com.korent.server;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import static org.junit.Assert.*;

@ContextConfiguration(locations = "classpath:spring-hibernate.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class UserServerTest {
    @Autowired
    UserServer userServer;

    @Before
    public void setUp() throws Exception {

    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void testGetAllFollowRentGoods() throws Exception {

    }

    @Test
    public void testGetFollowRentGoodsByPage() throws Exception {

    }

    @Test
    public void testGetAllRoderGoods() throws Exception {

    }

    @Test
    public void testGetOrderGoodsByPage() throws Exception {

    }

    @Test
    public void testGetInformation() throws Exception {
        System.out.println(userServer.information(3));

    }

    @Test
    public void testGetUserDao() throws Exception {

    }
}