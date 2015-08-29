<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-8-29
  Time: 下午2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
</head>
<body>
<s:form method="POST" action="login" namespace="/korent" >
  <s:textfield name="username" key="user" />
  <s:textfield name="password" key="pass" />
  <s:submit />
</s:form>

<s:debug />
</body>
</html>
