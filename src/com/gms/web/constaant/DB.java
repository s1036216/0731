package com.gms.web.constaant;
//상수값만 관리 
public class DB {
	public static final String ORACLE_DRIVER="oracle.jdbc.driver.OracleDriver";
	public static final String ORACLE_URL="jdbc:oracle:thin:@localhost:1521:xe";
	public static final String DB2_DRIVER="";
	public static final String DB2_URL="";
	public static final String MYSQL_DRIVER="";
	public static final String MYSQL_URL="";
	public static final String MSSQL_DRIVER="";
	public static final String MSSQL_URL="";
	public static final String MARIADB_DRIVER="";
	public static final String MARIADB_URL="";
	
	public static final String USERNAME="hanbit";
	public static final String PASSWORD="hanbit";
	public static final String TABLE_MEMBER="Member";
	public static final String MEMBER_ID="member_id";
	public static final String MEMBER_NAME="name";
	public static final String MEMBER_PASS="password";
	public static final String MEMBER_SSN="ssn";
	public static final String MEMBER_REGDATE="regdate";
	public static final String TABLE_BOARD="Board";
	public static final String TABLE_SEQ="article_seq";
	public static final String TABLE_TITLE="title";
	public static final String TABLE_HITCOUNT="hitcount";
	public static final String TABLE_ID="id";
	public static final String TABLE_CONTENT="content";
	public static final String TABLE_REGDATE="regdate";
	
	//article_seq,id,title,content,hitcount,regdate
	public static final String BOARD_COUNT="hitcount";
	public static final String BOARD_ARTICLE_SEQ="article_seq";
	public static final String BOARD_ID="board_id";
	public static final String TITLE="title";
	public static final String BOARD_CONTENT="content";
	public static final String BOARD_HITCOUNT="hitcount";
	public static final String BOARD_REGADATE="regdate";
	
	public static final String TABLE_MAJOR="major";
	public static final String MAJOR_ID="major_id";
	public static final String PHONE="phone";
	public static final String PROFILE="profile";
	public static final String EMAIL="email";
	public static final String SUBJ_ID="subj_id";
	
	public static final String TABLE_STUDENT="student";
	public static final String NUM="num";
	public static final String ID="id";
	public static final String TABLE_ITEM="item";
	public static final String ITEM_COUNT="count";
}
// article_seq NUMBER id VARCHAR2(10), title VARCHAR2(20), content VARCHAR2(80), hitcount NUMBER,