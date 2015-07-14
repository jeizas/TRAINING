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
	 * �޸�������Ա����Ϣ
	 */
	public String edit(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("threeMan.name");
		System.out.println("test..."+name);
		System.out.println(threeMan);
		threeManService.updateThreeMan(threeMan);
		System.out.println("success modfiy");
		request.setAttribute("message", "�޸ĳɹ�");
		return "success";
	}
	/*
	 * ����ajax
	 */
	public void test() throws IOException{
		 HttpServletResponse response=ServletActionContext.getResponse();
		 HttpServletRequest request = ServletActionContext.getRequest();
		 response.setContentType("text/html;charset=utf-8"); //������Ӧ�ַ������룬Ĭ��ISO-8859-1 
		 //response.setCharacterEncoding("UTF-8");  
		 PrintWriter out = response.getWriter();  
		 HttpSession session = request.getSession();
		 Object user = session.getAttribute("loginUser");
		 System.out.println("ajax���Գɹ�");
		 System.out.println(user);
		 //JSON�ڴ��ݹ���������ͨ�ַ�����ʽ���ݵģ�����������  
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
		System.out.println("���ò����������ķ����ɹ�");
		return SUCCESS;
	}
	
}
