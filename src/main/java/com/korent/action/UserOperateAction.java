package com.korent.action;

import com.korent.service.RentGoodsService;
import com.korent.service.UserService;
import org.apache.struts2.ServletActionContext;

/**
 * Created by lei on 15-9-6.
 */
public class UserOperateAction {
    private UserService userService;
    private RentGoodsService rentGoodsService;
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
    public String orderRent() {
        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        uid = 4;  //测试的时候默认uid为4
        userService.rentGoods(uid, rid);
        return null;
    }

    /*用户取消预定*/
    public String cancelRent(){
        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.cancelGoods(uid, rid);
        return null;
    }

    /*用户关注租品*/
    public String followGoods() {
        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.followGoods(uid, rid);
        return null;

    }
    /*用户取消关注租品*/
    public String cancelFollowGoods(){
        Integer uid = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.cancelFollowGoods(uid, rid);
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

}
