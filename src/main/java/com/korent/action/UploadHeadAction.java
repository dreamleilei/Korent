package com.korent.action;

import com.google.gson.Gson;
import com.korent.service.UserService;
import com.korent.util.OperateImage;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lei on 15-9-8.
 */
public class UploadHeadAction extends ActionSupport {
    private UserService userService;
    private OperateImage image;
    private String myPhotoPath;

    /**
     * 裁剪头像
     */
    public String execute() throws IOException {
  	String name = ServletActionContext.getServletContext().getRealPath(myPhotoPath);
        String newName = "";
        String [] photoPaths = myPhotoPath.split("/");
        for(int i = 0; i < photoPaths.length - 1; i++){
            newName += "/"  + photoPaths[i];
        }
        newName += "/head" + photoPaths[photoPaths.length - 1];
        image.setSrcpath(name);
        newName= newName.substring(1);
        image.setSubpath(ServletActionContext.getServletContext().getRealPath(newName));


        /*开发的时候用到的,测试的时候不用*/
        OperateImage imageTest = new OperateImage();
        imageTest.setHeight(image.getHeight());
        imageTest.setWidth(image.getWidth());
        imageTest.setX(image.getX());
        imageTest.setY(image.getY());
        imageTest.setSrcpath(name);
        imageTest.setSubpath(getSavePath() + newName);
        imageTest.cutImage();
//        imageTest.cut();



        /*部部署的时候留着*/
            image.cutImage();
        //    image.cut();


        Integer id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.updateHeadPath(id, newName);
        ServletActionContext.getRequest().getSession().setAttribute("headImage", newName);

        return null;
    }

    public OperateImage getImage() {
        return image;
    }

    public void setImage(OperateImage image) {
        this.image = image;
    }

    public String getMyPhotoPath() {
        return myPhotoPath;
    }

    public void setMyPhotoPath(String myPhotoPath) {
        this.myPhotoPath = myPhotoPath;
    }

    public String getSavePath(){
        return "/home/lei/JavaPractice/korent/Korent/src/main/webapp";
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
