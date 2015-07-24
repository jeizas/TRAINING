<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/demo.css">
	<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
	
<style type="text/css">
body{margin:0px;padding:0px;}
#dlg form input{
	width:170px;
	height:30px;
	margin-top:10px;
	/* float:right; */
	}
#dlg form label{line-height:44px;margin-left:15px;}
#addThreemanright {margin-right:20px;}
#eidtDlg form label{line-height:44px;margin-left:15px;}
#editDlg form input{
	width:170px;
	height:30px;
	margin-top:10px;
	/* float:right; */
	}
#editThreeman input{margin-top:15px;}
</style>
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
            	<li onClick="select_tag(this,'tag_cont4')">培训教师管理</li>
            	<li onClick="select_tag(this,'tag_cont1')">三类人员管理</li>
            	<li onClick="select_tag(this,'tag_cont2')">企业副总管理</li>
            	<li onClick="select_tag(this,'tag_cont3')">监管人员管理</li>
            </ul>
        </div>
	</div>
	<div id="dd" class="easyui-draggable easyui-resizable" data-options="handle:&#39;#mytitle&#39;" style="width:1047px; height: 700px; border: 1px solid rgb(204, 204, 204); position: absolute; left: 300px; top: 196px; background-color: rgb(245, 246, 248);">
		<div id="mytitle" style="padding: 5px; background: rgb(221, 221, 221);">欢迎系统管理员登录</div>
		<div style="padding:20px;">
			<div id="tag_cont0" class="content_right" style="height:600px; width:100%; border:none;">
        		首页内容
        	</div>
        	<div id="tag_cont4" class="content_right" style="height:600px; width:100%; border:none;">   
        		网上报名    
        	</div>
            <div id="tag_cont1" class="content_right" style="height:600px; width:100%; border:none; display:none;">
            	<div>
					<table id="dg"style="width:998px;margin:auto;height:400px;"></table>
				    	<div id="tb">
								<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addCmp();">新增</a>
								<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editThreeMan()">编辑</a>
								<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="delThreeMan();">删除</a>
								<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true">帮助</a>
						</div>
				    	<div id="dlg" style="width:400px;height:280px;">
						    <form id="addThreeman" method="post"> 
						    	<div style="width:250px;float:left;">
									<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label><input type="hidden" name="threeMan.id" value="${loginUser.id }">
									<input  type="text"  name="name" class="easyui-validatebox"  data-options="required:true"><br/>
								
									<label>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型</label>
									<input  type="text" id="econamicType" name="type" class="easyui-validatebox"  data-options="required:true"><br/>
									
									<label>身&nbsp;&nbsp;份&nbsp;&nbsp;证</label>
									<input  type="text" name="indefication" class="easyui-validatebox"  data-options="required:true"><br/>
									
									<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
									<input  type="text" name="threeMan.sex" class="easyui-validatebox" data-options="required:true"><br/>
									
									<label>出生日期</label>
									<input  type="text" name="birthday" class="easyui-datebox"  data-options="validType:'md[\'10/11/2012\']'"><br/>
									
									<label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务</label>
									<input  type="text" name="duty" class="easyui-validatebox" ><br/>
									
									<label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
									<input  type="text" name="title" class="easyui-validatebox" ><br/>
								</div>
								<div style="width:250px;float:right;"id="addThreemanright">				 	 			
									<label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</label>
									<input  type="text" name="degress" class="easyui-validatebox" ><br/>
									
									<label>发证日期</label>
									<input  type="text" name="issus_date" class="easyui-datebox" data-options="validType:'md[\'10/11/2012\']'" ><br/>
									
									<label>有效期起</label>
									<input  type="text" name="start_date" class="easyui-datebox" data-options="validType:'md[\'10/11/2012\']'" ><br/>
								
									<label>有效期迄</label>
									<input  type="text" name="final_date" class="easyui-datebox" data-options="validType:'md[\'10/11/2012\']'" ><br/>
									
									<label>发证机关</label>
									<input  type="text" name="authority" class="easyui-validatebox"  ><br/>
									
									<label>证件号码</label>
									<input  type="text" name="certificate" class="easyui-validatebox"  >	<br/>	
									
									<label>所属公司</label>
									<input  type="text" name="companyid" class="easyui-validatebox" /><br/>
		            			</div>
		            		</form>	
		            	</div>	
		            	<div id="editDlg" style="width:400px;height:280px;">
							    <form id="editThreeman" method="post"> 
							    	<div style="width:250px;float:left;">
										<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label><input type="hidden" name="threeMan.id" value="${loginUser.id }">
										<input  type="text" id="t_name"  name="t.name" class="easyui-validatebox"  data-options="required:true"><br/>
									
										<label>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型</label>
										<input  type="text" id="t_type" name="t.type" class="easyui-validatebox"  data-options="required:true"><br/>
										
										<label>身&nbsp;&nbsp;份&nbsp;&nbsp;证</label>
										<input  type="text" id="t_inde" name="t.indefication" class="easyui-validatebox"  data-options="required:true"><br/>
										
										<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
										<input  type="text" id="t_sex" name="t.sex" class="easyui-validatebox" data-options="required:true"><br/>
										
										<label>出生日期</label>
										<input  type="text" id="t_bir" name="t.birthday" class="easyui-datebox"  data-options="validType:'md[\'10/11/2012\']'"><br/>
										
										<label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务</label>
										<input  type="text" id="t_duty" name="t.duty" class="easyui-validatebox" ><br/>
										
										<label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
										<input  type="text" id="t_tit" name="t.title" class="easyui-validatebox" ><br/>
									</div>
									<div style="width:250px;float:right;"id="addThreemanright">				 	 			
										<label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</label>
										<input  type="text" id="t_deg" name="t.degress" class="easyui-validatebox" ><br/>
										
										<label>发证日期</label>
										<input  type="text" id="t_iss" name="t.issus_date" class="easyui-datebox" data-options="validType:'md[\'10/11/2012\']'" ><br/>
										
										<label>有效期起</label>
										<input  type="text" id="t_sta" name="t.start_date" class="easyui-datebox" data-options="validType:'md[\'10/11/2012\']'" ><br/>
									
										<label>有效期迄</label>
										<input  type="text" id="t_fin" name="t.final_date" class="easyui-datebox" data-options="validType:'md[\'10/11/2012\']'" ><br/>
										
										<label>发证机关</label>
										<input  type="text" id="t_aut" name="t.authority" class="easyui-validatebox"  ><br/>
										
										<label>证件号码</label>
										<input  type="text" id="t_cer" name="t.certificate" class="easyui-validatebox"  >	<br/>	
										
										<label>所属公司</label>
										<input  type="text" id="t_com" name="t.companyid" class="easyui-validatebox" /><br/>
			            			</div>
			            		</form>					    			    
						</div>
				    </div>
            	</div>
        		<div style="display:none;">
        			  
            	</div>    	
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
</div>

