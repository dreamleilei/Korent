package com.korent.service;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

@ContextConfiguration(locations = "classpath:spring-hibernate.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class RentGoodsServiceTest {
    @Autowired
    private RentGoodsService rentGoodsService;

    @Before
    public void setUp() throws Exception {

    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void testGetNotificationInfo() throws Exception {
        System.out.println(rentGoodsService.getRentGoodsInfo(2));

    }

    @Test
    public void testGetRentGoodsByPage() throws Exception {
        rentGoodsService.getRentGoodsByPage(1, 10);

    }

    @Test
    public void testGetAllRentGoods() throws Exception {
        System.out.println(rentGoodsService.getAllRentGoods());
    }
}