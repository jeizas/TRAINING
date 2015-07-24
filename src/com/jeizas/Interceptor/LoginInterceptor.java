package com.jeizas.Interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> session=ActionContext.getContext().getSession();
		
		String actionName = arg0.getInvocationContext().getName();
		if(actionName == "LoginUserAction"){
			return arg0.invoke();
		}
		
		Object user=session.get("loginUser");
		if(user!=null){
			return arg0.invoke();
		}else{
			return Action.LOGIN;
		}
	}

}
