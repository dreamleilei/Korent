package com.korent.service;

import com.korent.component.Address;
import com.korent.entity.RentGoods;
import com.korent.entity.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import java.util.Date;

import static org.junit.Assert.*;

@ContextConfiguration(locations = "classpath:spring-hibernate.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class UserServiceTest {
    @Autowired
    UserService userService;

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
        System.out.println(userService.information(3));

    }

    @Test
    public void testGetUserDao() throws Exception {

    }

    @Test
    public void testGetAllFollowRentGoods1() throws Exception {

    }

    @Test
    public void testGetFollowRentGoodsByPage1() throws Exception {
        System.out.println(userService.getFollowRentGoodsByPage(4, 1, 6));

    }

    @Test
    public void testGetFollowGoodsCount() throws Exception {
        Integer result = userService.getFollowGoodsCount(3,1);
        assertEquals(Integer.valueOf(2), result);
        assertEquals(Integer.valueOf(0), (Integer) userService.getFollowGoodsCount(100, 1));

    }

    @Test
    public void testUpdateHeadPath() throws Exception {
        userService.updateHeadPath(4, "adfa");
    }

    @Test
    public void testGetOrderGoodsByPage1() throws Exception {

    }

    @Test
    public void testGetOrderGoodsCount() throws Exception {

    }

    @Test
    public void testGetSendGoods() throws Exception {

    }

    @Test
    public void testGetSendGoodsbyPage() throws Exception {

    }

    @Test
    public void testGetSendGoodsCount() throws Exception {

    }

    @Test
    public void testSaveUser() throws Exception {
        User user = new User("leilei", "leilei", "18829291276", "1679211339@qq.com", "1679211339");
        userService.saveUser(user);

    }

    @Test
    public void testSendRentGoods() throws Exception {
        Address address = new Address("山东", "淄博", "高青", "青城镇孙家村");
        RentGoods rentGoods = new RentGoods("这是一栋别墅", "房屋", address, "100元/天", new Date());
        userService.sendRentGoods(4, rentGoods);

    }

    @Test
    public void testRentGoods() throws Exception {
        userService.rentGoods(4,  47);

    }

    @Test
    public void testCancelGoods() throws Exception {
        userService.cancelGoods(12, 18);
    }

    @Test
    public void testFollowGoods() throws Exception {
        userService.followGoods(12, 18);
    }

    @Test
    public void testCancelRentGoods() throws Exception {
        userService.cancelFollowGoods(12,18);
    }

    @Test
    public void testCancelSend() throws Exception {

        userService.cancelSend(4, 24);
    }
}