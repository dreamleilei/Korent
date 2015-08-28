package com.korent.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by lei on 2015/8/25.
 */
@Entity
@Table(name ="admin")
public class Admin implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name ="aid")
    private Integer id;

    @Column(name="name", length = 20, unique=true,nullable=false)
    private String name;

    @Column(name="password",length=40,nullable=false)
    private String password;


    public Admin() {
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }
}
