<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>首页</title>
    <script type="text/javascript" src="/resource/js/jquery-2.1.1.js"></script>
    <link  href="/resource/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link href="/resource/js/bootstrap.js"  type="text/javascript" rel="stylesheet"/>
    <script src="/resource/js/transition.js"></script>
    <script src="/resource/js/dropdown.js"></script>
    <script src="/resource/js/collapse.js"></script>
    <style type="text/css">
        *{ margin: 0; padding: 0; text-decoration: none;}
        body { padding: 20px;}
        #con { width: 900px; height: 400px; border: medium none; overflow: hidden; position: relative; }
        #list {
            width:6300px;
            height: 600px;
            position: absolute;
            z-index: 1;
            top: 3px;

        }
        #list img { float: left;}
        #buttons { position: absolute; height: 10px; width: 100px; z-index: 2; bottom: 685px; left: 648px;}
        #buttons span { cursor: pointer; float: left; border: 1px solid #fff; width: 10px; height: 10px; border-radius: 50%; background: #333; margin-right: 5px;}
        #buttons .on {  background: orangered;}
        .arrow { cursor: pointer; display: none; line-height: 39px; text-align: center; font-size: 36px; font-weight: bold; width: 40px; height: 40px;  position: absolute; z-index: 2; top: 180px; background-color: RGBA(0,0,0,.3); color: #fff;}
        .arrow:hover { background-color: RGBA(0,0,0,.7);}
        #con:hover .arrow { display: block;}
        #prev { left: 20px; top:280px}
        #next { right: 20px; top:270px}

        body{
            background-image:url(resource/image/firstpage.jpg);
            background-repeat:no-repeat;
            background-size:100%;
            background-attachment:fixed;
        }

        div#container{width:1350px; height:2000px; margin-left:-20px;}
        div#header{width:1355px; height:90px;}
        div#header0 {width:200px; height: 90px; float:left; font-size:30px;}
        div#header1 {background-color:#0066FF; width:150px; height: 65px; float:left; font-size:30px; padding-left:625px; padding-top:25px; text-align:center}
        div#search{width:1300px;height: 20px;color:#FF0000; font-size:18px; font-weight:bold; padding-top:10px}
        div#message{width:1355px; height:1200px}
        div#menu {height:50px;width:1355px;}
        div#goodsplay{
            width: 1355px;
            height: 600px;
            background-image:url(resource/image/5.jpg);
            background-repeat:no-repeat;
            background-size:100%;
        }

        div#con{
            width: 1350px;
            height: 600px;
            background-color:;
        }

        div#picture{
            width: 1350px;
            height:1300px;
            background-color:;
            float:left;
            margin-top:20px;
        }
        div#p1{
            width:900px;
            height:600px;
            float:left;
        }
        div#p2{
            width:450px;
            height:300px;
            float:left;
        }


        div#p3{
            width:450px;
            height:300px;
            float:left;
        }
        div#p4{
            width:450px;
            height:451px;
            float:left;
            margin-top:10px;

        }
        div#p5{
            width:450px;
            height:451px;
            float:left;
            margin-top:10px;
        }
        div#p6{
            width:450px;
            height:451px;
            float:left;
            margin-top:10px;
        }

        div#chara{position:absolute; left:330px; top:230px; color:#FFFFFF; font-size:36px; font-weight:bold; width:700; height:300;}

        ul {margin:0; width:160px; height:224px;}
        .celan {
            text-align:center;
            list-style:none;
            border-top-style: groove;
            border-right-style: groove;
            border-bottom-style: groove;
            border-left-style: groove;
            border-top-color: #CCCCCC;
            border-right-color: #CCCCCC;
            border-bottom-color: #CCCCCC;
            border-left-color: #CCCCCC;
        }
        .href1{
            color:#FFFFFF;
            font-family:"黑体";
            text-decoration: none;
            font-weight:600;
        }

        a.href2:link{
            color:#FFFFFF;
            font-family:"Microsoft YaHei UI";
            font-size:24px;
            font-weight:500;
            text-decoration: none;
        }

        a.href2:visited{
            color:#FFFFFF;
            font-family:"Microsoft YaHei UI";
            font-size:24px;
            font-weight:500;
            text-decoration: none;
            position:relative;
            left:20px;
        }

        a.href2:hover{
            color:#FFFFFF;
            font-family:"Microsoft YaHei UI";
            font-size:24px;
            font-weight:500;
            text-decoration: none;
            position:relative;
            left:20px;
        }

        a.href2:active{
            color:#FFFFFF;
            font-family:"Microsoft YaHei UI";
            font-size:24px;
            font-weight:500;
            text-decoration: none;
            position:relative;
            left:20px;
        }

        #Layer13 {
            position:absolute;
            left:0px;
            top:780px;
            width:900px;
            height:600px;
            z-index:1;
            background-color:#000000;
            opacity:0.8;
            visibility: hidden;
        }

        #Layer14 {
            position:absolute;
            left:900px;
            top:780px;
            width:450px;
            height:300px;
            z-index:1;
            background-color:#000000;
            opacity:0.8;
            visibility: hidden;
        }

        #Layer3 {
            position:absolute;
            left:900px;
            top:1080px;
            width:450px;
            height:300px;
            z-index:1;
            background-color:#000000;
            opacity:0.8;
            visibility: hidden;
        }

        #Layer4 {
            position:absolute;
            left:0px;
            top:1390px;
            width:450px;
            height:450px;
            z-index:1;
            background-color:#000000;
            opacity:0.8;
            visibility: hidden;
        }

        #Layer5 {
            position:absolute;
            left:450px;
            top:1390px;
            width:450px;
            height:450px;
            z-index:1;
            background-color:#000000;
            opacity:0.8;
            visibility: hidden;
        }

        #Layer6 {
            position:absolute;
            left:900px;
            top:1390px;
            width:450px;
            height:450px;
            z-index:1;
            background-color:#000000;
            opacity:0.8;
            visibility: hidden;
        }

        #Layer7{
            text-align:center;
            font-family:"黑体";
            font-size:100px;
            font-weight:bold;
            color:#FFFFFF;
            position:absolute;
            left:310px;
            top:1000px;
            z-index:2;
            visibility: hidden;
        }

        #Layer8{
            text-align:center;
            font-family:"黑体";
            font-size:50px;
            font-weight:bold;
            color:#FFFFFF;
            position:absolute;
            left:1080px;
            top:900px;
            z-index:2;
            visibility: hidden;
        }

        #Layer9{
            text-align:center;
            font-family:"黑体";
            font-size:50px;
            font-weight:bold;
            color:#FFFFFF;
            position:absolute;
            left:1060px;
            top:1180px;
            z-index:2;
            visibility: hidden;
        }

        #Layer10{
            text-align:center;
            font-family:"黑体";
            font-size:60px;
            font-weight:bold;
            color:#FFFFFF;
            position:absolute;
            left:140px;
            top:1580px;
            z-index:2;
            visibility: hidden;
        }

        #Layer11{
            text-align:center;
            font-family:"黑体";
            font-size:60px;
            font-weight:bold;
            color:#FFFFFF;
            position:absolute;
            left:620px;
            top:1580px;
            z-index:2;
            visibility: hidden;
        }

        #Layer12{
            text-align:center;
            font-family:"黑体";
            font-size:60px;
            font-weight:bold;
            color:#FFFFFF;
            position:absolute;
            left:1060px;
            top:1580px;
            z-index:2;
            visibility: hidden;
        }

        #Layer1 {
            position:absolute;
            left:1200px;
            top:14px;
            width:140px;
            height:60px;
            z-index:1;
        }

        form {
            margin: 0;
        }
        #search_box {
            width: 500px;
            height: 60px;
            border: 2px solid #0066CC;
        }
        #search_box #s {
            float: left;
            padding: 0;
            margin-top:5px;
            margin-left:5px;
            width: 425px;
            height:45px;
            background: none;
            font-size:24px;
            color:#CCCCCC;
            font-family:"黑体";
            border-top: 0 none;
            border-right: 0 none;
            border-bottom: 0 none;
            border-left: 0 none;
        }
        #search_box #go {
            float: right;
            margin: 3px 4px 0 0;
        }

        .size{width:50px; height:50px;}
        #Layer2 {
            position:absolute;
            left:511px;
            top:26px;
            width:258px;
            height:50px;
            z-index:1;
        }

        #Layer100 {
            position:absolute;
            left:1200px;
            top:50px;
            width:175px;
            height:60px;
            font-size:24px;
            font-family:"Microsoft YaHei UI Light";
            z-index:1;
        }
        div#Layer100:link{
            position:absolute;
            left:1200px;
            top:50px;
            width:175px;
            height:60px;
            font-size:24px;
            font-family:"Microsoft YaHei UI Light";
            z-index:1;

        }
        div#Layer100:visited{
            position:absolute;
            left:1200px;
            top:50px;
            width:175px;
            height:60px;
            font-size:24px;
            font-family:"Microsoft YaHei UI Light";
            z-index:1;
        }
        div#Layer100:hover{
            position:absolute;
            left:1200px;
            top:50px;
            width:175px;
            height:60px;
            font-size:29px;
            font-family:"Microsoft YaHei UI Light";
            z-index:1;
        }
        div#Layer100:active{
            position:absolute;
            left:1200px;
            top:50px;
            width:175px;
            height:60px;
            font-size:29px;
            font-family:"Microsoft YaHei UI Light";
            z-index:1;
        }



    </style>
    <script type="text/javascript">

        window.onload = function () {
            var container = document.getElementById('container');
            var list = document.getElementById('list');
            var buttons = document.getElementById('buttons').getElementsByTagName('span');
            var prev = document.getElementById('prev');
            var next = document.getElementById('next');
            var index = 1;
            var len = 5;
            var animated = false;
            var interval = 3000;
            var timer;


            function animate (offset) {
                if (offset == 0) {
                    return;
                }
                animated = true;
                var time = 300;
                var inteval = 10;
                var speed = offset/(time/inteval);
                var left = parseInt(list.style.left) + offset;

                var go = function (){
                    if ( (speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left)) {
                        list.style.left = parseInt(list.style.left) + speed + 'px';
                        setTimeout(go, inteval);
                    }
                    else {
                        list.style.left = left + 'px';
                        if(left>-1355){
                            list.style.left = '-6775px';
                        }
                        if(left<(-6775)) {
                            list.style.left = '-1355px';
                        }
                        animated = false;
                    }
                }
                go();
            }

            function showButton() {
                for (var i = 0; i < buttons.length ; i++) {
                    if( buttons[i].className == 'on'){
                        buttons[i].className = '';
                        break;
                    }
                }
                buttons[index - 1].className = 'on';
            }

            function play() {
                timer = setTimeout(function () {
                    next.onclick();
                    play();
                }, interval);
            }
            function stop() {
                clearTimeout(timer);
            }

            next.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 5) {
                    index = 1;
                }
                else {
                    index += 1;
                }
                animate(-1355);
                showButton();
            }
            prev.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 1) {
                    index = 5;
                }
                else {
                    index -= 1;
                }
                animate(1355);
                showButton();
            }

            for (var i = 0; i < buttons.length; i++) {
                buttons[i].onclick = function () {
                    if (animated) {
                        return;
                    }
                    if(this.className == 'on') {
                        return;
                    }
                    var myIndex = parseInt(this.getAttribute('index'));
                    var offset = -1355 * (myIndex - index);

                    animate(offset);
                    index = myIndex;
                    showButton();
                }
            }

            container.onmouseover = stop;
            container.onmouseout = play;

            play();

        }
    </script>
    <script type="text/javascript">
        <!--
        function MM_reloadPage(init) {  //reloads the window if Nav4 resized
            if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
                document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
            else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
        }
        MM_reloadPage(true);

        function MM_findObj(n, d) { //v4.01
            var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
                d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
            if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
            for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
            if(!x && d.getElementById) x=d.getElementById(n); return x;
        }

        function MM_showHideLayers() { //v6.0
            var i,p,v,obj,args=MM_showHideLayers.arguments;
            for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
                if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
                obj.visibility=v; }
        }

        function MM_openBrWindow(theURL,winName,features) { //v2.0
            window.open(theURL,winName,features);
        }
        //-->
    </script>
