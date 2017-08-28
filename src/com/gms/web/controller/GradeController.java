package com.gms.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.Separator;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@WebServlet("/grade.do")
public class GradeController extends HttpServlet {  //인터페이스기능 일반 클래스 기능 둘다같는거  중간지점
	private static final long serialVersionUID = 1L;  //데이터전송  네트워크통신 시리얼 버젼(직렬화)큐자료구죠
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Separator.init(request);
		String action=request.getParameter("action");
		String page=request.getParameter("page");
		System.out.println("controller action: " +action);
		System.out.println("controller page: " +page);
		switch(request.getParameter("action")){
		case "move":
			 
			//디스페쳐 보내다 목적지로 가라고 전달만해주는사람
			
			DispatcherServlet.send(request, response);
			break;
		
			
		
		}
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController Post 진입");
		

	}

}
