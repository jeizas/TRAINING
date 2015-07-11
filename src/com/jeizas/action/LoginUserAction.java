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
	
	private String flag;//��¼��Ա�ķ���
	private String t_name;//��¼��Ա����Ϣ1
	private String t_cerid;//��¼��Ա����Ϣ2
	
	
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
				if(t_name.equals(null) || t_cerid.equals(null) || t_name == "" || t_cerid == ""){//��Ϊ�գ���ֱ�ӷ���
					System.out.println("======");
					request.setAttribute("error", "�û�����֤�����벻��Ϊ�գ�");
					return "error";
				}else{
					System.out.println("222222222");
					for(ThreeMan t:list){
							if(t.getName().equals(t_name) && t.getCertificate().equals(t_cerid)){
								System.out.println("+++++++");
								session.setAttribute("loginUser", t);//��¼�ɹ�
						}else{
							System.out.println("------");
							request.setAttribute("error", "������֤�����벻ƥ��!");//�û�������������ݿ�Ĳ�ƥ��
							return "error";
						}
					}
				}
				return "success";
			case "2":
				System.out.println("��ѵ��ʦ��¼");
				return "success";
			case "3":
				System.out.println("��ҵ���ܵ�¼");
				return "success";
			case "4":
				System.out.println("�����Ա��¼");
				return "success";
			case "5":
				System.out.println("ϵͳ����Ա��¼");
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
