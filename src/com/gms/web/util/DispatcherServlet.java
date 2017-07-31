package com.gms.web.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet {
	public static void send(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page=request.getParameter("page");
		request.getRequestDispatcher( "/WEB-INF/view/"+Separator.init(request)+ "/" +page+".jsp").forward(request,response);
	}
	

}
