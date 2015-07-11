package com.jeizas.utility;

public class Constants {
	
	public static String LOGIN_USER; //当前登录用户
	public final static int PAGE_SIZE = 10; //初始页面大小
	public static String CURRENT_PAGE;//
	public static String SESSION_USER = "loginuser";
	public static String SESSION_SECURITY_CODE = "randCheckCode";//验证码
	public static String NO_INTERCEPTOR_PATH = ".*/((index)|(checkCode/*)|(static/*)|(css/*)|(images/*)|(js/*)).*";
}
