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
		switch(flag){
			case "1":
				List<ThreeMan> list = threeManService.getThreeManList();
				for(ThreeMan t:list){
					System.out.println(t);
				}
				if(t_name.equals(null) || t_cerid.equals(null) || t_name == "" || t_cerid == ""){//若为空，则直接返回
					System.out.println("======");
					request.setAttribute("error", "用户名和证件号码不能为空！");
					return "error";
				}else{
					System.out.println("222222222");
					for(ThreeMan t:list){
							if(t.getName().equals(t_name) && t.getCertificate().equals(t_cerid)){
								System.out.println("+++++++");
								session.setAttribute("loginUser", t);//登录成功
						}else{
							System.out.println("------");
							request.setAttribute("error", "姓名和证件号码不匹配!");//用户名和密码跟数据库的不匹配
							return "error";
						}
					}
				}
				return "success";
			case "2":
				System.out.println("培训教师登录");
				return "success";
			case "3":
				System.out.println("企业副总登录");
				return "success";
			case "4":
				System.out.println("监管人员登录");
				return "success";
			case "5":
				System.out.println("系统管理员登录");
				return "success";
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
