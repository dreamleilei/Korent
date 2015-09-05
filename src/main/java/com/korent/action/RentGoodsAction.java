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
import com.korent.util.RentGson;
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
    private int pageSize  = 6;
    private int pageNo = 1;
    private int dataCount;
    private int pageCount ;
    private String result ;
    List<RentGoods> list;


    public RentGoodsAction() {

    }

    /*初始化页面信息*/
    public void init(){
        setDataCount();
        setPageCount();
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
    }

    /*生成页面信息*/
    public PageModel getPageModel() {
        return new PageModel(pageNo, pageSize, pageCount, dataCount);
    }


    /*分页获取所有的租品*/
    public String getAllRentGoods() throws IOException {
        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        list = rentGoodsService.getRentGoodsByPage(pageNo, pageSize);
        Gson gson = RentGson.getGson();

        PageModel pageModel = getPageModel();
        HashMap map = new HashMap();
        map.put("rent", list);
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        System.out.println(gson.toJson(map));
        out.close();
        return null;
    }

    /*根据用户查询租赁的租品*/
    public String getOrderRent() throws IOException {

        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = RentGson.getGson();
        list = userService.getOrderGoodsByPage(getId(), pageNo, pageSize);
        result = gson.toJson(list);
        Map<Object, Object> map = new HashMap<Object, Object>();
        PageModel pageModel = getPageModel();
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
        Gson gson = new GsonBuilder().setExclusionStrategies(new RentGoodsExclusionStrategy()).create();
        list = userService.getFollowRentGoodsByPage(getId(), pageNo, pageSize);
        result = gson.toJson(list);
        PageModel pageModel = getPageModel();
        HashMap map = new HashMap();
        map.put("rent", list);
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        out.flush();
        out.close();
        return null;
    }

    /*根据用户查询发布的租品*/
    public String getSendRent() throws IOException {

        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = RentGson.getGson();
        list = userService.getSendGoodsByPage(getId(), pageNo, pageSize);
        PageModel pageModel = getPageModel();
        HashMap map = new HashMap();
        map.put("rent", list);
        map.put("pageModel", pageModel);
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

    public int getDataCount() {
        return dataCount;
    }

    public void setDataCount() {
        this.dataCount = rentGoodsService.getAllRentGoods().size();
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

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount() {
        this.pageCount = dataCount % pageSize == 0 ? dataCount /pageSize : dataCount /pageSize + 1;

    }
}
