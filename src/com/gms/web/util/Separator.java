package com.gms.web.util;

import javax.servlet.http.HttpServletRequest;

public class Separator {
	public static String init(HttpServletRequest request){
		String servletPath=request.getServletPath();
	
		String directory=servletPath.substring(1,7);
		System.out.println(directory);
		return directory;
	}
}
