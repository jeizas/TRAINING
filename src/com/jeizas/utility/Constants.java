package com.jeizas.utility;

public class Constants {
	
	public static String LOGIN_USER; //��ǰ��¼�û�
	public final static int PAGE_SIZE = 10; //��ʼҳ���С
	public static String CURRENT_PAGE;//
	public static String SESSION_USER = "loginuser";
	public static String SESSION_SECURITY_CODE = "randCheckCode";//��֤��
	public static String NO_INTERCEPTOR_PATH = ".*/((index)|(checkCode/*)|(static/*)|(css/*)|(images/*)|(js/*)).*";
}
