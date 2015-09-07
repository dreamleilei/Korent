package com.korent.action;

import com.korent.service.AdminService;
import org.apache.struts2.StrutsSpringJUnit4TestCase;
import org.apache.struts2.StrutsSpringTestCase;
import org.junit.After;
import org.junit.Before;
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
public class AdminOperateActionTest extends StrutsSpringTestCase{

    @Autowired
    private AdminService adminService;


   /* @Override
    protected String getConfigPath() {
        return "classpath:sprint-hibernate.xml";
    }*/
      @Override
    protected String[] getContextLocations() {
        return new String[]{"classpath:spring-hibernate.xml"};
    }
    @Before
    public void setUp() throws Exception {
    super.setUp();
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void testGetAllUser() throws Exception {

        request.setParameter("pageNo", String.valueOf(1));
        request.setParameter("pageSize", String.valueOf(5));
        request.setParameter("pageCount", String.valueOf(1));
        request.setParameter("id", String.valueOf(2));
        request.setParameter("dataCount", String.valueOf(10));
        /*System.out.println(request.getParameter("pageNo"));*/
        request.getSession().setAttribute("user", 4);
        initServletMockObjects();
    /*    executeAction("/korent/getInformation.action");*/
        executeAction("/admin/getUser.action");
       /* executeAction("/korent/register.action");*/

    }

    public void testDeleteRentGoods() throws Exception {
        request.setParameter("rid", String.valueOf(17));
        executeAction("/admin/deleteRentGoods.action");
    }

    public AdminService getAdminService() {
        return adminService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }
}