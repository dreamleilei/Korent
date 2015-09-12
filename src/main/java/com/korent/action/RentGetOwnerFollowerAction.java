package com.korent.action;

import com.google.gson.Gson;
import com.korent.entity.RentGoods;
import com.korent.service.RentGoodsService;
import com.korent.util.RentOwnerFollowerGson;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lei on 15-9-8.
 */
public class RentGetOwnerFollowerAction {
    private RentGoodsService rentGoodsService;
    private Integer rid;


    public String execute() throws IOException {
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        RentGoods  rentGoods = rentGoodsService.getRentGoodsInfo(rid);
        Gson gson = RentOwnerFollowerGson.getGson();
        out.write(gson.toJson(rentGoods));
        System.out.println(gson.toJson(rentGoods));
        return null;
    }
    public RentGetOwnerFollowerAction() {
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public RentGoodsService getRentGoodsService() {
        return rentGoodsService;
    }

    public void setRentGoodsService(RentGoodsService rentGoodsService) {
        this.rentGoodsService = rentGoodsService;
    }
}
