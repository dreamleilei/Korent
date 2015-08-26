package com.korent.component;

import com.korent.entity.RentGoods;
import com.korent.entity.User;
import org.hibernate.annotations.Parent;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Created by lei on 2015/8/25.
 */

/*作为租品的组件,记录租品的地址*/
@Embeddable
public class Address {

    @Column(name="province",length=20,nullable=false)
    private String province;

    @Column(name="city",length=20,nullable=false)
    private String city;

    @Column(name="country",length=20,nullable=false)
    private String country;

    @Column(name="district",length=20,nullable=false)
    private String district;

    @Parent
    private RentGoods owner;

    public Address() {
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public RentGoods getOwner() {
        return owner;
    }

    public void setOwner(RentGoods owner) {
        this.owner = owner;
    }
}
