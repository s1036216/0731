package com.gms.web.dao;

import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.domain.MemberBean;

public interface MemberDAO {
	public String insert(Map<?,?>map);
	public List<?> selectAll(Command cmd);
	public List<?> selectByName(Command cmd);
	public MemberBean selectById(Command cmd);
	public String allcount(Command cmd);
	public String update(MemberBean bean);
	public String delete(Command cmd);
}
