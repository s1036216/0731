package com.gms.web.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.dao.MemberDAO;
import com.gms.web.daoImpl.MemberDAOIml;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.service.MemberService;

public class MemberServiceImpl implements MemberService{
		
	public static MemberServiceImpl getInstance() {
		return new MemberServiceImpl();
	}
	
	
	private MemberServiceImpl() { // 2번 생성자 만들고
		
	}
	@SuppressWarnings("unchecked")
	public String addMember(Map<String ,Object> map) {
		System.out.println("member 서비스진입");
		MemberBean m=(MemberBean) map.get("member");
		System.out.println("넘어온회원이름"+m.toString());
		List<MajorBean>list=(List<MajorBean>) map.get("major");
		System.out.println("수강과목"+list);
		
		
		return MemberDAOIml.getInstance().insert(map);
	}
	List<MemberBean> list;// 1순위 큰놈\
	// 4번째 (인스턴스변수)
	Map<String,MemberBean> map;
	MemberBean member;
	MemberDAO dao;
	public List<?> list(Command cmd) {
		return MemberDAOIml.getInstance().selectAll(cmd);// 쉘로우카피에의한 객체  , 주소값에의한 객체 너무빠르다
	}
	@Override
	public List<?> findByName(Command cmd) {
		System.out.println("찾을이름("+cmd.getSearchWord()+")");
		
		return MemberDAOIml.getInstance().selectByName(cmd);
	}
	@Override
	public StudentBean findById(Command cmd) {
		
			
		return MemberDAOIml.getInstance().selectById(cmd);
	}
	@Override
	public String count(Command cmd) {
		return String.valueOf(MemberDAOIml.getInstance().allcount(cmd));
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
	public String remove(Command cmd) {
		
			String msg = "";
			String rs = MemberDAOIml.getInstance().delete(cmd);
			msg = (Integer.parseInt(rs)==1)?msg="삭제 성공":"삭제 실패";
			return msg;
		}


	@Override
	public Map<String,Object> login(MemberBean bean) {
		/*MemberBean m=MemberDAOIml.getInstance().selectById(bean.getId());*/
		Map<String,Object> map=new HashMap<>();
		Command cmd=new Command();
		cmd.setSearchWord(bean.getId());
		MemberBean m=MemberDAOIml.getInstance().login(cmd);
		String  page= (m!=null)?(bean.getPassword().equals(m.getPassword()))?"main":"login_fail":"join";
		
		map.put("page",page);
		map.put("user",m);
		return map;
	
	}

	
}
