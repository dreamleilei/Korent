package com.korent.entity;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lei on 2015/8/25.
 */

@Entity
@Table(name="user")
public class User {

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

    @OneToMany(targetEntity=RentGoods.class)
    @JoinColumn(name="uid", referencedColumnName="uid")
    List<RentGoods> order = new ArrayList<RentGoods>();

    /*通过双向的关联映射，实现用户关注租品的功能*/
    @ManyToMany(targetEntity=RentGoods.class)
    @JoinTable(name="follow",
            joinColumns=@JoinColumn(name="uid", referencedColumnName="uid"),
            inverseJoinColumns=@JoinColumn(name="rid", referencedColumnName="rid")
    )
    private List<RentGoods> follow = new ArrayList<RentGoods>();

    public User() {
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
}
