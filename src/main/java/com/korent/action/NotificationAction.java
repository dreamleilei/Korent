package com.korent.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.korent.entity.Notification;
import com.korent.service.NotificationService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * Created by lei on 15-8-28.
 */
public class NotificationAction extends ActionSupport {

    private NotificationService notificationService;
    private Integer uid;
    private Integer time ;


    public String searchNotification() throws IOException {
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = new GsonBuilder().disableHtmlEscaping().setDateFormat(":yyyy-MM-dd HH:mm:ss").create();
                List < Notification > list = notificationService.getLetter(uid, time);
        gson.toJson(list);
        out.write(gson.toJson(list));
        return null;
    }

    public String getAllNotificationByPage() throws Exception {
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();

        return null;

    }
    public NotificationAction() {
    }

    public NotificationService getNotificationService() {
        return notificationService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }
}
