package com.jeizas.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

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
	private ThreeMan threeMan;//保存三类人员
	public ThreeMan getThreeMan() {
		return threeMan;
	}
	public void setThreeMan(ThreeMan threeMan) {
		this.threeMan = threeMan;
	}
	//goto welecome
	@Action(value = "gotoHome" , results = { @Result(name = "success", location = "/WEB-INF/pages/admin/home.jsp")})
	public String gotoHome() throws IOException{
		
		return SUCCESS;
	}
	//ajax getThreeManList
	public void getThreeManList() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jo = threeManService.getThreeManPageList(page,rows);//加载管理三类人员页面信息
		System.out.println(jo);
		System.out.println("------------jo----------");
		PrintWriter out = response.getWriter();
		out.print(jo);
		out.flush();
		out.close();
	}
	//save ThreeMan
	public void saveThreeMan() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		System.out.println("access");
		System.out.println(threeMan);
		JSONObject jo = new JSONObject();
		jo.put("name", "zhang");
		out.print(jo);
		out.flush();
		out.close();
	}
	public void deleteRow(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			int id = Integer.valueOf(request.getParameter("id"));
			ThreeMan t = new ThreeMan();
			t.setId(id);
			System.out.println("--------"+id);
			threeManService.deleteThreeMan(t);
			PrintWriter out = response.getWriter();
			JSONObject jo = new  JSONObject();
			jo.put("success", true);
			out.print(jo);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