<!--=========================footer================================-->
<footer>
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
			loadTable();
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
	  	//三类人员表格
	  	function loadTable(){
	  		$('#dg').datagrid({
	  			title:'建筑企业',
	  			toolbar: '#tb',
	  			remoteSort:false,
	  			singleSelect:true,//是否允许多选
	  			nowrap:true,//是否允许换行
	  			rownumbers : true,//行标
	  			fitColumns : true,
	  			striped : true,
	  			pageSize:4,
	  			pageList:[2,4,6,8],
	  			pagination:true,  
	  			selectOnCheck:false,
		  		url:'getThreeManList.do',	  		
		  		columns:[[ 
					{field:'id',title:'id',width:80},
		  			{field:'name',title:'姓名',width:80},
		  			{field:'sex',title:'性别',width:60,align:'right'},
		  			{field:'birthday',title:'出生日期',width:80,formatter:function(value,row,index){
						if(value){
							var unixTimestamp = new Date(value.time);
							return unixTimestamp.toLocaleDateString();
						}
					}},				
		  			{field:'duty',title:'职务',width:80},
		  			{field:'title',title:'职称',width:80},
		  			{field:'degress',title:'学历',width:80},
		  			{field:'indefication',title:'身份证',width:80},
		  			{field:'type',title:'类型',width:80,
		  				formatter : function(value, row, index) {
						if (value)
							return value.value;
					}},
		  			{field:'certificate',title:'证件号',width:80},
		  			{field:'issus_date',title:'发证日期',width:80,formatter:function(value,row,index){
						if(value){
							var unixTimestamp = new Date(value.time);
							return unixTimestamp.toLocaleDateString();
						}
					}},
		  			{field:'start_date',title:'有效期起',width:80,formatter:function(value,row,index){
						if(value){
							var unixTimestamp = new Date(value.time);
							return unixTimestamp.toLocaleDateString();
						}
					}},
		  			{field:'final_date',title:'有效期讫',width:80,formatter:function(value,row,index){
						if(value){
							var unixTimestamp = new Date(value.time);
							return unixTimestamp.toLocaleDateString();
						}
					}},
		  			{field:'authority',title:'法证机关',width:80},
		  			{field:'companyid',title:'所属公司',width:80},	
		  			]] 
		  		});
	  	}
	  	//新增人员
	  	$('#dlg').hide();
	  	$('#editDlg').hide();
	  	function addCmp(){
			$('#dlg').show();
			$('#dlg').dialog({    
	    		title: '新增建筑企业',    
	    		width: 600,    
	    		height: 400,  
	    		left: 434,
	    		top: 190,
	    		closed: false,    
	    		cache: false,        
	    		modal: true,
	    		onOpen:function(){
	    			$('#econamicType').combobox({
	    			url:'ajax/ThreeManActionAjaxgetEconemicType.do',
	    			valueFied:'id',
	    			textField:'value',
	    			editable:false,
	    			});
	    		},
	    		buttons:[{
					text:'保存',
					handler:threeManSubmit},{
					text:'关闭',
					handler:function exit(){$("#dlg").dialog('close');}}]
			});  
			function threeManSubmit(){
				$.messager.confirm('确认对话框', '您想要提交表单吗？', function(r){
					if (r){
						$('#addThreeman').form('submit', {
					  		url: 'ajax/SaveActionAjaxsaveThreeMan.do',
					  		onSubmit: function(){
					  			var isValid = $(this).form('validate');
					  			if (!isValid){
					  				return false;	// 如果表单是无效的则隐藏进度条
					  			}
					  		},
					  		success: function(data){
					  			$.messager.show({
					  				style:{	right:'',
					  					top:document.body.scrollTop+document.documentElement.scrollTop,
					  					bottom:''},
					  				title:'提交成功',
					  				msg:'消息将在5秒后关闭。',
					  				timeout:5000,
					  				showType:'slide'
					  			}); // 如果提交成功则隐藏进度条
					  			$("#dlg").dialog('close');
					  			$("#dlg").datagrid('reload');
					  		}
					  	});
					}
				});
			}
		}
	  	//deleteThreeman
	  	function delThreeMan(){
	  		var row = $("#dg").datagrid("getSelected");
	  		console.log(row);
	  		if(row){
	  			$.messager.confirm('确认对话框', '您想要删除记录吗？', function(r){
					if (r){
						$.post('ajax/AdminActionAjaxdeleteRow.do',{id:row.id},function(result){
							if(result.success){
								$("#dg").datagrid('reload');
							}else{
								$.messager.show({title:'error',msg:result.errorMsg});
							}
						},'json');
						
					}else{
						$.messager.show({
			  				style:{	right:'',
			  					top:document.body.scrollTop+document.documentElement.scrollTop,
			  					bottom:''},
			  				title:'你已经取消删除',
			  				msg:'消息将在3秒后关闭。',
			  				timeout:3000,
			  				showType:'slide'
			  			});
					}
				});
	  		}
	  	}
	  	//edit ThreeMan
	  	function editThreeMan(){
	  		getThreeManValue();
	  		$('#editDlg').show();
			$('#editDlg').dialog({    
	    		title: '修改建筑企业',    
	    		width: 600,    
	    		height: 400,  
	    		left: 434,
	    		top: 190,
	    		closed: false,    
	    		cache: false,        
	    		modal: true,
	    		onOpen:function(){
	    			$('#econamicType').combobox({
	    			url:'ajax/ThreeManActionAjaxgetEconemicType.do',
	    			valueFied:'id',
	    			textField:'value',
	    			editable:false,
	    			});
	    		},
	    		buttons:[{
					text:'保存',
					handler:editThreeManSubmit},{
					text:'关闭',
					handler:function exit(){
						/* alert("取消添加"); */
						$("#editDlg").dialog('close');
					}}]
			});  
			function editThreeManSubmit(){
				$.messager.confirm('确认对话框', '您想要提交表单吗？', function(r){
					if (r){
						$('#addThreeman').form('submit', {
					  		url: 'ajax/SaveActionAjaxsaveThreeMan.do',
					  		onSubmit: function(){
					  			var isValid = $(this).form('validate');
					  			if (!isValid){
					  				return false;	// 如果表单是无效的则隐藏进度条
					  			}
					  		},
					  		success: function(data){
					  			$.messager.show({
					  				style:{	right:'',
					  					top:document.body.scrollTop+document.documentElement.scrollTop,
					  					bottom:''},
					  				title:'提交成功',
					  				msg:'消息将在5秒后关闭。',
					  				timeout:5000,
					  				showType:'slide'
					  			}); // 如果提交成功则隐藏进度条
					  			$("#editDlg").dialog('close');
					  			$("#editDlg").datagrid('reload');
					  		}
					  	});
					}
				});
			}
	  	}
	  	function getThreeManValue(){
	  		var row = $("#dg").datagrid("getSelected");
	  		$("#t_name").val(row.name);
	  		$("#t_type").val(row.type);
	  		$("#t_inde").val(row.indefication);
	  		$("#t_sex").val(row.sex);
	  		$("#t_bir").val(row.birthday);
	  		$("#t_duty").val(row.duty);
	  		$("#t_tit").val(row.title);
	  		$("#t_deg").val(row.degress);
	  		$("#t_iss").val(row.issus_date);
	  		$("#t_sta").val(row.start_date);
	  		$("#t_fin").val(row.final_date);
	  		$("#t_aut").val(row.authority);
	  		$("#t_cer").val(row.certificate);
	  		$("#t_com").val(row.companyid);
	  	}
</script>
</html>
