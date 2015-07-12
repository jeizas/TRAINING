package com.jeizas.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.jeizas.entity.ThreeMan;
import com.jeizas.service.ThreeManService;
import com.opensymphony.xwork2.ActionContext;

@Controller
public class LoginUserAction {
	
	@Resource
	private ThreeManService threeManService;
	
	private String flag;//登录人员的分类
	private String t_name;//登录人员的信息1
	private String t_cerid;//登录人员的信息2
	
	
	public String login(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		System.out.println(flag);
		if(t_name.equals(null) || t_cerid.equals(null) || t_name == "" || t_cerid == ""){//若为空，则直接返回
			System.out.println("===1===");
			request.setAttribute("error", "用户名和证件号码不能为空！");
			request.setAttribute("error", "姓名和证件号码不匹配!");//用户名和密码跟数据库的不匹						
			request.setAttribute("curTag","tag_cont0");
			return "error";
		}
		switch(flag){
			case "0":
				System.out.println("threeMan login... ...");
				List<ThreeMan> list = threeManService.getThreeManList();
				for(ThreeMan t:list){
					if(t.getName().equals(t_name) && t.getCertificate().equals(t_cerid)){
							session.setAttribute("loginUser", t);//登录成功
					}else{
						request.setAttribute("error0", "姓名和证件号码不匹配!");//用户名和密码跟数据库的不匹						
						request.setAttribute("curTag","tag_cont0");
						return "error";
					}
			}
			return "0";
			case "1":
				System.out.println("培训教师登录");
				if(flag != ""){
					System.out.println("===1===");
					request.setAttribute("error1", "姓名和证件号码不匹配!");//用户名和密码跟数据库的不匹						
					request.setAttribute("curTag","tag_cont1");
					return "error";
				}else{
					return "1";
				}
			case "2":
				System.out.println("企业副总登录");
				if(t_name != null){//若为空，则直接返回
					System.out.println("===2===");
					request.setAttribute("error2", "姓名和证件号码不匹配!");//用户名和密码跟数据库的不匹						
					request.setAttribute("curTag","tag_cont2");
					return "error";
				}else{
					return "2";
				}
			case "3":
				System.out.println("监管人员登录");
				if(t_name != null){//若为空，则直接返回
					System.out.println("===3===");
					request.setAttribute("error3", "姓名和证件号码不匹配!");//用户名和密码跟数据库的不匹						
					request.setAttribute("curTag","tag_cont3");
					return "error";
				}else{
					return "3";
				}
			case "4":
				System.out.println("系统管理员登录");
				if(t_name == null){//若为空，则直接返回
					System.out.println("===4===");
					request.setAttribute("error4", "姓名和证件号码不匹配!");//用户名和密码跟数据库的不匹						
					request.setAttribute("curTag","tag_cont4");
					return "error";
				}else{
					return "4";
				}
		}
		return "error";
			
	}
	public String logout(){
		this.setT_name(null);
		this.setT_cerid(null);		
		ActionContext.getContext().getSession().clear();
		ServletActionContext.getRequest().getSession().invalidate();
		return "success";
	}
	public String signup(){
		return "success";
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public void setT_cerid(String t_cerid) {
		this.t_cerid = t_cerid;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
}
