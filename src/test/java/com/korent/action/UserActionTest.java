package com.korent.action;

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
public class UserActionTest extends StrutsSpringTestCase {
    @Override
    protected String[] getContextLocations() {
        return new String[]{"classpath:spring-hibernate.xml"};
    }

    @Autowired
    private UserService userService;
    @Override
    protected void setUp() throws Exception {
//        dispatcherInitParams.put("config", "struts-default.xml,struts-plugin.xml,classpath:struts.xml");
        super.setUp();
    }
    @Test
    public void testLogin() throws Exception {
       /* initServletMockObjects();*/
        request.getSession().setAttribute("user", 4);
        request.setParameter("id", String.valueOf(4));
        System.out.println(executeAction("/korent/getInformation.action"));
        System.out.println(request.getAttribute("userInfo"));
       /* executeAction("korent/register");*/

    }

    @Test
    public void testRegister() throws Exception {
        request.getSession().setAttribute("user", 4);
        System.out.println(executeAction("/korent/getInformation.action"));

    }

    @Test
    public void testGetInformation() throws Exception {

    }

    @Test
    public void testChangeInformation() throws Exception {

    }

    @Test
    public void testChangePassword() throws Exception {

    }

    @Test
    public void testGetUserList() throws Exception {
        System.out.println(executeAction("/korent/getUserList.action"));

    }

    @Test
    public void testGetOtherInformatino() throws Exception {
        request.setParameter("id", String.valueOf(4));
        System.out.println(executeAction("/korent/getOtherInformation.action"));
    }
}