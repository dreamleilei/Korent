package com.korent.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.korent.entity.RentGoods;
import com.korent.service.RentGoodsService;
import com.korent.service.UserService;
import com.korent.util.PageModel;
import com.korent.util.RentGoodsExclusionStrategy;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-8-28.
 */
public class RentGoodsAction extends ActionSupport {
    private RentGoodsService rentGoodsService;
    private UserService userService;
    private String result = "";
    private Integer id;
    private int pageSize  = 5;
    private int pageNo = 1;
    private int dataCount = 1;
    private List<RentGoods> list ;
    private PageModel pageModel;



    public RentGoodsAction() {
    }

    /*根据用户查询租赁的租品*/
    public String getOrderRent() throws IOException {

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = new GsonBuilder().setExclusionStrategies(new RentGoodsExclusionStrategy()).create();
        list = userService.getOrderGoodsByPage(getId(), pageNo, pageSize);
        result = gson.toJson(list);
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("rent", list);
        map.put("pageCount", 3);
        out.write(gson.toJson(map));
        out.flush();
        out.close();
        return null;
    }

    /*根据用户查询关注的租品*/
    public String getFollowRent() throws IOException {

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = new GsonBuilder().setExclusionStrategies(new RentGoodsExclusionStrategy()).create();
        list = userService.getFollowRentGoodsByPage(getId(), pageNo, pageSize);
        result = gson.toJson(list);
        out.write(result);
        out.flush();
        out.close();
        return null;
    }

    /*根据用户查询发布的租品*/
    public String getSendRent() throws IOException {

        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = new GsonBuilder().setExclusionStrategies(new RentGoodsExclusionStrategy()).create();
        list = userService.getSendGoodsByPage(getId(), pageNo, pageSize);
        result = gson.toJson(list);
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("rent", list);
        map.put("pageCount", 3);
        out.write(gson.toJson(map));
        out.flush();
        out.close();
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

    public void setId(Integer id) {
        this.id = id;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getDataCount() {
        return dataCount;
    }

    public void setDataCount(int dataCount) {
        this.dataCount = dataCount;
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

    public PageModel getPageModel() {
        return pageModel;
    }

    public void setPageModel(PageModel pageModel) {
        this.pageModel = pageModel;
    }
}
