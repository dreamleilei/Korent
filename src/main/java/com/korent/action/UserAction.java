package com.korent.action;

import com.korent.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;

/**
 * Created by lei on 15-8-28.
 */
public class UserAction extends ActionSupport {
    private UserService userService;
    private String username;
    private String password;

    public String login() {
        Map<Object, Object> userMap = userService.getUserMap();
        if(!userMap.containsKey(username)){
            return INPUT;
        }
        if(!userMap.get(username).equals(password)){
            return ERROR;
        }
        return SUCCESS;
    }

    public UserAction() {
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
