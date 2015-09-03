package com.korent.action;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.korent.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.*;

/**
 * Created by lei on 15-9-2.
 */
public class UserChangeAction extends ActionSupport{
    private UserService userService;
    private String username;
    private String email;
    private String qq;
    private Date birth;
    private String phone;
    private String address;
    private String idNumber ;
    private String realName;
    private String sex;


    public String changeInformation() {
        Map map = new HashMap();
        map.put("birth", birth);
        map.put("address",address);
        map.put("idNumber", idNumber);
        map.put("sex", sex);
        System.out.println(sex);
        map.put("realName", realName);
        Gson gson = new Gson();
        String otherInformation = gson.toJson(map);
        Integer id = userService.getIdByName(username);
        System.out.println(otherInformation);
        userService.changeInformation(id,phone, qq, email, otherInformation);
        return null;
    }
    public UserChangeAction() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
