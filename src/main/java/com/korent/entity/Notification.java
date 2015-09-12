package com.korent.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by lei on 2015/8/25.
 */

@Entity
@Table(name="notify")
public class Notification implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="nid")
    private Integer id;

    @Column(name="ToId",nullable=false)
    private Integer ToId;                //该属性记录要给谁发送通知，为用户的id

    @Column(name="content",length =255,nullable=false)
    private String content;              //发送通知的内容

    @Column(name="status",nullable=false)
    private Integer status = 0;              //消息的状态，默认为0未读，已读为1

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="initDate", nullable=true)
   private  Date date = new Date();

    public Notification() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getToId() {
        return ToId;
    }

    public void setToId(Integer toId) {
        ToId = toId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Notification)) return false;

        Notification that = (Notification) o;

        if (!ToId.equals(that.ToId)) return false;
        if (!id.equals(that.id)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + ToId.hashCode();
        return result;
    }
}
