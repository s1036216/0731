package com.gms.web.daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gms.web.constaant.DB;
import com.gms.web.constaant.SQL;
import com.gms.web.constaant.Vendor;
import com.gms.web.dao.ArticleDAO;
import com.gms.web.domain.ArticleBean;
import com.gms.web.factory.DatabaseFactory;

public class ArticleDAOImpl implements ArticleDAO {
	
	public static ArticleDAOImpl instance;
	public static ArticleDAOImpl getInstance() {
		
		return new ArticleDAOImpl();
	}

	private ArticleDAOImpl(){
					}
	@Override
	public String insert(ArticleBean bean) {
		String result="";
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.USERNAME,DB.PASSWORD).geConnection()
					.prepareStatement(SQL.BOARD_INSERT);
			pstmt.setString(1, bean.getId()); 
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());
		
			result=String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
	return result;	
	}
		
	@Override
	public List<ArticleBean> list() {
		List<ArticleBean> list=new ArrayList<>(); //이거때문에 와일문
		try {
			ResultSet rs=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).geConnection()//너무빠르다 담자마자 결국 객체가된다 호출하자마자
					.prepareStatement(SQL.BOARD_LIST).executeQuery();
		//	article_seq,id,title,content,hitcount,regdate					
			ArticleBean bean=null; //아파트대지땅구입
		while(rs.next()){ //rs.next 무조건
			bean=new ArticleBean(); //건물올림 살사람들 들어오게
			bean.setArticleSeq(rs.getInt("article_seq"));
			bean.setId(rs.getString("id")); //입주
			bean.setTitle(rs.getString("title"));
			bean.setContent(rs.getString("content"));
			bean.setHitcount(rs.getInt("hitcount"));
			bean.setRegdate(rs.getString("regdate"));
			list.add(bean); //분양완료
		
		}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ArticleBean> findId(String id) {
		// TODO Auto-generated method stub
		List<ArticleBean> list=new ArrayList<>(); 
		ArticleBean bean=null;
		try {
			PreparedStatement stmt=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.USERNAME,DB.MEMBER_PASS).geConnection()
			.prepareStatement(SQL.BOARD_FINDBYID);
			stmt.setString(1, id); //1물음표 첫번째 에 아이디값을넣어라
			ResultSet rs=stmt.executeQuery();
					while(rs.next()){
					bean=new ArticleBean(); //건물올림 살사람들 들어오게
					bean.setArticleSeq(rs.getInt(DB.TABLE_SEQ));
					bean.setId(rs.getString(DB.TABLE_ID)); //입주
					bean.setTitle(rs.getString(DB.TABLE_TITLE));
					bean.setContent(rs.getString(DB.TABLE_CONTENT));
					bean.setHitcount(rs.getInt(DB.TABLE_HITCOUNT));
					bean.setRegdate(rs.getString(DB.TABLE_REGDATE));
					list.add(bean); //분양완료
					System.out.println(list);	
					
				}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ArticleBean findSeq(int seq) {
		ArticleBean bean=null;
		try {
			PreparedStatement stmt=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.USERNAME,DB.MEMBER_PASS).geConnection()
					.prepareStatement(SQL.BOARD_FINDBYSEQ);
			stmt.setInt(1, seq);
			ResultSet rs=stmt.executeQuery();
			if(rs.next()){
				bean=new ArticleBean();
				bean.setArticleSeq(rs.getInt(DB.TABLE_SEQ));
				bean.setId(rs.getString(DB.TABLE_ID)); //입주
				bean.setTitle(rs.getString(DB.TABLE_TITLE));
				bean.setContent(rs.getString(DB.TABLE_CONTENT));
				bean.setHitcount(rs.getInt(DB.TABLE_HITCOUNT));
				bean.setRegdate(rs.getString(DB.TABLE_REGDATE));
					
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public String count() {
		String count="";
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.USERNAME,DB.PASSWORD).geConnection()
			.prepareStatement(SQL.BOARD_COUNT);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			count=rs.getString("count");
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}	@Override
	public String modify(ArticleBean bean) {
		String result="";
		ArticleBean temp=findSeq(bean.getArticleSeq());
		String title=(bean.getTitle().equals(""))?temp.getTitle():bean.getTitle();
		String content=(bean.getContent().equals(""))?temp.getContent():bean.getContent();
		try {
		PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.USERNAME,DB.PASSWORD)
				.geConnection().prepareStatement(SQL.BOARD_UPDATE);
		pstmt.setString(1,title);
		pstmt.setString(2,content);
		pstmt.setInt(3,bean.getArticleSeq());
		result=String.valueOf(pstmt.executeUpdate());		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}	
	@Override
	public String remove(int seq) {
		String rs="";
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.USERNAME,DB.PASSWORD).geConnection()
			.prepareStatement(SQL.BOARD_DELETE);
			pstmt.setInt(1, seq);
			rs=String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
}