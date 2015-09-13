package com.korent.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.korent.entity.RentGoods;
import com.korent.entity.User;
import com.korent.service.RentGoodsService;
import com.korent.service.UserService;
import com.korent.util.*;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.*;

/**
 * Created by lei on 15-8-28.
 */
public class RentGoodsAction extends ActionSupport {
    private RentGoodsService rentGoodsService;
    private UserService userService;
    private int pageSize  = 6;
    private int pageNo = 1;
    private String result ;
    private Integer rid;
    private String classify;

    List<RentGoods> list;


    public RentGoodsAction() {

    }

    /*初始化页面信息*/
    public void init(){
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
    }

    /*获取页面的Model*/

    public PageModel getPageModel(int pageCount) {
        return new PageModel(pageNo, pageSize, pageCount);
    }


    /*分页获取所有的租品*/   /*分类获取租品*/
    public String getAllRentGoods() throws IOException {
        init();
        Gson gson = RentGson.getGson();
        PageModel pageModel = null;
        PrintWriter out = ServletActionContext.getResponse().getWriter();

        /*如果类别为空,获取所有租品*/
        if(classify == null || classify.equals("") ) {
            System.out.println("classsify == null" + classify);
            list = rentGoodsService.getRentGoodsByPage(pageNo, pageSize);
           pageModel = getPageModel(rentGoodsService.getRentGoodsPage(pageSize));
        } else {    /*否则分类获取租品*/
            System.out.println(classify);
            list = rentGoodsService.getRentGoodsByClassifyByPage(classify, pageNo, pageSize);
             pageModel = getPageModel(rentGoodsService.getRentGoodsByClassifyPageCount(classify, pageSize));
            classify = null;

        }

        System.out.println(list);
        HashMap map = new HashMap();
        map.put("rent", list);
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        out.close();
        return null;
    }

 /*
    public String getRentGoodsByClassify() throws Exception {
        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = RentGson.getGson();
        list = rentGoodsService.getRentGoodsByClassifyByPage(classify, pageNo, pageSize);
        PageModel pageModel = getPageModel(rentGoodsService.getRentGoodsByClassifyPageCount(classify, pageSize));
        HashMap map = new HashMap();
        map.put("rent", list);
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        out.close();
        return null;

    } */

    /*根据用户查询租赁的租品*/
    public String getOrderRent() throws IOException {

        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = RentGson.getGson();
        list = userService.getOrderGoodsByPage(getId(), pageNo, pageSize);
        result = gson.toJson(list);
        Map<Object, Object> map = new HashMap<Object, Object>();
        PageModel pageModel = getPageModel(userService.getOrderGoodsCount(getId(), pageSize));
        map.put("rent", list);
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        out.flush();
        out.close();
        return null;
    }

    /*根据用户查询关注的租品*/
    public String getFollowRent() throws IOException {

        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = RentGson.getGson();
        list = userService.getFollowRentGoodsByPage(getId(), pageNo, pageSize);
        Set set = new HashSet();
        for(RentGoods rent : list){
            set.add(rent);
        }
        System.out.println(set);
        result = gson.toJson(list);
        PageModel pageModel = getPageModel(userService.getFollowGoodsCount(getId(), pageSize));
        HashMap map = new HashMap();
        map.put("rent", set);
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        System.out.println(gson.toJson(map));
        out.flush();
        out.close();
        return null;
    }

    /*根据用户查询发布的租品*/
    public String getSendRent() throws IOException {

        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = RentGson.getGson();
        PageModel pageModel = getPageModel(userService.getSendGoodsCount(getId(), pageSize));
        list = userService.getSendGoodsByPage(getId(), pageNo, pageSize);
        HashMap map = new HashMap();
        map.put("rent", list);
        map.put("pageModel", pageModel);
        System.out.println(pageModel);
        out.write(gson.toJson(map));
        out.flush();
        out.close();
        return null;
    }

    /*根据租品的id获取租品的详细信息*/
    public String getRentGoodsInfo() throws IOException {
        RentGoods rentGoods = rentGoodsService.getRentGoodsInfo(rid);
        Gson gson = RentGson.getGson();
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.write(gson.toJson(rentGoods));
        return null;
    }

    /*根据id获取用户预定者*/
    public String getRentGoodsOrder() throws Exception {
        RentGoods rentGoods = rentGoodsService.getRentGoodsInfo(rid);
        Gson gson = RentGson.getGson();
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Map map = new HashMap();
        User user = rentGoods.getOrderUser();
        if(user == null){
            map.put("orderUser", "");
        } else {
            map.put("orderUser", user.getId());
        }
        out.write(gson.toJson(map));
        return null;

    }

    public RentGoodsService getRentGoodsService() {
        return rentGoodsService;
    }


    public void setRentGoodsService(RentGoodsService rentGoodsService) {
        this.rentGoodsService = rentGoodsService;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public Integer getId() {
        return (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
        if(pageSize < 1) {
            this.pageSize = 5;
        }
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
        if(pageNo < 1){
            this.pageNo = 1;
        }


    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<RentGoods> getList() {
        return list;
    }

    public void setList(List<RentGoods> list) {

        this.list = list;
    }



    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }
}
