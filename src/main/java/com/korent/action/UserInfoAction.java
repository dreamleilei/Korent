package com.korent.action;

import com.korent.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.json.annotations.JSON;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lei on 15-8-31.
 */
public class UserInfoAction extends ActionSupport {
    private List<String> userInfoList ;
    private UserService userService;

    public UserInfoAction() {
    }

    public String execute() {
        userInfoList = userService.getUserList();

        return SUCCESS;
    }


    @JSON
    public List<String> getUserInfoList() {
        return userInfoList;
    }


    public UserService getUserService() {
        return userService;
    }

    @JSON(serialize=false)
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
