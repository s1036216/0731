package com.gms.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.command.Command;
import com.gms.web.constaant.Action;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.proxy.BlockHandler;
import com.gms.web.proxy.PageHandler;
import com.gms.web.proxy.PageProxy;
import com.gms.web.service.MemberService;
import com.gms.web.serviceImpl.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.ParamsIterator;
import com.gms.web.util.Separator;


@WebServlet("/member.do")
public class MemberController extends HttpServlet { // 인터페이스기능 일반 클래스 기능 둘다같는거
													// 중간지점
	private static final long serialVersionUID = 1L; // 데이터전송 네트워크통신 시리얼
													// 버젼(직렬화)큐자료구죠
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<?, ?> map =null;
		System.out.println("member컨트롤러 진입");
		Separator.init(request);
		Command cmd=new Command();
		MemberBean member = new MemberBean();
		PageProxy pxy = new PageProxy(request);
		MemberService service = MemberServiceImpl.getInstance();
		Map<String, Object> tempMap = new HashMap<>();
		pxy.setPageSize(5);
		pxy.setBlockSize(5);
		
		switch (request.getParameter("action")) {
		case "move":
			DispatcherServlet.send(request, response);
			break;
		case "join":
			System.out.println("join 진입");
			map = ParamsIterator.execute(request);
			member.setId((String) map.get("id"));
			member.setPassword((String) map.get("pass"));
			member.setName((String) map.get("name"));
			member.setSsn((String) map.get("birth"));
			member.setEmail((String) map.get("email"));
			member.setMajor((String) map.get("major"));
			member.setPhone((String) map.get("phone"));
			member.setProfile("profile.jpg");
			// 메이져는 여러행 입력
			String[] subjects = ((String) map.get("subject")).split(",");
			List<MajorBean> list = new ArrayList<>();
			MajorBean major = null;
			for (int i = 0; i < subjects.length; i++) {
				major = new MajorBean();
				major.setMajorId(String.valueOf((int) ((Math.random() * 9999) + 1000)));
				major.setId((String) map.get("id"));
				major.setTitle((String) map.get("major"));
				major.setSubjId(subjects[i]);
				list.add(major);
			}
			 tempMap = new HashMap<>();
			tempMap.put("member", member);
			tempMap.put("major", list);
			service.addMember(tempMap);
			Separator.cmd.setDirectory("common");
			Separator.cmd.process();
			System.out.println("id" + map.get("id"));
			DispatcherServlet.send(request, response);
			break;
		case "list":
			System.out.println("==MemberList==");
			
			pxy.setTheNumberOfRows(Integer.parseInt(service.count(cmd)));
			pxy.setPageNumber(Integer.parseInt(request.getParameter("pageNumber")));
			pxy.execute(BlockHandler.attrr(pxy), service.list(PageHandler.attr(pxy)));
			DispatcherServlet.send(request, response);
	
			break;
		/*
		 * System.out.println("멤버 list 진입");
		 * 
		 * @SuppressWarnings("unchecked") List<StudentBean>
		 * memberlist=(List<StudentBean>) service.list();
		 * System.out.println("DB에서 가저온 멤버 list"+memberlist);
		 * 
		 * System.out.println("페이지수"+memberlist.size()/5); int
		 * pageCount=memberlist.size()/5; int
		 * endpage=pageCount%5!=0?pageCount+1:pageCount;
		 * request.setAttribute("endPage",String.valueOf(endpage));
		 * DispatcherServlet.send(request,response);
		 */
		// 디스페쳐 보내다 목적지로 가라고 전달만해주는사람
		case "search":
			System.out.println("dddddd");
			map=ParamsIterator.execute(request);
		
			System.out.println("써치값"+map.get("search"));
			
			pxy.setTheNumberOfRows(Integer.parseInt(service.count(cmd)));
			/*pxy.setPageNumber(Integer.parseInt(request.getParameter("pageNumber")));*/
			
	
			cmd=PageHandler.attr(pxy);
			cmd.setColumn("name");
			cmd.setSearchWord(String.valueOf(map.get("search")));
			request.setAttribute("list",map.get(cmd));
						/*pxy.execute(BlockHandler.attrr(pxy), service.findById(PageHandler.attr(pxy)));*/
			System.out.println("id값은"+request.getParameter(""));
			System.out.println("cmd"+cmd);
			DispatcherServlet.send(request, response);
			break;
		case "update":
			cmd.setSearchWord(request.getParameter("id"));
			service.modify(service.findById(cmd));
			System.out.println("업데이트진입");
			DispatcherServlet.send(request, response);
			break;
		case "delete":
			/*service.remove(request.getParameter("id"));*/
			response.sendRedirect(request.getContextPath()+"/member.do?action=list&page=member_list&pageNumber=1");
			break;
		case "detail":
			cmd.setSearchWord(request.getParameter("id"));
			request.setAttribute("student", service.findById(cmd));
			System.out.println("디테일진입");
			DispatcherServlet.send(request, response);
			break;	
		default:
			System.out.println("Fail");
		}
	}
}
