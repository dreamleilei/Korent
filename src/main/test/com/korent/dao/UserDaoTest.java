package com.korent.dao;

import com.korent.entity.User;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

@ContextConfiguration(locations = "classpath:spring-hibernate.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class UserDaoTest extends TestCase {
    @Autowired
    private UserDao userDao;

    public void setUp() throws Exception {
        super.setUp();

    }

    public void tearDown() throws Exception {

    }

    public void testGet() throws Exception {

    }

    @Test
    public void testSave() throws Exception {
        User user= new User();
        user.setName("leilei");
        user.setEmail("1679211339@qq.com");
        user.setPassword("leilei");
        userDao.save(user);


    }


    @Test
    public void testUpdate() throws Exception {
        User user = userDao.get(User.class, 7);
        user.setPassword("change My Password");
        userDao.update(user);
    }

    @Test
    public void testDelete() throws Exception {
        userDao.delete(User.class, 7);

    }

    @Test
    public void testFindAll() throws Exception {
        userDao.findAll(User.class);
    }

    @Test
    public void testFindCount() throws Exception {
        assertEquals(Long.valueOf(0),(Long)userDao.findCount(User.class));
    }

    public void testDelete1() throws Exception {

    }

    public void testGet1() throws Exception {

    }

    public void testSave1() throws Exception {

    }

    public void testUpdate1() throws Exception {

    }

    public void testDelete2() throws Exception {

    }

    public void testFindAll1() throws Exception {

    }

    public void testFindCount1() throws Exception {

    }

    public void testDelete3() throws Exception {

    }
}