package com.gms.web.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gms.web.constaant.Action;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
import com.gms.web.serviceImpl.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.Separator;
///외부에서 리퀘스트로만 받고 어디로 보내기만하는게 커먼컨트롤러import com.sun.org.apache.xml.internal.security.Init;

@WebServlet({"/home.do","/common.do"})
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		MemberBean member=new MemberBean();
		
		System.out.println("CommonController Get 진입");
		Separator.init(request);
	
		switch(Separator.cmd.getAction()){
		case Action.MOVE:
			 //디스페쳐 보내다 목적지로 가라고 전달만해주는사람
			
			DispatcherServlet.send(request, response);
			break;
		
		case Action.LOGIN:
			 //디스페쳐 보내다 목적지로 가라고 전달만해주는사람
			MemberService service=MemberServiceImpl.getInstance();//싱글톤 나자신을 부른다
			MemberBean bean=new MemberBean();
			bean.setId(request.getParameter("input_id"));
			bean.setPassword(request.getParameter("input_password"));
			Map<String, Object> map=service.login(bean);
			System.out.println("page:" + map);
			if(map.get("page").equals("main")){
				session.setAttribute("user",map.get("user"));
			}			
			Separator.cmd.setPage(String.valueOf(map.get("page")));
			Separator.cmd.process();
			DispatcherServlet.send(request, response);
			break;
		case Action.LOGOUT:
			session.invalidate();
			DispatcherServlet.send(request, response);
			break;
	
		}
		
		
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommonController Post 진입");
	}

}
