package com.jeizas.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.jeizas.entity.ThreeMan;
import com.jeizas.service.ThreeManService;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	@Resource
	private ThreeManService threeManService;
	
	@Action(value = "gotoHome" , results = { @Result(name = "success", location = "/WEB-INF/pages/admin/home.jsp")})
	public String gotoHome(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<ThreeMan> list = threeManService.getThreeManList();//加载管理三类人员页面信息
		request.setAttribute("threeManList", list);
		return SUCCESS;
	}
}
