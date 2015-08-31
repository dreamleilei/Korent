package com.korent.action;

import com.korent.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 * Created by lei on 15-8-31.
 */
public class FileUploadAction extends ActionSupport {
    private UserService userService;
    private File upload;
    private String savePath;
    private String uploadContentType;
    private String uploadFileName;

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getSavePath() {
        System.out.println(ServletActionContext.getServletContext().getContextPath());
       /* System.out.println("hello wrold");*/
        String realReturn = ServletActionContext.getRequest().getServletContext().getRealPath("/") + "/resource/uploadImage" ;
        return "/home/lei/JavaPractice/korent/Korent/src/main/webapp/resource/uploadImage";
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String execute() throws Exception {
        FileOutputStream fos = new FileOutputStream(getSavePath() + "/" + getUploadFileName());
        FileInputStream fis = new FileInputStream(getUpload());
        byte[] buffer = new byte[1024];
        int len;
        while ((len = fis.read(buffer)) != -1) {
            fos.write(buffer, 0, len);
        }
        return SUCCESS;

    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
