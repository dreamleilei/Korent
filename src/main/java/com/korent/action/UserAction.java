package com.korent.action;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.korent.entity.User;
import com.korent.service.UserService;
import com.korent.util.UserGson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.parser.JSONParser;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lei on 15-8-28.
 */
public class UserAction extends ActionSupport {
    private UserService userService;

    private Integer id;
    private String username;
    private String password;
    private String email;
    private String qq;
    private String phone;

    /*用户登录的action*/
    public String login() throws IOException {
        String dirUrl;
        Map<Object, Object> userMap = userService.getUserMap();
        if(!userMap.containsKey(username)){
            return INPUT;
        }
        if(!userMap.get(username).equals(password)){
            return ERROR;
        }
        ActionContext actionContext = ActionContext.getContext();
        Integer id = userService.getIdByName(username);
        actionContext.getSession().put("user",id);
        actionContext.getSession().put("name", username);
        User user = userService.getUserInformation(id);
        actionContext.getSession().put("headImage", user.getHeadPicture());
        if(null == ServletActionContext.getRequest().getSession().getAttribute("url")){
            dirUrl = "/index.jsp";
        }else {
            dirUrl = (String) ServletActionContext.getRequest().getSession().getAttribute("url");
        }

        System.out.println(dirUrl);
        System.out.println(ServletActionContext.getRequest().getSession().getAttribute("url"));
        ServletActionContext.getResponse().sendRedirect(dirUrl);
        ServletActionContext.getRequest().getSession().setAttribute("url", null);
        return null;
    }

    /*用户退出的action*/
    public String logout() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.setAttribute("user", null);
        session.setAttribute("url", null);
        session.setAttribute("name", null);
        session.setAttribute("headImage", null);
        /*ServletActionContext.getRequest().getSession().invalidate();*/
        ServletActionContext.getRequest().getSession().invalidate();
        return SUCCESS;
    }

    /*用户注册的action*/
    public String register() {
        Map<Object, Object> userMap = userService.getUserMap();
        if(userMap.containsKey(username)) {
            return INPUT;
        } else {
            User user = new User();
            user.setName(username);
            user.setPassword(password);
            user.setPhone(phone);
            user.setEmail(email);
            user.setQq(qq);
            System.out.println("do");
          //  User user = new User(username, password, phone, email, qq);
            userService.saveUser(user);
            return SUCCESS;
        }
    }

    /*用户获取个人信息*/
    public String getInformation() throws IOException {

        ServletActionContext.getRequest().setAttribute("userInfo", userService.information(getId()));
        ServletActionContext.getRequest().setAttribute("otherInfo", userService.getOtherInformation(getId()));
        return null;
    }

    /*获取个人信息*/
    public String getInformation1() throws IOException {
ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = UserGson.getGson();
        User user = userService.getUserInformation(id);
        Map hashMap = new HashMap();
        hashMap.put("user", user);
        out.write(gson.toJson(hashMap));
        return null;
    }

    /*获取用户的其它信息*/
    public String getOtherInformation() throws IOException {
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
         User user = userService.getUserInformation(id);
        String otherInfo = user.getOtherInformation();
        if(null == otherInfo){
            otherInfo = "";
        }
         out.write(otherInfo);
        return null;

    }


    /*用户修改信息的action*/
    public String changeInformation() {
        userService.changeInformation(id, phone, qq, email);
        return SUCCESS;
    }


    /*用户修改密码action*/
    public String changePassword() {
        userService.changePassword(id, password);
        return SUCCESS;
    }

    /*获得所有用户的action*/
    public String getUserList() throws IOException {

        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        Gson gson = new Gson();

        List<String> userNameList = userService.getUserList();
        String userList = gson.toJson(userNameList);

        out.write(userList);

        // ServletActionContext.getRequest().setAttribute("userList", userList);

        return null;
    }

    /*分页获取用户的订单*/
   /* public void validateRegister() {
        if (phone == null) {
        } else if(phone.length() != 11){
            addFieldError("phone", "电话号码格式不正确");
        }
    }*/

   /* @Override
    public void validate() {
        Pattern userPattern = Pattern.compile("^([_\\u4e00-\\u9fa5a-zA-Z0-9]+)$");
        Matcher matcher = userPattern.matcher(username);
        if(!matcher.matches()){
            addFieldError("username", "用户名格式不正确");
        }
    }*/
    public UserAction() {
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getId() {
        if(username == null || username.equals("")){
            return (Integer) ServletActionContext.getRequest().getSession().getAttribute("user");
        }
        return userService.getIdByName(username);
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
