package com.korent.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.korent.entity.Notification;
import com.korent.service.NotificationService;
import com.korent.util.PageModel;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-9-11.
 */
public class UserNoteAction extends ActionSupport {
    private NotificationService notificationService;
    private Integer uid;
    private Integer nid;
    private int pageNo = 1;
    private int pageSize = 6;


    /*初始化页面信息*/
    public void init(){
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
    }


    /*获取页面的Model*/
    public PageModel getPageModel(int pageCount) {

        return new PageModel(pageNo, pageSize, pageCount);
    }

    /*获取用户是否有未读消息*/
    public String isHaveUnReadNote() throws Exception {
        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Boolean result = notificationService.isNoReadNote(uid);
        if(result.equals(false)){
            out.write("no");
        }else {
            out.write("yes");
        }
        return null;
    }

    /*获取未读的信息*/
    public String getUnReadNote() throws IOException {

        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = new GsonBuilder().disableHtmlEscaping().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        Map map = new HashMap();
        List<Notification> list = notificationService.getUnReadNoteByPage(uid, pageNo, pageSize);
        map.put("note", list);
        PageModel pageModel = getPageModel(notificationService.getUnReadNoteCount(uid,pageSize));
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        return null;
    }

    /*获取已读的信息*/
    public String  getReadNote() throws Exception {
        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = new GsonBuilder().disableHtmlEscaping().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        Map map = new HashMap();
        List<Notification> list = notificationService.getReadNoteByPage(uid, pageNo, pageSize);
        map.put("note", list);
        PageModel pageModel = getPageModel(notificationService.getReadNoteCount(uid,pageSize));
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        return null;

    }

    /*获取删除的信息*/
    public String  getDeleteNote() throws Exception {
        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = new GsonBuilder().disableHtmlEscaping().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        Map map = new HashMap();
        List<Notification> list = notificationService.getDeleteNoteByPage(uid, pageNo, pageSize);
        map.put("note", list);
        PageModel pageModel = getPageModel(notificationService.getDeleteNoteCount(uid,pageSize));
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        return null;

    }

    /*用户阅读信息*/
    public String readNote() throws Exception {
        notificationService.readNotification(nid);
        return null;

    }

    /*用户删除信息*/
    public String deleteNote() throws Exception {
        notificationService.deleteNotification(nid);
        return null;
    }

    public UserNoteAction() {
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public NotificationService getNotificationService() {
        return notificationService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }
}
