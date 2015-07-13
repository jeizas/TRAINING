package com.jeizas.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.jeizas.service.ThreeManService;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	@Resource
	private ThreeManService threeManService;
	
	private int page;   //页码
	private int rows;   //每页显示记录条数
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

	@Action(value = "gotoHome" , results = { @Result(name = "success", location = "/WEB-INF/pages/admin/home.jsp")})
	public String gotoHome() throws IOException{
		
		return SUCCESS;
	}
	
	public void getThreeManList() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jo = threeManService.getThreeManPageList(page,rows);//加载管理三类人员页面信息
		System.out.println(jo);
		PrintWriter out = response.getWriter();
		out.print(jo);
		out.flush();
		out.close();
	}
}
