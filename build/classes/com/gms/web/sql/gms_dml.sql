-- id,name,password,ssn,regdate
 --모든 카운트를 가져오는 문법 AS "" 이름만 변수바꾸는거
 --입력
SELECT * FROM Member; --확인전체 C
SELECT * FROM Member WHERE name='홍길동';  --R
SELECT * FROM Member WHERE id='cho';
SELECT COUNT(*) AS count FROM Member; --U
UPDATE Member SET password='2' WHERE id='cho';
DELETE FROM Member WHERE id='kim';

SELECT * FROM Member WHERE id='hong'; -이름으로찾기
SELECT * FROM Member; 
SELECT * FROM Board;  --테이블확인
SELECT * FROM major;

SELECT * FROM Board WHERE id LIKE 's___%';  <!-- 보드 테이블 전체중에 아이디에서 s로스지가하는거찾아라3번째자리까지  -->
SELECT * FROM Member ORDER BY name,ssn;  <!-- 이름은 주민번호는 오름차순 -->
SELECT * FROM Member ORDER BY name DESC,ssn ASC; <!-- 이름은 내림차순 주민번호는 오름차순 -->
SELECT SUM(article_seq) FROM Board;  <!-- 시퀀스번호의 합구하기 -->

--테이블 2개일때 검색
SELECT * FROM Member m, Board b  WHERE m.id=b.id; <!-- 아이디값이같으면  -->
SELECT * FROM Member m, Board b  WHERE m.id=b.id ORDER BY article_seq; <!-- 2중조인 게시글 먼져친거부터 검색 -->
SELECT * FROM Member m, Board b ,Grade g  WHERE m.id=b.id AND m.id=g.id; <!-- 3중조인 -->

SELECT ssn FROM Member WHERE ROWNUM <= 2;
SELECT ssn FROM Member WHERE ROWNUM ORDER BY DESC <= 2;

SELECT * FROM Member m, Board b  WHERE m.id=b.id OR ROWNUM <=3 
ORDER BY DESC

--테이블안에 데이터 넣게
INSERT INTO %s(%s,%s,%s,%s,%s,%s) VALUES(article_seq.nextval,?,?,?,0,SYSDATE);
insert into %s(%s, %s, %s, %s, %s, %s)values(article_seq.nextval, ?, ?, ?, ?, SYSDATE)
;

INSERT INTO PROF(MEMBER_ID,SALARY) 
VALUES('mankiew','9800');

INSERT INTO Member(member_id,name,password,ssn,regdate,phone,email,major,profile,major_id) 
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('gogh','고흐','1','530105-123456',SYSDATE,'art','010-1234-6666','gogh@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('james','제임스','1','850105-123456',SYSDATE,'computer','010-2234-6666','james@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('bear','베어','1','750105-123456',SYSDATE,'tourism','010-3334-6666','bear@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('choguk','조국','1','630105-123456',SYSDATE,'economics','010-4434-6666','choguk@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('cho','조봉기','1','841105-123456',SYSDATE,'art','010-5534-6666','cho@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('hong','홍길동','1','930105-123456',SYSDATE,'computer','010-1345-6666','hong@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('hong1','홍서범','1','520105-123456',SYSDATE,'computer','010-1634-6666','hong@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('kim','김건모','1','700105-123456',SYSDATE,'computer','010-7734-6666','kim@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('lim','임꺽정','1','920105-123456',SYSDATE,'computer','010-1254-6666','lim@test.com','defaultimg.jpg');
INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile)
VALUES('lee','이소룡','1','280105-123456',SYSDATE,'computer','010-9634-6666','lee@test.com','defaultimg.jpg');
select * from MEMBER;

INSERT INTO Student (member_id,stu_no)
VALUES('cho','20161000');
INSERT INTO Student (member_id,stu_no)
VALUES('hong','20161001');
INSERT INTO Student (member_id,stu_no)
VALUES('hong1','20161002');
INSERT INTO Student (member_id,stu_no)
VALUES('kim','20161003');
INSERT INTO Student (member_id,stu_no)
VALUES('lim','20161004');
INSERT INTO Student (member_id,stu_no)
VALUES('lee','20161005');

select * from Student;

select * from student s, Member m


INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'유선호의 글','꽃 봄바람을 무엇이 뿐이다.',SYSDATE,0,'hong1');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'홍길동 글','꽃 무엇이 뿐이다.',SYSDATE,0,'cho');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'유선호의 글','꽃 봄바람을 무 뿐이다.',SYSDATE,0,'cho');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'유선호의 글','꽃 봄바람엇이 뿐이다.',SYSDATE,0,'hong');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'홍길동 글','람을 무엇이 뿐이다.',SYSDATE,0,'kim');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'유선호의 글','꽃 봄바람을 무엇이 뿐.',SYSDATE,0,'james');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'유선호의 글','꽃 봄 무엇이 뿐이다.',SYSDATE,0,'bear');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'홍길동 글','꽃 봄바람을 무엇이 뿐이다.',SYSDATE,0,'lim');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'유선호의 글','꽃엇이 뿐이다.',SYSDATE,0,'lee');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'조국','꽃 봄바람엇이 뿐이다.',SYSDATE,0,'choguk');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'이소룡','꽃 봄바람을  뿐이다.',SYSDATE,0,'lee');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) 
VALUES(seq.nextval,'이소룡','꽃 봄바이 뿐이다.',SYSDATE,0,'lee');


select * from major;
insert into major (major_id,title) values ('tourism','관광학');
insert into major (major_id,title) values ('art','미술학');
insert into major (major_id,title) values ('economics','경제학');
insert into major (major_id,title) values ('computer','컴공');




INSERT INTO Member (member_id, name, password,ssn,regdate,major_id,phone,email,profile) VALUES('mankiew','맨큐','1','800108-123456',SYSDATE,'economic','010-1234-7777','mankiew@test.com','default.jpg');