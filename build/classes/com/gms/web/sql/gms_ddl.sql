-- id,name,password,ssn,regdate
--테이블틀만듬
DROP SEQUENCE article_seq; 

CREATE SEQUENCE article_seq
	START WITH 1000
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;

CREATE TABLE Member(  
	 id VARCHAR2(10),
	 name VARCHAR2(10),
	 password VARCHAR2(10),
	 ssn VARCHAR2(15),
	 regdate DATE,
	 PRIMARY KEY(id)
);
SELECT * FROM Member; --확 인하려고
DROP TABLE Member; --ddl 전체 지움
SELECT * FROM BOARD;
DROP TABLE Board;

SELECT COUNT(*) AS article_seq FROM Board;

CREATE TABLE Board(
   article_seq NUMBER,
   id VARCHAR2(10),
   title VARCHAR2(20),
   content VARCHAR2(80),
   hitcount NUMBER,
   regdate DATE,
   PRIMARY KEY(article_seq),
   FOREIGN KEY(id) REFERENCES Member(id)
      ON DELETE CASCADE--누군가가 탈퇴하면 그 사람이 사용한 글까지 삭제해라 ON DELETE CASCADE
);


