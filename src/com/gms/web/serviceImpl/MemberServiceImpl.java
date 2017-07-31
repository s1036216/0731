package com.gms.web.serviceImpl;

import java.util.List;
import java.util.Map;

import com.gms.web.dao.MemberDAO;
import com.gms.web.daoImpl.MemberDAOIml;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;

public class MemberServiceImpl implements MemberService{
		
	public static MemberServiceImpl getInstance() {
		return new MemberServiceImpl();
	}
	
	
	private MemberServiceImpl() { // 2번 생성자 만들고
		
	}
	@Override
	public String addMember(MemberBean bean) {
		return MemberDAOIml.getInstance().insert(bean).equals("1")?"가입성공":"실패";
	}
	List<MemberBean> list;// 1순위 큰놈\
	// 4번째 (인스턴스변수)
	Map<String,MemberBean> map;
	MemberBean member;
	MemberDAO dao;
	@Override
	public List<MemberBean> list() {
		return MemberDAOIml.getInstance().selectAll();
	}
	@Override
	public List<MemberBean> findByName(String name) {
	return MemberDAOIml.getInstance().selectByName(name);
	}
	@Override
	public MemberBean findById(String id) {
		

		return MemberDAOIml.getInstance().selectById(id);
	}
	@Override
	public String count() {
		return String.valueOf(MemberDAOIml.getInstance().count());
	}
	@Override
	public String modify(MemberBean bean) {
	/*	String msg="";
		if(dao.update(bean).equals("1")){
			msg="성공";
			}else{
				msg="실패";
			}
		System.out.println(msg);*/
	return MemberDAOIml.getInstance().update(bean);
	}
	@Override
	public String remove(String id) {
		
			String msg = "";
			String rs = MemberDAOIml.getInstance().delete(id);
			msg = (Integer.parseInt(rs)==1)?msg="삭제 성공":"삭제 실패";
			return msg;
		}

	
}
