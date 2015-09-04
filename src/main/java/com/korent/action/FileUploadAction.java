package com.korent.action;

import com.google.gson.Gson;
import com.korent.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lei on 15-8-31.
 */
public class FileUploadAction extends ActionSupport {
    private UserService userService;
    private File photo;
    private String savePath;
    private String photoContentType;
    private String photoFileName;
    private String returnDir;

    public File getPhoto() {
        return photo;
    }

    public void setPhoto(File photo) {
        this.photo = photo;
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

    public String getPhotoContentType() {
        return photoContentType;
    }

    public void setPhotoContentType(String photoContentType) {
        this.photoContentType = photoContentType;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }

    public String execute() throws Exception {
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Integer last = photoFileName.lastIndexOf('.');
        String type =photoFileName.substring(last);
        System.out.println(type);
        //Integer id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        System.out.println("yes" + ServletActionContext.getServletContext().getRealPath("/resource/uploadImage"));
       Integer  id=4;

        /*部署的时候需要用到的路径*/
        String deloyDir = ServletActionContext.getServletContext().getRealPath("/resource/uploadImage");

        String newName = "" + id +System.currentTimeMillis()+type;
        System.out.println(type);
        System.out.println(getSavePath() + "/" + getPhotoFileName());
        System.out.println("hello");
        System.out.println(newName);
        FileOutputStream fos = new FileOutputStream(deloyDir + "/" +newName);
        FileInputStream fis = new FileInputStream(photo);

        byte[] buffer = new byte[1024];
        int len;
        while ((len = fis.read(buffer)) != -1) {
            fos.write(buffer, 0, len);
        }
        fos.close();


        /*下面的代码是开发时候避免重复调用挪用写的*/
        FileOutputStream fosTest = new FileOutputStream(getSavePath() + "/" +newName);
        byte[] bufferTest = new byte[1024];
        int lenTest;
        while ((lenTest = fis.read(buffer)) != -1) {
            fosTest.write(bufferTest, 0, lenTest);
        }
        fosTest.close();



        Map map= new HashMap();
        map.put("savePath", getReturnDir() +"/" + newName);
        Gson gson = new Gson();
        System.out.println(gson.toJson(map));
        out.write(gson.toJson(map));

        return null;

    }


    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {

        this.userService = userService;
    }

    public String getReturnDir() {
        return  "./resource/uploadImage";
    }

    public void setReturnDir(String returnDir) {
        this.returnDir = returnDir;
    }
}
