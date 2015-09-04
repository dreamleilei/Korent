package com.korent.dao;

import com.korent.component.Address;
import com.korent.entity.RentGoods;
import com.korent.entity.User;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;
import java.util.List;

@ContextConfiguration(locations = "classpath:spring-hibernate.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class RentGoodsDaoTest extends TestCase {
    @Autowired
    private RentGoodsDao rentGoodsDao;

    public void setUp() throws Exception {
        super.setUp();

    }

    public void tearDown() throws Exception {

    }

    @Test
    public void testFindByProperty() throws Exception {
        Address address = new Address();
        address.setCity("xian");
        List<RentGoods> rentGoodsList = rentGoodsDao.findByProperty("address.city", "xian",1,-1);
        System.out.println(rentGoodsList);
    }

    public void testFindByProperty1() throws Exception {

    }

    @Test
    public void testFindByAddress() throws Exception {
        Address address = new Address();
        address.setCity("xian");
        address.setCountry("changan");
        address.setProvince("shanxi");
        address.setDistrict("xianyoudian");
        List<RentGoods> list = rentGoodsDao.findByAddress(address, 1, -1);
        System.out.println(list);
    }

    public void testFindByStatus() throws Exception {

    }

    public void testGetPicturePathList() throws Exception {

    }

    @Test
    public void testGetOrderUser() throws Exception {
        User user = rentGoodsDao.getOrderUser(2);
        System.out.println(user.getId());
    }

    @Test
    public void testFingByClassify() throws Exception {
        List<RentGoods> list = rentGoodsDao.findByClassify("gzi", 1, 3);
        System.out.println(list);
    }

    @Test
    public void testFindFollowUser() throws Exception {
      //  System.out.println(rentGoodsDao.findByFollower(3, 1, 1).get(0).getId());

    }

    @Test
    public void testAddPath() throws Exception {
        //RentGoods rentGoods = rentGoodsDao.get(RentGoods.class, 2);
        rentGoodsDao.addPath(2, "/picture");
    }

    @Test
    public void testDelPath() throws Exception {

    }

    @Test
    public void testFindByOrder() throws Exception {
        System.out.println(rentGoodsDao.findByOrder(4, 1, 5));

    }

    @Test
    public void testDelete() throws Exception {
        rentGoodsDao.delete(RentGoods.class, 2);
    }
}