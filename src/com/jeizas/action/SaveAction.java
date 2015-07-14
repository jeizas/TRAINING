package com.jeizas.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.jeizas.entity.ThreeMan;
import com.jeizas.service.ThreeManService;

public class SaveAction {
	
	@Resource
	private ThreeManService threeManService;
	
	private ThreeMan threeMan;//保存三类人员
	public ThreeMan getThreeMan() {
		return threeMan;
	}
	public void setThreeMan(ThreeMan threeMan) {
		this.threeMan = threeMan;
	}

	public void saveThreeMan() throws IOException, ParseException{
		HttpServletRequest request = ServletActionContext.getRequest();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");//time inversion
		threeMan.setBirthday(sdf.parse(request.getParameter("birthday")));
		threeMan.setIssus_date(sdf.parse(request.getParameter("issus_date")));
		threeMan.setFinal_date(sdf.parse(request.getParameter("final_date")));
		threeMan.setStart_date(sdf.parse(request.getParameter("start_date")));
		threeManService.saveThreeMan(threeMan);//save
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		System.out.println("access");
		System.out.println(threeMan);
		JSONObject jo = new JSONObject();
		jo.put("seccess", "true");
		out.print(jo);
		out.flush();
		out.close();
	}
}
