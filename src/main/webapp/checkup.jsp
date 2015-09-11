<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-10
  Time: 下午2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  Object username = session.getAttribute("user");
  if(null == username){
    System.out.println(request.getRequestURI());
    response.sendRedirect("/userLogin.jsp");
    request.getSession().setAttribute("url", request.getRequestURI());
  }
%>

</body>
</html>
