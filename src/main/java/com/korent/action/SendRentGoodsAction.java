package com.korent.action;

import com.korent.component.Address;
import com.korent.entity.RentGoods;
import com.korent.service.RentGoodsService;
import com.korent.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.Date;

/**
 * Created by lei on 15-9-3.
 */
public class SendRentGoodsAction extends ActionSupport {
    private RentGoodsService rentGoodsService;
    private UserService userService;
    private String province;
    private String country;
    private String city;
    private String district;
    private String classify;
    private String description;
    private String price;
    private String[] path;

    public String execute() {
        Address address = new Address(province,city, country, district);
        RentGoods rentGoods = new RentGoods(description, classify, address, price, new Date());
        for(String s:path){
            System.out.println(s);
            rentGoods.getPicturePathList().add(s);
        }
        Integer id = (Integer)ServletActionContext.getRequest().getSession().getAttribute("user");
        id = 4;
        userService.sendRentGoods(id, rentGoods);
        return SUCCESS;
    }

    public SendRentGoodsAction() {
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
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

    public String[] getPath() {
        return path;
    }

    public void setPath(String[] path) {
        this.path = path;
    }

    public void setUserService(UserService userService) {

        this.userService = userService;
    }

}
