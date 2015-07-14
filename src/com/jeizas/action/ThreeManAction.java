package com.jeizas.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.jeizas.entity.ThreeMan;
import com.jeizas.service.ThreeManService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class ThreeManAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 34L;

	@Resource
	private ThreeManService threeManService;
	
	private ThreeMan threeMan;
	public ThreeMan getThreeMan() {
		return threeMan;
	}
	public void setThreeMan(ThreeMan threeMan) {
		this.threeMan = threeMan;
	}
	
	/*
	 * 修改三类人员的信息
	 */
	public String edit(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("threeMan.name");
		System.out.println("test..."+name);
		System.out.println(threeMan);
		threeManService.updateThreeMan(threeMan);
		System.out.println("success modfiy");
		request.setAttribute("message", "修改成功");
		return "success";
	}
	/*
	 * 测试ajax
	 */
	public void test() throws IOException{
		 HttpServletResponse response=ServletActionContext.getResponse();
		 HttpServletRequest request = ServletActionContext.getRequest();
		 response.setContentType("text/html;charset=utf-8"); //设置响应字符集编码，默认ISO-8859-1 
		 //response.setCharacterEncoding("UTF-8");  
		 PrintWriter out = response.getWriter();  
		 HttpSession session = request.getSession();
		 Object user = session.getAttribute("loginUser");
		 System.out.println("ajax测试成功");
		 System.out.println(user);
		 //JSON在传递过程中是普通字符串形式传递的，这里做测试  
		 List<Object> list = new ArrayList<Object>();
		 list.add(user);
		 JSONObject jo = JSONObject.fromObject(user);
		 //String jsonString = JSONArray.fromObject(list).toString();
		 //out.println(jsonString);  
		 out.print(jo);
		 out.flush();  
		 out.close();
	}
	public String testInterceptor(){
		System.out.println("调用测试拦截器的方法成功");
		return SUCCESS;
	}
	
}
