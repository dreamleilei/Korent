package com.korent.action;

import com.korent.entity.User;
import com.korent.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lei on 15-8-28.
 */
public class UserAction extends ActionSupport {
    private UserService userService;

    private Integer id;
    private String username;
    private String password;
    private String email;
    private String qq;
    private String phone;

    /*用户登录的action*/
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

    /*用户注册的action*/
    public String register() {
        Map<Object, Object> userMap = userService.getUserMap();
        if(userMap.containsKey(username)) {
            return INPUT;
        } else {
            User user = new User(username, password, phone, email, qq);
            userService.saveUser(user);
            return SUCCESS;
        }
    }

    /*用户修改信息的action*/
    public String changeInformation() {
        userService.changeInformation(id, phone, qq, email);
        return SUCCESS;
    }

    /*用户修改密码action*/
    public String changePassword() {
        userService.changePassword(id, password);
        return SUCCESS;
    }


    public void validateRegister() {
        if (phone == null) {
        } else if(phone.length() != 11){
            addFieldError("phone", "电话号码格式不正确");
        }
    }

    @Override
    public void validate() {
        Pattern userPattern = Pattern.compile("^([_\\u4e00-\\u9fa5a-zA-Z0-9]+)$");
        Matcher matcher = userPattern.matcher(username);
        if(!matcher.matches()){
            addFieldError("username", "用户名格式不正确");
        }
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("^([_\\u4e00-\\u9fa5a-zA-Z0-9]+)$");
        Matcher matcher = pattern.matcher("孙磊_adffdaf__**");
        System.out.println(matcher.matches());
    }

}
