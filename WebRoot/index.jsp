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
input{
	border:none;
	margin:0;
	padding:0;
	outline:0;
}
</style>
	
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
	function loginCheck(i){
		var t_name = $("#t_name"+i+"").val();
		var t_certificate = $("#t_cerid"+i+"").val();
		/* var t_name = document.getElementById(""+name+"").value;
		var t_certificate = document.getElementById(""+id+"").value; */
		if(t_name == "" || t_certificate == ""){
			alert("用户名和密码不能为空！");
			return false;
		}else{
			if(i == 0) document.loginForm0.submit();
			if(i == 1) document.loginForm1.submit();
			if(i == 2) document.loginForm2.submit();
			if(i == 3) document.loginForm3.submit();
			if(i == 4) document.loginForm4.submit();
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
            </div>
        	<ul id="login_tags">
            	<li id="tag_cont0cla" class="on" onClick="select_tag(this,'tag_cont0')">三类人员</li>
            	<li id="tag_cont1cla" onClick="select_tag(this,'tag_cont1')">培训教师</li>
            	<li id="tag_cont2cla" onClick="select_tag(this,'tag_cont2')">企业副总</li>
            	<li id="tag_cont3cla" onClick="select_tag(this,'tag_cont3')">监管人员</li>
            	<li id="tag_cont4cla" onClick="select_tag(this,'tag_cont4')">系统管理员</li>
            </ul>
            <!-- threeMan login -->
            <div id="tag_cont0">
            	<form method="post" action="login.do" name="loginForm0" >
                	<div class="id_1">
                    	<span>姓名</span>
                    	<input type="hidden" name="flag" value="0" >
                        <input name="t_name" id="t_name0" class="name_sanlei" type="text" value="输入姓名" onFocus="if(this.value=='输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_1">
                    	<span>安全许可证</span>
                        <input name="t_cerid" id="t_cerid0" class="psd_sanlei" type="password" value="" >
                        <span  style="color:red;font-size:10px;float:right;">${error0 }</span>
                    </div> 
                    <input type="button" value="点击登录" class="button1" onclick="loginCheck(0)">
                </form>
            </div>
            <!-- teacher login -->
            <div id="tag_cont1">
            	<form method="post"action="login.do" name="loginForm1">
                	<div class="id_2">
                    	<span>教师编号:</span>
                    	<input type="hidden" name="flag" value="1" >
                        <input name="t_name" id="t_name1" class="name_sanlei" type="text" value="请输入姓名" onFocus="if(this.value=='请输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_2">
                    	<span>密码:</span>&nbsp;&nbsp;
                        <input name="t_cerid" id="t_cerid1" class="psd_sanlei" type="password" value="">
                        <span  style="color:red;font-size:10px;float:right;">${error1 }</span>
                    </div>
                    
                    <input type="button" value="点击登录" class="button1" onclick="loginCheck(1)">
                </form>
            </div>
            <!-- president login -->
            <div id="tag_cont2">
            	<form method="post"  action="login.do" name="loginForm2">
                	<div class="id_3">
                    	<span>超级账号:</span>
                    	<input type="hidden" name="flag" value="2" >
                        <input name="t_name"id="t_name2" class="name_sanlei" type="text" value="请输入姓名" onFocus="if(this.value=='请输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_3">
                    	<span>超级密码:</span>
                        <input name="t_cerid" id="t_cerid2" class="psd_sanlei" type="password" value="">
                        <span  style="color:red;font-size:10px;float:right;">${error2 }</span>
                    </div>
                    <input type="button" value="点击登录" class="button1" onclick="loginCheck(2)">
                </form>
            </div>
            <!-- regulators login -->
            <div id="tag_cont3">
            	<form method="post"  action="login.do" name="loginForm3">
                	<div class="id_4">
                    	<span>监管用户:</span>
                    	<input type="hidden" name="flag" value="3" >
                        <input name="t_name" name="t_name3" class="name_sanlei" type="text" value="请输入姓名" onFocus="if(this.value=='请输入姓名')this.value=''" onBlur="if(this.value=='') this.value='请输入姓名'">
                    </div>
                	<div class="psd_4">
                    	<span>密码:</span>&nbsp;&nbsp;
                        <input name="t_cerid" id="t_cerid3" class="psd_sanlei" type="password" value="" >
                        <span  style="color:red;font-size:10px;float:right;">${error3 }</span>
                    </div>
                    <input type="button" value="点击登录" class="button1" onclick="loginCheck(3)">
                </form>
            </div>
            <!-- admin login -->
            <div id="tag_cont4">
            	<form method="post"  action="login.do" name="loginForm4">
                	<div class="id_5">
                    	<span>管理账号:</span>
                        <input name="t_name" name="t_name4" class="name_sanlei" type="text" value="请输入管理员账号" onFocus="if(this.value=='请输入管理员账号')this.value=''" onBlur="if(this.value=='') this.value='请输入管理员账号'">
                   		<input type="hidden" name="flag" value="4" >
                    </div>
                	<div class="psd_5">
                    	<span>密码:</span>&nbsp;&nbsp;
                        <input name="t_cerid" id="t_cerid4" class="psd_sanlei" type="password" value="" >
                        <span  style="color:red;font-size:10px;float:right;">${error4 }</span>
                    </div>
                    <input type="button" value="点击登录" class="button1" onclick="loginCheck(4)">
                </form>
            </div>
        </div>
    </div>
</section>
<!--=========================footer================================-->
<footer>
    <div class="footer_info_bot">
    	<p class="p2">大连市三类人员建筑安全培训系统！ <br></p>
    </div>
</footer>
</body>
<script>
	if("${curTag}"){
		var d = document.getElementById("${curTag}cla");
		select_tag(d,"${curTag}");
	}
/* 	if(${curTag} != "" || ${curTag} != null){
		for(var i=0;i<5;i++){
			document.getElementById('tag_cont'+i).style.display="none";
		}
		document.getElementById('tag_cont2').style.display="block";
	} */
</script>
</html>
