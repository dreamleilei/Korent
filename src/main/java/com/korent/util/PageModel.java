package com.korent.util;

public class PageModel<T>{

    private int pageNo;//第几页
    private int pageSize;//一页显示多少条记录
    private int pageCount;//总页数
    private int dataCount;//总记录数

    public int getPageCount()
    {
        pageCount=(dataCount-1)/pageSize+1;
        return pageCount;
    }
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
    public void setDataCount(int dataCount) {
        this.dataCount = dataCount;
    }
    public int getDataCount() {
        return dataCount;
    }
    //获得第一页
    public int getFirstPage()
    {
        return 1;
    }

    //获得最后一页
    public int getLastPage()
    {
        return this.getPageCount();
    }
    //获得上一页
    public int getPrevPage()
    {
        if(pageNo>1) return pageNo-1;
        else return 1;
    }
    //获得下一页
    public int getNextPage()  //默认值总是为零
    {
        if(pageNo<this.getPageCount())
            return	pageNo+1;
        else
            return this.getPageCount();
    }
    public int getPageNo() {
        if(pageNo<1) pageNo=1;
        if(pageNo>this.getPageCount()) pageNo=this.getPageCount();
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

    public PageModel(int pageNo, int pageSize, int pageCount, int dataCount) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.pageCount = pageCount;
        this.dataCount = dataCount;
    }

    public PageModel(int pageNo, int pageSize, int pageCount) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.pageCount = pageCount;
    }

    public PageModel() {
    }
}