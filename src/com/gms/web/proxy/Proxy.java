package com.gms.web.proxy;

import javax.servlet.http.HttpServletRequest;


public abstract class Proxy {
 HttpServletRequest request;  //게터만 있어야함
	public Proxy(HttpServletRequest request){  //리퀘스트 객체가 존재할때만 ..요청할때만  생성됨
		this.request=request;
	}
	
	
}
