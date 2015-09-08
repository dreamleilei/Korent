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
    private String rid;


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

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }
}
