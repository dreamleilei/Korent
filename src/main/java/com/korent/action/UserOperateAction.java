package com.korent.action;

import com.google.gson.Gson;
import com.korent.entity.Notification;
import com.korent.entity.RentGoods;
import com.korent.entity.User;
import com.korent.kenum.GoodsStatus;
import com.korent.service.NotificationService;
import com.korent.service.RentGoodsService;
import com.korent.service.UserService;
import com.korent.util.UserGson;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by lei on 15-9-6.
 */
public class UserOperateAction {
    private UserService userService;
    private RentGoodsService rentGoodsService;
    private NotificationService notificationService;
    private Integer rid;

    public UserOperateAction() {
    }

    /*用户删除租品*/
    public String cancelSendGoods() {
        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.cancelSend(uid, rid);
        return null;
    }

    /*用户预定租品*/
    public String orderRent() throws IOException {

          ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if(null ==  ServletActionContext.getRequest().getSession().getAttribute("user") ) {
            out.write("noUser");
            return null;
        }
        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.rentGoods(uid, rid);

        /*产生消息机制*/
        Notification notification = new Notification();
        User user= userService.getUserInformation(uid);
        RentGoods rentGoods = rentGoodsService.getRentGoodsInfo(rid);
        SimpleDateFormat dateformat1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date =dateformat1.format(new Date());
        Gson gson = UserGson.getGson();
        notification.setContent("感谢您使用酷租网预订租品,您在" + date +" 成功预定租品!" +"" +
                "租主的详细信息<a href=" +"\"/userInformationMore.jsp?id="+ rentGoods.getOwner().getId() + "\">点击链接查看" +"</a>");
        notification.setToId(uid);
        Notification notification1 = new Notification();
        notification1.setContent("感谢您使用酷租网,您有一件租品在" + date +"被成功预定租品!" +"" +
                "租客的详细信息<a href=" +"\"/userInformationMore.jsp?id="+ rentGoods.getOrderUser().getId() + "\">点击链接查看" +"</a>");
        notification1.setToId(rentGoods.getOwner().getId());
        notificationService.save(notification);
        notificationService.save(notification1);
        return null;
    }

    /*用户取消预定*/
    public String cancelRent(){

        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.cancelGoods(uid, rid);

        /*产生消息机制*/
        Notification notification = new Notification();
        User user= userService.getUserInformation(uid);
        RentGoods rentGoods = rentGoodsService.getRentGoodsInfo(rid);
        SimpleDateFormat dateformat1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date =dateformat1.format(new Date());


        notification.setContent("感谢您使用酷租网,您在" + date +" 成功取消预订租品!");
        notification.setToId(uid);
        notificationService.save(notification);
        Notification notification1 = new Notification();
        notification1.setToId(rentGoods.getOwner().getId());
        notification1.setContent("感谢您使用酷租网,您有一件租品在" + date +"被取消预定!" +"" +
                "租品的详细信息<a href=" +"\"/rentInformation.jsp?rid=" + rentGoods.getId() + "\">点击链接查看" +"</a>");
        notificationService.save(notification1);

        List<User> list = rentGoods.getFollower();
        for(User u :list ){
            Notification note = new Notification();
            note.setContent("您关注的租品又可以被预订了,还等什么呢" +"租品的详细信息<a href=" +"\"/rentInformation.jsp?rid=" + rentGoods.getId() + "\">点击链接查看" +"</a>");
            note.setToId(u.getId());
            notificationService.save(note);
        }

        return null;
    }

    /*用户关注租品*/
    public String followGoods() throws IOException {
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if(null ==  ServletActionContext.getRequest().getSession().getAttribute("user") ) {
            out.write("noUser");
            return null;
        }
        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
    //    uid = 4;  //测试的时候默认uid为4
        userService.followGoods(uid, rid);
        return null;

    }
    /*用户取消关注租品*/
    public String cancelFollowGoods(){
        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.cancelFollowGoods(uid, rid);
        return null;
    }

    /*用户使租品再次可以被预订*/
    public String upGoods(){
        RentGoods rentGoods = rentGoodsService.getRentGoodsInfo(rid);
        rentGoods.setStatus(GoodsStatus.CanOrder);
        rentGoods.setOrderUser(null);
        rentGoodsService.updateRent(rentGoods);
        return null;
    }
    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public RentGoodsService getRentGoodsService() {
        return rentGoodsService;
    }

    public void setRentGoodsService(RentGoodsService rentGoodsService) {
        this.rentGoodsService = rentGoodsService;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public NotificationService getNotificationService() {
        return notificationService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }
}