</head>

<body>
<div id="Layer13" onclick="MM_openBrWindow('/rent.jsp?classify=%e6%88%bf%e5%b1%8b','','')" onmouseout="MM_showHideLayers('Layer7','','hide','Layer13','','hide')"></div>
<div id="Layer14" onclick="MM_openBrWindow('/rent.jsp?classify=%e4%b9%a6%e7%b1%8d','','')" onmouseout="MM_showHideLayers('Layer8','','hide','Layer14','','hide')"></div>
<div id="Layer3" onclick="MM_openBrWindow('/rent.jsp?classify=%e8%87%aa%e8%a1%8c%e8%bd%a6
','','')" onmouseout="MM_showHideLayers('Layer3','','hide','Layer9','','hide')"></div>
<div id="Layer4" onclick="MM_openBrWindow('/rent.jsp?classify=%e6%b1%bd%e8%bd%a6','','')" onmouseout="MM_showHideLayers('Layer4','','hide','Layer10','','hide')"></div>
<div id="Layer5" onclick="MM_openBrWindow('/rent.jsp?classify=%e6%9c%8d%e8%a3%85','','')" onmouseout="MM_showHideLayers('Layer5','','hide','Layer11','','hide')"></div>
<div id="Layer6" onclick="MM_openBrWindow('/rent.jsp?classify=%e5%a9%9a%e5%ba%86%e7%94%a8%e5%93%81','','')" onmouseout="MM_showHideLayers('Layer6','','hide','Layer12','','hide')"></div>

