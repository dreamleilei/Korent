<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>hello</h1>
<%--
<s:action name="getInformation" namespace="/korent" />
<s:property value="#session.user" />
<s:property value="#request.userInfo" />
--%>
<a href="/information.jsp" ><input type="button" value="goTo" /></a>
<s:debug />
</body>
<script type="text/javascript" >
    function onclick() {
        location.assign("/korent/goToLogin.action");
    }
</script>
</html>
