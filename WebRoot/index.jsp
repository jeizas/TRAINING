<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>人员安全质检系统</title>
	<meta http-equiv="pragma" content="no-cache">
	
	<link type="text/css" rel="stylesheet" href="css/reset.css" media="all">
	<link type="text/css" rel="stylesheet" href="css/main.css" media="all">	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	
	
<style type="text/css">
.login_tbody tr{
	height:35px;
}
body{
	background-color:#cfcdfc;
	margin:0;
	padding:0;
}
#login_tags li:hover{
	background-color:E0C717;
}
</style>
<script type="text/javascript">
	function loginCheck(){
		var t_name = document.getElementById("t_name").value;
		var t_certificate = document.getElementById("t_certificate").value;
		if(t_name == "" || t_certificate == ""){
			alert("用户名和密码不能为空！");
			return false;
		}else{
			document.loginForm.submit();
		}
	}
	function select_tag(click_obj,show_cont){
		var oli= document.getElementById("login_tags").getElementsByTagName("li");
		var oli_length=oli.length;
		for(var i=0; i<oli_length;i++){
			oli[i].className="";	
		}
		click_obj.className="on";
		for(i=0;i<oli_length;i++){
			var j=document.getElementById("tag_cont"+i);
			j.style.display="none";	
		}
		document.getElementById(show_cont).style.display="block";
		$("#errMeg").html(' ');
	}
</script>
</head>
  
<body>
<!--==========================header====================================-->
<header style="height:195px;width:100%;">
	<h1 class="title" >
    	大连市三类人员建筑安全培训系统
    </h1>
	<div class="hr_30">
        <div class="more">请先登录
    	</div>
    </div>
</header>
<!--==========================content================================-->
<section id="login_cont">
	<div class="main" >
    	<div class="login">
        	<div class="login_title">
            	<span style="margin:0 auto;position:absolute">登录</span>
            	<span id="errMeg" style="color:red;font-size:10px;float:right;margin-right:20px;">${error }</span>
            </div>
        	<ul id="login_tags">
            	<li class="on" onClick="select_tag(this,'tag_cont0')">三类人员</li>
            	<li onClick="select_tag(this,'tag_cont1')">培训教师</li>
            	<li onClick="select_tag(this,'tag_cont2')">企业副总</li>
            	<li onClick="select_tag(this,'tag_cont3')">监管人员</li>
            	<li onClick="select_tag(this,'tag_cont4')">系统管理员</li>
            </ul>
            <div id="tag_cont0">
            	<form method="post" id="login_form" action="login.do" name="loginForm" >
                	<div class="id_1">
                    	<span>姓名</span>
                    	<input type="hidden" name="flag" value="1" >
                        <input name="t_name" class="name_sanlei" type="text" id="t_name" value="输入姓名" onFocus="if(this.value=='输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_1">
                    	<span>安全许可证</span>
                        <input name="t_cerid" class="psd_sanlei" id="t_certificate" type="password" value="" >
                    </div>
                    <input type="button" value="点击登录" class="button1" onclick="loginCheck()">
                </form>
            </div>
            <div id="tag_cont1">
            	<form method="post" id="login_form" action="">
                	<div class="id_2">
                    	<span>教师编号:</span>
                        <input class="name_sanlei" type="text" value="请输入姓名" onFocus="if(this.value=='请输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_2">
                    	<span>密码:</span>&nbsp;&nbsp;
                        <input class="psd_sanlei" type="password" value="">
                    </div>
                    <input type="submit" value="点击登录" class="button1">
                </form>
            </div>
            <div id="tag_cont2">
            	<form method="post" id="login_form" action="">
                	<div class="id_3">
                    	<span>超级账号:</span>&nbsp;
                        <input class="name_sanlei" type="text" value="请输入姓名" onFocus="if(this.value=='请输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_3">
                    	<span>超级密码:</span>
                        <input class="psd_sanlei" type="password" value="">
                    </div>
                    <input type="submit" value="点击登录" class="button1">
                </form>
            </div>
            <div id="tag_cont3">
            	<form method="post" id="login_form" action="">
                	<div class="id_4">
                    	<span>监管用户:</span>
                        <input class="name_sanlei" type="text" value="请输入姓名" onFocus="if(this.value=='请输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_4">
                    	<span>密码:</span>&nbsp;&nbsp;
                        <input class="psd_sanlei" type="password" value="" >
                    </div>
                    <input type="submit" value="点击登录" class="button1">
                </form>
            </div>
            <div id="tag_cont4">
            	<form method="post" id="login_form" action="">
                	<div class="id_5">
                    	<span>管理账号:</span>
                        <input class="name_sanlei" type="text" value="请输入姓名" onFocus="if(this.value=='请输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_5">
                    	<span>密码:</span>&nbsp;&nbsp;
                        <input class="psd_sanlei" type="password" value="" >
                    </div>
                    <input type="submit" value="点击登录" class="button1">
                </form>
            </div>
        </div>
    </div>
</section>
<!--=========================footer================================-->
<footer>
	<div class="footer_info_top">
    	<div class="main">
        	<div class="info_item_container">
            </div>
            
        </div>
    </div>
    <div class="footer_info_bot">
    	<p class="p2">大连市三类人员建筑安全培训系统！ <br></p>
    </div>
</footer>
</body>
</html>