<div id="Layer7" onclick="MM_openBrWindow('/rent.jsp?classify=%e6%88%bf%e5%b1%8b','','')">房屋</div>
<div id="Layer8" onclick="MM_openBrWindow('/rent.jsp?classify=%e4%b9%a6%e7%b1%8d','','')">书籍</div>
<div id="Layer9" onclick="MM_openBrWindow('/rent.jsp?classify=%e8%87%aa%e8%a1%8c%e8%bd%a6','','')">自行车</div>
<div id="Layer10" onclick="MM_openBrWindow('/rent.jsp?classify=%e6%b1%bd%e8%bd%a6','','')">汽车</div>
<div id="Layer11" onclick="MM_openBrWindow('/rent.jsp?classify=%e6%9c%8d%e8%a3%85','','')">服装</div>
<div id="Layer12" onclick="MM_openBrWindow('/rent.jsp?classify=%e5%a9%9a%e5%ba%86%e7%94%a8%e5%93%81','','')">婚庆</div>

<div id="container">

    <div id="header">
        <div id="header0">
            <img src="resource/image/logo4.png" height="100" width="200" />
        </div>
    </div>
    <div id="menu">
        <div class="celan" style="float:left; width:270px; height:40px;"><a href="/userOrderGoods.jsp" class="href2">我的预订</a></div>
        <div class="celan" style="float:left; width:270px; height:40px;"><a href="/userSendGoods.jsp" class="href2">我的发布</a></div>
        <div class="celan" style="float:left; width:270px; height:40px;"><a href="/userFollowGoods.jsp" class="href2">我的关注</a></div>
        <div class="celan" style="float:left; width:270px; height:40px;"><a href="/send.jsp" class="href2">我要发布</a></div>
        <div class="celan" style="float:left; width:270px; height:40px;"><a href="/rent.jsp" class="href2">我要预订</a></div>
    </div>

    <div id="message">

        <div id="goodsplay">
            <div id="con">
                <div id="list" style="left: -1355px;">
                    <a href="/rent.jsp" ><img src="resource/image/大图室内.jpg" alt="1" width="1355" height="600"/></a>
                    <a href="/rent.jsp" ><img src="resource/image/1.jpg" alt="2" width="1355" height="600"/></a>
                    <a href="/rent.jsp" ><img src="resource/image/大图婚庆.jpeg" alt="3" width="1355" height="600"/></a>
                    <a href="/rent.jsp" ><img src="resource/image/4.jpg" alt="4" width="1355" height="600"/></a>
                    <a href="/rent.jsp" ><img src="resource/image/4.jpg" alt="5" width="1355" height="600"/></a>
                </div>
                <div id="buttons">
                    <span index="1" class="on"></span>
                    <span index="2"></span>
                    <span index="3"></span>
                    <span index="4"></span>
                    <span index="5"></span>    </div>
                <a href="javascript:;" id="prev" class="arrow">&lt;</a>
                <a href="javascript:;" id="next" class="arrow">&gt;</a>
            </div>
        </div>


        <div id="picture">
            <div id="p1">
                <img src="/resource/image/房屋.jpg" width="900" height="600" onmouseover="MM_showHideLayers('Layer13','','show','Layer7','','show')"/>
            </div>
            <div id="p2">
                <img src="/resource/image/书籍.jpg" width="450" height="300" onmouseover="MM_showHideLayers('Layer14','','show','Layer8','','show')"/>
            </div>
            <div id="p3">
                <img src="/resource/image/自行车.jpg" width="450" height="300" onmouseover="MM_showHideLayers('Layer3','','show','Layer9','','show')"/>
            </div>
            <div id="p4">
                <img src="/resource/image/汽车.jpg" width="450" height="451" onmouseover="MM_showHideLayers('Layer4','','show','Layer10','','show')"/>
            </div>
            <div id="p5">
                <img src="/resource/image/服装.jpg" width="450" height="451" onmouseover="MM_showHideLayers('Layer5','','show','Layer11','','show')"/>
            </div>
            <div id="p6">
                <img src="/resource/image/婚庆.jpg" width="450" height="451" onmouseover="MM_showHideLayers('Layer6','','show','Layer12','','show')"/>
            </div>

        </div>
    </div>
