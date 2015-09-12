package com.korent.entity;

import com.korent.component.Address;
import com.korent.kenum.GoodsStatus;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lei on 2015/8/25.
 */

@Entity
@Table(name="rent")
public class RentGoods implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="rid")
    private Integer id;

    @Column(name="description", length=3000,nullable=false)
    private String description;          //租品的简单描述

    @Column(name="classify",length=255,nullable=false)
    private String classify;

    @Column(name="address",nullable=false)
    private Address address;

    @Enumerated(EnumType.ORDINAL)
    private GoodsStatus status = GoodsStatus.CanOrder;

    @Column(name="priceDescription",length=30,nullable=true)
    private String price;

    @Temporal(TemporalType.DATE)
    @Column(name="updateDate")
    private Date updateDate = new Date();      //该属性描述租品状态最新的更新时间

    /*记录租品的图片的存储路径*/
    @ElementCollection(targetClass=String.class)
    @CollectionTable(name="picturePath", joinColumns=@JoinColumn(name="rid", referencedColumnName="rid", nullable=false))
    @OrderColumn(name="id")
    @Column(name="path")
    private List<String> picturePathList = new ArrayList<String>();

    /*通过双向的管连映射，实现租品被关注功能*/
    @ManyToMany
    @JoinTable(name="follow",
    joinColumns=@JoinColumn(name="rid", referencedColumnName="rid"),
    inverseJoinColumns=@JoinColumn(name="uid", referencedColumnName="uid"))
    private List<User> follower = new ArrayList<User>();

    @ManyToOne(targetEntity=User.class)
    @JoinColumn(name="orderId", referencedColumnName="uid")
    private User orderUser;                      //记录该租品的预定者

    @ManyToOne(targetEntity=User.class)
    @JoinColumn(name="ownerId", referencedColumnName="uid")
    private User owner;             //记录改该租品的发布者

    public RentGoods() {
    }

    public RentGoods(String description, String classify, Address address, String price, Date updateDate) {
        this.description = description;
        this.classify = classify;
        this.address = address;
        this.status = status;
        this.price = price;
        this.updateDate = updateDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RentGoods)) return false;

        RentGoods rentGoods = (RentGoods) o;

        if (!id.equals(rentGoods.id)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public GoodsStatus getStatus() {
        return status;
    }

    public void setStatus(GoodsStatus status) {
        this.status = status;
    }

    public List<String> getPicturePathList() {
        return picturePathList;
    }

    public void setPicturePathList(List<String> picturePathList) {
        this.picturePathList = picturePathList;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public List<User> getFollower() {
        return follower;
    }

    public void setFollower(List<User> follower) {
        this.follower = follower;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {

        this.address = address;
    }

    public User getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(User orderUser) {
        this.orderUser = orderUser;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {

        this.owner = owner;
    }

}

