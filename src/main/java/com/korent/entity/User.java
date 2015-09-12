package com.korent.entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lei on 2015/8/25.
 */

@Entity
@Table(name="user")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="uid")
    private Integer id;

    @Column(name="name", unique=true, length=20,nullable=false)
    private String name;

    @Column(name="password", length=40, nullable=false)
    private String password;

    @Column(name="phone", length=16)
    private String phone;

    @Column(name="email", length=30, nullable=false)
    private String email;

    @Column(name="qq",length=20)
    private String qq;

    @Column(name="otherInformation")
    private String otherInformation;

    @Column(name = "headPicture")
    private String headPicture = "/resource/uploadImage/defaultHead.jpg";

    @OneToMany(targetEntity=RentGoods.class)
    @JoinColumn(name="orderId", referencedColumnName="uid")
    List<RentGoods> order = new ArrayList<RentGoods>();

    /*通过双向的关联映射，实现用户关注租品的功能*/
    @ManyToMany(targetEntity=RentGoods.class )
    @JoinTable(name="follow",
            joinColumns=@JoinColumn(name="uid", referencedColumnName="uid"),
            inverseJoinColumns=@JoinColumn(name="rid", referencedColumnName="rid")
    )
    private List<RentGoods> follow = new ArrayList<RentGoods>();

    @OneToMany(targetEntity=RentGoods.class, orphanRemoval =true)
    @JoinColumn(name="ownerId", referencedColumnName="uid")
    private List<RentGoods> send = new ArrayList<RentGoods>();

    public User() {
    }

    public User(String name, String password, String phone, String email, String qq) {
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.qq = qq;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer uid) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public List<RentGoods> getFollow() {
        return follow;
    }

    public void setFollow(List<RentGoods> follow) {
        this.follow = follow;
    }

    public List<RentGoods> getOrder() {
        return order;
    }

    public void setOrder(List<RentGoods> order) {
        this.order = order;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<RentGoods> getSend() {
        return send;
    }

    public void setSend(List<RentGoods> send) {

        this.send = send;
    }

    public String getOtherInformation() {
        return otherInformation;
    }

    public void setOtherInformation(String otherInformation) {

        this.otherInformation = otherInformation;
    }

    public void setHeadPicture(String headPicture) {
        this.headPicture = headPicture;
    }

    public String getHeadPicture() {
        return headPicture;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (!id.equals(user.id)) return false;
        if (!name.equals(user.name)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + name.hashCode();
        return result;
    }
}

