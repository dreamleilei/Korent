package com.korent.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class CodeAction extends ActionSupport {

    //ajax检查验证码
    public void  checkCheckCode() throws Exception {

        //获得提交参数值
        String myCheckCode = ServletActionContext.getRequest().getParameter("code");

        //获得session中存放的实际验证码
        HttpSession session = ServletActionContext.getRequest().getSession();
        String checkCode =(String)session.getAttribute("code");

        //比较,正确返回1,不正确返回0
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        if(checkCode.equals(myCheckCode))
        {
            out.print(1);
        }
        else
        {
            out.print(0);
        }
        out.close();
       // return SUCCESS;
    }
    public void createCheckCode() throws Exception {
        //设置页面不缓存
        ServletActionContext.getResponse().setHeader("Pragma", "No-cache");
        ServletActionContext.getResponse().setHeader("Cache-Control", "no-cache");
        ServletActionContext.getResponse().setDateHeader("Expires", 0);

        // 在内存中创建图象,设置最后生成的验证码图片的大小
        int width = 60, height = 20;
        //生成内存中的图像
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //生成随机类
        Random random = new Random();

        // 获取图形上下文
        Graphics g = image.getGraphics();


        // 设定背景色
        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);

        //GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();

        //	String fontNames[] = ge.getAvailableFontFamilyNames();
        //
        //	int fontNumber = fontNames.length;
        //	int randInt = random.nextInt(fontNumber);
        //
        //    //设定字体
        //    g.setFont(new Font(fontNames[randInt], Font.PLAIN, 18));
        g.setFont(new Font("隶书",Font.ITALIC+Font.BOLD,18));
        //设定随机字体

        //画边框
        g.setColor(new Color(33,66,99));
        g.drawRect(0,0,width-1,height-1);




        // 随机产生50条干扰线，使图象中的认证码不易被其它程序探测到
        g.setColor(getRandColor(100, 150));
        for (int i = 0; i < 50; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }


        // 取随机产生的认证码(4位数字)
        String sRand = "";
        for (int i = 0; i < 4; i++) {
            String rand = String.valueOf(random.nextInt(10));
            sRand += rand;

            // 将认证码显示到图象中
            //设置字体颜色
            g.setColor(this.getRandColor(40,60));
            g.drawString(rand, 13 * i + 6, 16);
        }

        // 将认证码存入SESSION
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.setAttribute("code", sRand);

        //释放图形上下文
        g.dispose();

        // 输出图象到页面
        ImageIO.write(image, "JPEG", ServletActionContext.getResponse().getOutputStream());
       // return SUCCESS;
    }


    //给定范围获得随机颜色
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

}