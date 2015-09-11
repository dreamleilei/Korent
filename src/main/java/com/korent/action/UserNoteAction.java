package com.korent.action;

import com.korent.util.PageModel;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

/**
 * Created by lei on 15-9-11.
 */
public class UserNoteAction extends ActionSupport {
    private Integer uid;
    private Integer nid;
    private int pageNo = 1;
    private int pageSize = 6;
    public String readNote(){
        return null;
    }

    /*初始化页面信息*/
    public void init(){
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
    }

    /*获取页面的Model*/
    public PageModel getPageModel(int pageCount) {

        return new PageModel(pageNo, pageSize, pageCount);
    }

    public UserNoteAction() {
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
