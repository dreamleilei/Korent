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
public class UserSearchActionTest extends StrutsSpringTestCase {


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
    public void testExecute() throws Exception {

    }
}