</div>

<div id="Layer1" hidden>
    <div class = "component-left" style="float:left">
        <img src="<%=session.getAttribute("headImage")%>" alt="..." class="img-circle" style=" width:60px; height:60px;">
    </div>
    <!-- Split button -->
    <div class="btn-group" style="float:left; width:40px; height:60px; padding-top:25px; margin-left:5px;">

        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" background-color:#0099CC; border-color:#00CC99;">
            <span class="caret"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" style="position:relative; top:0px; left:-125px; height:170px">
            <li><a href="/index.jsp">首页</a></li>
            <li><a href="/information.jsp">个人中心</a></li>
            <li><a href="/message.jsp">消息</a></li>
            <li><a href="/changePassword.jsp">修改密码</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/korent/logout.action">退出</a></li>
        </ul>
    </div>
    </div>


<div id="Layer2">
    <div id="search_box">
        <form method="post" action="#">
            <input type="text"  id="s" value="" class="swap_value" placeholder="酷租网" />
            <input type="image" class="size" id="go" title="Search" src="resource/image/search.jpg" alt="Search" align="middle" width="27" height="24" />
        </form>
    </div> </div>

<div id="Layer100" hidden>

    <a href="/userLogin.jsp" style="text-decoration:none" >登录</a>
</div>

</body>
<script type="text/javascript">
$(document).ready(function() {
$('#go').click(function(event){
event.preventDefault();
window.location.href="/userSearchGoods.jsp?keyWord=" + encodeURI($('#s').val());
});

    /*登录按钮的提示*/
    var temp = "<%=session.getAttribute("headImage")%>";
    if( temp == "null" || temp == "" || temp == undefined) {
        $('#Layer100').show();
    } else {
        $('#Layer1').show();
    }
});
</script>
</html>
