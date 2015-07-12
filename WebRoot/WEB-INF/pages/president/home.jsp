<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	
	<link type="text/css" rel="stylesheet" href="css/reset.css" media="all">
	<link type="text/css" rel="stylesheet" href="css/main.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>

</head>
  
<body>
<header>
	<h1 class="title">
    	大连市三类人员建筑安全培训系统
    </h1>
	<div class="hr_30">
		<nav class="action_class">
        	<h3>操 作 面 板</h3>
        </nav>
        <nav class="action_class" style="width:62.78%;">
        	<h3>操作主界面</h3>
        </nav>
        <div class="more">欢迎您，${loginUser.name }
    		<div class="more_action" style="z-index:1001;background-color:#23F； ">
        		<a href="javascript:;">个人空间</a>
        		<a href="javascript:;">修改信息</a>
        		<a href="logout.do">退出登录</a>
        	</div>
    	</div>
    </div>
</header>
<!--========================= section =============================-->
<div class="hr_500" style=" background-color: rgb(245, 246, 248);">
	<div class="easyui-resizable" data-options="minWidth:50,minHeight:50" style="width: 298px; height: 702px; border: 1px solid rgb(204, 204, 204); left: 0px; top: 0px; background-color: rgb(238, 238, 238);">
		<div style="padding:20px">
        	<ul id="nav_tags">
        		<li class="on" onClick="select_tag(this,'tag_cont0')">首页</li>
            	<li onClick="select_tag(this,'tag_cont4')">网上报名</li>
            	<li onClick="select_tag(this,'tag_cont1')">修改信息</li>
            	<li onClick="select_tag(this,'tag_cont2')">查看进度</li>
            	<li onClick="select_tag(this,'tag_cont3')">注销账号</li>
            </ul>
        </div>
	</div>
	<div id="dd" class="easyui-draggable easyui-resizable" data-options="handle:&#39;#mytitle&#39;" style="width:846px; height: 700px; border: 1px solid rgb(204, 204, 204); position: absolute; left: 300px; top: 196px; background-color: rgb(245, 246, 248);">
		<div id="mytitle" style="padding: 5px; background: rgb(221, 221, 221);">欢迎企业副总登陆</div>
		<div style="padding:20px;">
			<div id="tag_cont0" class="content_right" style="height:600px; width:100%; border:none;">
        		 首页内容
        	</div>
        	<div id="tag_cont4" class="content_right" style="height:600px; width:100%; border:none;">   
        		网上报名    
        		<button id="testAjax">测试ajax</button>		 
        	</div>
            <div id="tag_cont1" class="content_right" style="height:600px; width:100%; border:none; display:none;">
        		<!-- <span>------当前位置:修改信息--欢迎登录------</span> -->
        		<span style="float:right;color:red;" >${message }</span>
        		<!-- 点击修改人员信息 -->
                <form action="editThreeMan.do" name="modifyForm" method="post">
                		<div class="label_name" style="padding-top:10px;">
			 	 			<div style=" float:left; padding-right:100px;">
								<label>姓名</label>
								<input  type="text" name="threeMan.name" value="${loginUser.name }">
								<input type="hidden" name="threeMan.id" value="${loginUser.id }">
							</div>
							<div>
								<label>类型</label>
								<input  type="text" name="threeMan.type" value="${loginUser.type }">
							</div>
						</div>
                		<div class="label_name">
			 	 			<div style=" float:left; padding-right:100px;">
								<label>所属公司</label>
								<input  type="text" name="threeMan.companyid" value="${loginUser.companyid }">
							</div>
							<div>
								<label>身份证</label>
								<input  type="text" name="threeMan.indefication" value="${loginUser.indefication}">
							</div>
						</div>
                		<div class="label_name">
			 	 			<div style=" float:left; padding-right:100px;">
								<label>性别</label>
								<input  type="text" name="threeMan.sex" value="${loginUser.sex }">
							</div>
							<div>
								<label>出生日期</label>
								<input  type="text" name="threeMan.birthday" value="<fmt:formatDate value="${loginUser.birthday}" type="date" />" >
							</div>
						</div>
                		<div class="label_name">
			 	 			<div style=" float:left; padding-right:100px;">
								<label>职务</label>
								<input  type="text" name="threeMan.duty" value="${loginUser.duty }">
							</div>
							<div>
								<label>职称</label>
								<input  type="text" name="threeMan.title" value="${loginUser.title }">
							</div>
						</div>
                		<div class="label_name">
			 	 			<div style=" float:left; padding-right:100px;">
								<label>学历</label>
								<input  type="text" name="threeMan.degress" value="${loginUser.degress }">
							</div>
							<div>
								<label>发证日期</label>
								<input  type="text" name="threeMan.issus_date"  value="<fmt:formatDate value="${loginUser.issus_date }" pattern="yyyy-MM-dd" /> " >
							</div>
						</div>
                		<div class="label_name">
			 	 			<div style=" float:left; padding-right:100px;">
								<label>有效期起</label>
								<input  type="text" name="threeMan.start_date" value="<fmt:formatDate value="${loginUser.start_date }" type="date"/>" >
							</div>
							<div>
								<label>有效期迄</label>
								<input  type="text" name="threeMan.final_date" value="<fmt:formatDate value="${loginUser.final_date }" type="date"/>" >
							</div>
						</div>
                		<div class="label_name">
			 	 			<div style=" float:left; padding-right:100px;">
								<label>发证机关</label>
								<input  type="text" name="threeMan.authority" value="${loginUser.authority }" >
							</div>
							<div>
								<label>证件号码</label>
								<input  type="text" name="threeMan.certificate" value="${loginUser.certificate }" >
							</div>
						</div>
						
						<div id="modSubmit">
							<i class="send icon"></i>
							修改
						</div>
						<div id="cancel" onclick="mod()">
							<i class="send icon"></i>
							取消
						</div>


                </form>

        		      	
        	</div>
            <div id="tag_cont2" class="content_right" style="height:600px; width:100%; border:none; display:none;">
        		<!-- <span>------当前位置:查看进度--欢迎登录------</span> -->
        		<span style="float:right;color:red;" >${message }</span>
        		<!-- 点击修改人员信息 -->
              	查看进度
        		      	
        	</div>
            <div id="tag_cont3" class="content_right" style="height:600px; width:100%; border:none; display:none;">
        		<!-- <span>------当前位置:注销账号--欢迎登录------</span> -->
        		<span style="float:right;color:red;" >${message }</span>
        		<!-- 点击修改人员信息 -->
               	注销账号		      	
        	</div>
            
       	</div>
	</div>
	<div id="dd" class="easyui-draggable easyui-resizable" data-options="handle:&#39;#mytitle&#39;" style="width: 198px; height: 530px; border: 1px solid rgb(204, 204, 204); position: absolute; left:1148px; top: 366px; background-color: rgb(245, 246, 248);">
		<div id="mytitle" style="padding: 5px; background: rgb(221, 221, 221);">广告招租</div>
		<div style="padding:20px;">
        	<span>大连中软巨坑，深不见底，卖货上京东，取货更轻松</span>
       	</div>
	</div>


</div>

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
<script type="text/javascript">
		function select_tag(click_obj,show_cont){
			var oli= document.getElementById("nav_tags").getElementsByTagName("li");
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
		}
		$("#modSubmit").on("click",function(){
	  			alert("dfdfd");
	  			document.modifyForm.submit();
	  			alert("提交成功。。。");
	  		});
	  	$("#testAjax").on("click",function(){
	  		alert("fdfdf");
	  			$.ajax({
	  				type:"get",
	  				url:"ajax/ThreeManActionAjaxtest.do",
	  				dataType:"json",
	  				success:function(data){
	  					alert(toDate(data[0].start_date));
	  					console.log(data[0].birthday);
	  				},
	  				error:function(){
	  					alert("网络连接错误...");
	  				}
	  			});
	  	});
	  	function toJsonDate(jsonDate) {
	    	var date = new Date(jsonDate.time);
	    	console.log(date);
	    	return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		}
	  	function toDate(objDate) {
	  	    var date = new Date();
	  	    date.setTime(objDate);
	  	    return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	  	}

</script>
</html>
