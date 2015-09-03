package com.korent.action;

import com.korent.entity.User;
import com.korent.service.AdminService;
import com.korent.util.UserGson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-8-28.
 */
public class AdminAction extends ActionSupport {
    private AdminService adminService;
    private String adminname;
    private String password;
    private Integer id;
    private String username;
    

    /*管理员登录的action*/
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
    public String getAllUser() throws IOException {
        if(getId() == null) {
            return null;
        }
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        List<User> list = adminService.getAllUser();
        String result = UserGson.getGson().toJson(list);
        out.write(result);
        out.flush();
        out.close();
         return null;

    }
    /*管理员删除用户的action*/
    public String deleteUser() {
        if(getId() == null) {
            return null;
        }
        Serializable delete = adminService.getUserIdByName(username);
        adminService.deleteUser(delete);
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
