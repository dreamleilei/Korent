package com.korent.action;

import com.korent.service.UserService;
import org.apache.struts2.StrutsSpringTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

@ContextConfiguration(locations = "classpath*:spring-hibernate.xml")
/*@RunWith(SpringJUnit4ClassRunner.class)*/
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
/*@RunWith(SpringJUnit4ClassRunner.class)*/
@TestExecutionListeners({})
public class SendRentGoodsActionTest extends StrutsSpringTestCase {
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
    public void testChangeRent() throws Exception {
        request.setParameter("price", "price");
        request.setParameter("description", "description");
        request.setParameter("district", "district");
        request.setParameter("path", "path1");
        request.setParameter("path", "path2");
        request.setParameter("path", "path3");
        request.setParameter("rid", "48");
        executeAction("/rent/changeRent.action");

    }
}