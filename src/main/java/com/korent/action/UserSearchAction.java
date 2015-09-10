package com.korent.action;

import com.google.gson.Gson;
import com.korent.entity.RentGoods;
import com.korent.service.RentGoodsService;
import com.korent.service.UserService;
import com.korent.util.PageModel;
import com.korent.util.RentGson;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lei on 15-9-6.
 */
public class UserSearchAction {
    private RentGoodsService rentGoodsService;
    private UserService userService;
    private String keyWord;
    private Integer pageNo;
    private Integer pageSize;

    /*初始化页面信息*/
    public void init(){
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
    }

    public PageModel getPageModel(int pageCount) {
        return new PageModel(pageNo, pageSize, pageCount);
    }


    public String execute() throws IOException {

        init();
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = RentGson.getGson();
        List<RentGoods> list = rentGoodsService.getRentGoodsBySearchByPage(keyWord, pageNo, pageSize);
        Map<Object, Object> map = new HashMap<Object, Object>();
        PageModel pageModel = getPageModel(rentGoodsService.getRentGoodsBySearchPageCount(keyWord, pageSize));
        map.put("rent", list);
        map.put("pageModel", pageModel);
        out.write(gson.toJson(map));
        out.flush();
        out.close();
        return null;
    }

    public UserSearchAction() {
    }

    public RentGoodsService getRentGoodsService() {
        return rentGoodsService;
    }

    public void setRentGoodsService(RentGoodsService rentGoodsService) {
        this.rentGoodsService = rentGoodsService;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }
}

