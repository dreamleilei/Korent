package com.korent.action;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.korent.entity.User;
import com.korent.service.AdminService;
import com.korent.util.PageModel;
import com.korent.util.UserGson;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-9-4.
 */
public class AdminOperateAction extends ActionSupport {
    private AdminService adminService;
    private Integer pageNo = 1;
    private Integer pageSize = 10;
    private Integer pageCount;
    private Integer dataCount;
    private Integer uid;


    public String getUser() throws IOException {
        /*以下两行不能颠倒顺序*/
        setDataCount();
        setPageCount();

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Map map = new HashMap();
        List<User> list = adminService.getUserByPage(pageNo, pageSize);
        Gson userGson = UserGson.getGson();
        PageModel pageModel = new PageModel(pageNo, pageSize, pageCount , dataCount);
        map.put("user", list);
        map.put("pageModel", pageModel);
        out.write(userGson.toJson(map));
        return null;
    }

    /*管理员删除用户*/
    public String deleteUser() {
        System.out.println(uid);
        adminService.deleteUser(uid);
        return null;
    }
    public AdminOperateAction() {
    }

    public Integer getPageNo() {

        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        if(pageNo < 1){
            this.pageNo = 1;
        } if(pageNo >getPageCount()){
            this.pageNo = pageCount;
        }

        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
        if(pageSize < 1) {
            this.pageSize = 5;
        }
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount() {
        this.pageCount = dataCount % pageSize == 0 ? dataCount /pageSize : dataCount /pageSize + 1;
    }

    public Integer getDataCount() {
        return dataCount;
    }

    public void setDataCount() {
        this.dataCount = adminService.getAllUser().size();
    }

    public AdminService getAdminService() {
        return adminService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public void setDataCount(Integer dataCount) {
        this.dataCount = dataCount;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
