package com.korent.action;

import com.korent.service.AdminService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.Map;

/**
 * Created by lei on 15-8-28.
 */
public class AdminAction extends ActionSupport {
    private AdminService adminService;
    private String adminname;
    private String password;
    private Integer id;
    

    /*用户登录的action*/
    public String login() {
        Map<Object, Object> adminMap = adminService.getAdminMap();
        if(!adminMap.containsKey(adminname)){
            return INPUT;
        }
        if(!adminMap.get(adminname).equals(password)){
            return ERROR;
        }
        ActionContext actionContext = ActionContext.getContext();
        Integer id = adminService.getIdByName(adminname);
        actionContext.getSession().put("admin",id);
        return SUCCESS;
    }

    /*查看所有用户的action*/
    public String getAllUser() {
        if(getId() == null) {
            return null;
        }
        adminService.getAllUser();
         return null;
    }
    public AdminAction() {
    }

    public AdminService getAdminService() {
        return adminService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getId() {
        return (Integer) ServletActionContext.getRequest().getSession().getAttribute("admin");
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
