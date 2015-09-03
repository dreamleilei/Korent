package com.korent.service;

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
public class AdminServiceTest {
    @Autowired
    private AdminService adminService;

    @Test
    public void testGetIdByName() throws Exception {

    }

    @Test
    public void testGetAdminMap() throws Exception {

    }

    @Test
    public void testGetAllUser() throws Exception {
        adminService.getAllUser();
    }

    @Test
    public void testDeleteUser() throws Exception {

    }

    @Test
    public void testGetUserIdByName() throws Exception {

    }
}