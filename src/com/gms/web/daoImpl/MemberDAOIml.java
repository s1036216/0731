package com.gms.web.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.constaant.DB;
import com.gms.web.constaant.SQL;
import com.gms.web.constaant.Vendor;
import com.gms.web.dao.MemberDAO;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.factory.DatabaseFactory;

public class MemberDAOIml implements MemberDAO {
	Connection conn;
	public static MemberDAOIml instance = new MemberDAOIml();

	public static MemberDAOIml getInstance() {
		return instance;
	}

	private MemberDAOIml() {
		conn = null;
	}

	@Override
	public String insert(Map<?, ?> map) {
		String rs = "";
		MemberBean bean = (MemberBean) map.get("member");
		
		@SuppressWarnings("unchecked")
		List<MajorBean> list = (List<MajorBean>) map.get("major");
		PreparedStatement pstmt = null;
		System.out.println("query db member insert!!!!" + SQL.MEMBER_INSERT);
		try {
			conn = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).geConnection();
			conn.setAutoCommit(false);// 테이블 두개라서
			pstmt = conn.prepareStatement(SQL.MEMBER_INSERT);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getSsn());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getProfile());
			pstmt.executeUpdate();
			for (int i = 0; i < list.size(); i++) {
				pstmt = conn.prepareStatement(SQL.MAJOR_INSERT);
				pstmt.setString(1, list.get(i).getMajorId());
				pstmt.setString(2, list.get(i).getTitle());
				pstmt.setString(3, list.get(i).getId());
				pstmt.setString(4, list.get(i).getSubjId());
				rs = String.valueOf(pstmt.executeUpdate());
				 // 테이블 두개라서
				System.out.println("INSER SQL:" + SQL.MEMBER_INSERT);
				System.out.println("****" + SQL.MAJOR_INSERT);
				System.out.println("*******" + rs);
			}
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException ex) {
					e.printStackTrace();
				}
			}
		}
		
		return String.valueOf(rs);
	}

	@Override
	public List<?> selectAll(Command cmd) {
		List<StudentBean> list = new ArrayList<>(); // 이거때문에 와일문
		
		try {
			conn = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).geConnection();// 너무빠르다
			PreparedStatement pstmt=conn.prepareStatement(SQL.STUDENT_LIST);
			pstmt.setString(1, String.valueOf(cmd.getStartRow()));
			pstmt.setString(2, String.valueOf(cmd.getEndRow()));
			ResultSet rs=pstmt.executeQuery();
			
			StudentBean member = null; // 아파트대지땅구입
			while (rs.next()) { // rs.next 무조건
				member = new StudentBean(); // 건물올림 살사람들 들어오게
				member.setId(rs.getString(DB.ID)); // 입주
				member.setName(rs.getString(DB.MEMBER_NAME));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				member.setEmail(rs.getString(DB.EMAIL));
				member.setPhone(rs.getString(DB.PHONE));
				member.setTitle(rs.getString(DB.TITLE));
				member.setNum(rs.getString(DB.NUM));
				member.setRegdate(rs.getString(DB.MEMBER_REGDATE));
				list.add(member); // 분양완료
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<StudentBean> selectByName(Command cmd) {
		System.out.println("찾을 이름"+cmd.getSearchWord());
		System.out.println("찾을 컬럼"+cmd.getColumn());
		
		List<StudentBean> temp = new ArrayList<>();
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD)
					.geConnection()// 너무빠르다 담자마자 결국 객체가된다 호출하자마자
					.prepareStatement(SQL.STUDENT_FINDNAME);
			pstmt.setString(1, "%"+cmd.getSearchWord()+"%");
			ResultSet rs = pstmt.executeQuery();
			StudentBean member = null; // 아파트대지땅구입
			while (rs.next()) { // rs.next 무조건
				member = new StudentBean(); // 건물올림 살사람들 들어오게
				member.setId(rs.getString(DB.ID)); // 입주
				member.setName(rs.getString(DB.MEMBER_NAME));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				member.setEmail(rs.getString(DB.EMAIL));
				member.setPhone(rs.getString(DB.PHONE));
				member.setTitle(rs.getString(DB.TITLE));
				member.setNum(rs.getString(DB.NUM));
				member.setRegdate(rs.getString(DB.MEMBER_REGDATE));
				temp.add(member); // 분양완료 분양완료
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return temp;
	}

	@Override
	public StudentBean selectById(Command cmd) {
		// TODO Auto-generated method stub
		StudentBean member = null;
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD)
					.geConnection()// 너무빠르다 담자마자 결국 객체가된다 호출하자마자
					.prepareStatement(SQL.STUDENT_FINDBYID);
			pstmt.setString(1, cmd.getSearchWord());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new StudentBean(); // 건물올림 살사람들 들어오게
				member.setId(rs.getString(DB.ID)); // 입주
				member.setName(rs.getString(DB.MEMBER_NAME));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				member.setEmail(rs.getString(DB.EMAIL));
				member.setPhone(rs.getString(DB.PHONE));
				member.setTitle(rs.getString(DB.TITLE));
				member.setNum(rs.getString(DB.NUM));
				member.setRegdate(rs.getString(DB.MEMBER_REGDATE));
	      	}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	@Override
	public String allcount(Command cmd) {
	      System.out.println("count 진입"+cmd.getSearchWord());
	      System.out.println("count 진입"+cmd.getColumn());
	      String count = "";
	      PreparedStatement pstmt=null;
	      ResultSet rs =null;
	       String sql="";
	       String search=cmd.getSearchWord();
	       sql=(search==null)?"%":"%"+search;
	      try {
	         conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).geConnection();
	         if(cmd.getSearchWord()==null){
	            System.out.println("cmd.getSearch() is null");
	            pstmt=conn.prepareStatement(SQL.STUDENT_COUNTT);
	            pstmt.setString(1, "%");
	         }else{
	            System.out.println("cmd.getSearch() is not null");
	            pstmt=conn.prepareStatement(SQL.STUDENT_COUNTT);
	            pstmt.setString(1, "%"+cmd.getSearchWord()+"%");
	         }
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            count = rs.getString("count");
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return count;
	   }
	@Override
	public String update(MemberBean bean) {

		String rs = "";
		try {
			// String.format("UPDATE %s SET %s=? WHERE
			// %s=?",DB.TABLE_MEMBER,DB.PASSWORD,DB.MEMBER_ID);
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD)
					.geConnection().prepareStatement(SQL.MEMBER_UPDATE);
			pstmt.setString(1, bean.getPassword());
			pstmt.setString(2, bean.getId());

			rs = String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			System.out.println("MEMBERDAO UPDATE");
			e.printStackTrace();
		}
		return rs;// TODO Auto-generated method stub

	}

	@Override
	public String delete(Command cmd) {
		// TODO Auto-generated method stub
		String rs = "";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD)
					.geConnection().prepareStatement(SQL.MEMBER_DELETE);
			pstmt.setString(1, cmd.getSearchWord());
			rs = String.valueOf(pstmt.executeUpdate());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	   @Override
	   public MemberBean login(Command cmd) {
	      MemberBean member=null;
	      System.out.println("$ ID"+cmd.getSearchWord());
	      try {
	         PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).geConnection().prepareStatement("select * from member where member_id like ?");
	         pstmt.setString(1, cmd.getSearchWord());
	         ResultSet rs=pstmt.executeQuery();
	         if(rs.next()){
	            member=new MemberBean();
	            member.setId(rs.getString(DB.MEMBER_ID));
	            member.setName(rs.getString(DB.MEMBER_NAME));
	            member.setPassword(rs.getString(DB.MEMBER_PASS));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return member;
	   }
}