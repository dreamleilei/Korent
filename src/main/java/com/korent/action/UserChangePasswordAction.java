package com.korent.action;

import com.korent.entity.User;
import com.korent.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lei on 15-9-8.
 */
public class UserChangePasswordAction extends ActionSupport {
    private UserService userService ;
    private String password;
    private String passwordAgain;

    public String execute() throws IOException {
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Integer id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        userService.changePassword(id, passwordAgain);
        out.write("yes");
        return null;
    }

    public String valPassword() throws IOException {
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Integer id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        User user = userService.getUserInformation(id);
        if (user.getPassword().equals(password)) {
            out.write("yes");
        } else {
            out.write("no");
        }
        return null;


    }

    public UserChangePasswordAction() {
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordAgain() {
        return passwordAgain;
    }

    public void setPasswordAgain(String passwordAgain) {
        this.passwordAgain = passwordAgain;
    }
}
