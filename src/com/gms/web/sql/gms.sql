--****************************
--2017 .8 .2
-- 1 MAJOR_TAB
-- 2 SUBJECT_TAB
-- 3 MEMBER_TAB
-- 4 PROF_TAB
-- 5 STUDENT_TAB
-- 6 GRADE_TAB
-- 7 BOARD_TAB

--******************************
SELECT * FROM ITEM;
SELECT * FROM major;
SELECT * FROM TAB;
DROP SEQUENCE article_seq;
CREATE SEQUENCE seq
	START WITH 2000
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
	
-- ***
-- 1 MAJOR_TAB
-- 2017-08-02
-- article_seq,id,title,
-- content,hitcount,regdate
--******************************
-- DDL
CREATE TABLE major(
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	primary key(major_id)
);
-- DML
	insert into major values('computer','컴공');
select * from major;
alter table major add column member_id varchar2(10);
-- *********************
-- 2 SUBJECT_TAB
-- 2017-08-02
-- subj_id,major_id,title,
--************************

-- DDL	
SELECT * FROM subject;
CREATE TABLE subject(
	subj_id VARCHAR2(10),
	title VARCHAR2(10),
	major_id VARCHAR2(10),
	primary key(subj_id),
	foreign key(major_id) references major(major_id) ON DELETE CASCADE
);
	
-- DDL
 INSERT INTO subject(subj_id,title,major_id) VALUES('java','자바','computer');
 INSERT INTO subject(subj_id,title,major_id) VALUES('c++','c++','computer');
 INSERT INTO subject(subj_id,title,major_id) VALUES('jsp','jsp','computer');
 INSERT INTO subject(subj_id,title,major_id) VALUES('html','html','computer');
 -- *********************
-- 3 MEMBER_TAB
-- 2017-08-02
-- member_id,name,password,ssn,regdate,major_id,phone,email,profile
--************************

 --DML
 CREATE TABLE Member(
	member_id VARCHAR2(10),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	regdate date,
	major_id VARCHAR2(10),
	phone VARCHAR2(20),
	email VARCHAR2(20),
	profile VARCHAR2(20),
	primary key(member_id),
	foreign key(major_id) references major(major_id) ON DELETE CASCADE
);
--DDL

   SELECT * FROM Member;
   SELECT * FROM Major;
 
 -- *********************
-- 4 PROF_TAB
-- 2017-08-02
-- member_id,name,password,ssn,regdate,major_id,phone,email,profile
--************************
--dml
   SELECT * FROM PROF;
	CREATE TABLE Member(
	member_id VARCHAR2(10),
	salary VARCHAR2(10),
	foreign key(member_id) references major(member_id) ON DELETE CASCADE
);

INSERT INTO PROF(member_id,salary) VALUES('choguk','9500');
INSERT INTO PROF(member_id,salary) VALUES('james','8000');
INSERT INTO PROF(member_id,salary) VALUES('bear','6000');
INSERT INTO PROF(member_id,salary) VALUES('gogh','4000'); 
 -- *********************
-- 5 STUDENT_TAB
-- 2017-08-02
-- member_id,name,password,ssn,regdate,major_id,phone,email,profile
--************************
SELECT * FROM student;
CREATE TABLE Student (
   member_id varchar2(10),
   stu_no varchar2(8),
   PRIMARY KEY (member_id),
   FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);
INSERT INTO Student(member_id,stu_no) VALUES('','');
 INSERT INTO Student(member_id,stu_no) VALUES('','');
 -- *********************
-- 6 GRADE_TAB
-- 2017-08-02
-- grade_seq,name,member_id,subj_id,score,exam_date
--************************
--DML
SELECT * FROM GRADE;

CREATE TABLE grade(
	grade_seq NUMBER,
	member_id VARCHAR2(10),
	subj_id VARCHAR2(10),
	score VARCHAR2(10),
	exam_date VARCHAR2(12),
	primary key(grade_seq),
	foreign key(subj_id) references subject(subj_id) ON DELETE CASCADE,
	foreign key(member_id) references Member(member_id) ON DELETE CASCADE
);

 -- *********************
-- 7 BOARD_TAB
-- 2017-08-02
-- article_seq,member_id,title,content,regdate,major_id,phone,email,profile
--************************
--DML

CREATE TABLE Board(
   article_seq NUMBER,
   member_id VARCHAR2(10),
   title VARCHAR2(20),
   content VARCHAR2(80),
   hitcount NUMBER,
   regdate DATE,
   PRIMARY KEY(article_seq),
   FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);

INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'cho','java','80','2017-03');

--member_id 입력하면 평균 점수를 반환하는 sql----------------------------------------------------------------
select sum(score)
from(select distinct
m.member_id id,m.name name,mj.title major,g.SCORE score,sj.title subject,g.exam_date
from member m,student s,grade g,subject sj, major mj
where 
    m.member_id=s.member_id
    and m.member_id = g.member_id
    and sj.MAJOR_ID = mj.MAJOR_ID
    and sj.subj_id = g.SUBJ_ID) t
where t.id='cho';

-----------------------------------------------------------------
--member_id --------------iner join--------이너 조인------------------------------------------

select avg(score)
from(select distinct
m.member_id id,m.name name,
g.score score,g.exam_date
from Grade g
    join subject s on g.subj_id=s.subj_id
    join member m on m.member_id=g.member_id
    ) t
where t.id='cho';

-----------------------------------------------------------------

INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'cho','java','90','2017-03');
INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'cho','java','80','2017-04');
INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'cho','java','95','2017-05');

INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'hong','java','40','2017-03');
INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'hong','java','60','2017-04');
INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'hong','java','90','2017-05');

INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'lee','java','95','2017-03');
INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'lee','java','78','2017-04');
INSERT INTO grade(grade_seq,member_id,subj_id,score,exam_date) VALUES(seq.nextval,'lee','java','79','2017-05');
--DDL


-- *********************
-- 6 BOARD_TAB
-- 2017-08-02
-- member_id,name,password,ssn,regdate,major_id,phone,email,profile
--************************
--DML

CREATE TABLE Board(
	article_seq NUMBER,
	hitcount NUMBER,
	id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	regdate DATE,
	primary key(article_seq),
	FOREIGN KEY(id) REFERENCES MEMBER(id) ON DELETE CASCADE
);
insert into board values(seq nextval, 0,'you','유선호의 글','꽃 봄바람을 무엇이 뿐이다.',sysdate);

CREATE TABLE Board(
	article_seq NUMBER,
	hitcount NUMBER,
	id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	regdate DATE,
	primary key(article_seq),
	FOREIGN KEY(id) REFERENCES MEMBER(id) ON DELETE CASCADE
);

SELECT * FROM member;

--phone, email,major,subject
ALTER TABLE member ADD phone VARCHAR(13);
ALTER TABLE member ADD email VARCHAR(30);



SELECT * FROM major;
drop table grade;
SELECT * FROM major;
SELECT * FROM subject;
SELECT * FROM grade;

--기존 테이블에 없는 칼럼을 추가해서 fk로 만드는 로직
ALTER TABLE member ADD profile VARCHAR2(30);

ALTER TABLE member
ADD CONSTRAINT member_fk_major
FOREIGN KEY (major_id) REFERENCES major(major_id);



select sum(score)
from(select distinct
m.member_id id,m.name name,mj.title major,g.SCORE score,sj.title subject,g.exam_date
from member m,student s,grade g,subject sj, major mj
where 
    m.member_id=s.member_id
    and m.member_id = g.member_id
    and sj.MAJOR_ID = mj.MAJOR_ID
    and sj.subj_id = g.SUBJ_ID) t
where t.id='cho';

select *
from board b, member m
where b.member_id=m.member_id;


select *
from board b inner join member m
on  b.member_id=m.member_id
where m.member_id='hong';


select rownum no,t2.*
from(select t.id id, avg(score)
    from(select distinct
      m.member_id id,g.SCORE score
        from grade g
           inner join subject s on g.subj_id=s.subj_id
           inner join member m on m.member_id=g.member_id)t
    
    group by t.id
    order by avg(score) desc
)t2
     where rownum <4
;

select grade ||'학년'학년 ,dname 학과 ,stuno 학번 , name 이름 
from stud s
join dept  on Dname ='메카' and grade = '3'
order by grade asc ,DNAME asc , STUNO asc; 

select rownum  no,member_id id,name 이름,ssn 생년월일,phone 전화번호,email 이메일,major_id 수강과목,regdate 등록일 
   from member ; 

drop table student;
select * from STUDENT;
create view student (num,id,name,ssn,regdate,phone,email,title)
as
select rownum num, 
from (select a.member_id id, a.name,rpad(substr(a.ssn,1,7),14,'*') ssn,to_char(a.regdate,'yyyy-mm-dd') regdate,
        a.phone phone,a.email email,listagg(s.title,',') within group(order by s.title) title
        from member a
        left  join major m on a.member_id like m.member_id
        left join subject s on m.subj_id like s.subj_id
        group by a.member_id, a.name, a.ssn,a.regdate,a.phone,a.email
        order by regdate
) t
  order by rownum desc
; 

drop view student;

create view student(num,id,name,ssn,regdate,phone,email,title)
as
    select rownum, t.*
from (
    select a.member_id, a.name,rpad(substr(a.ssn,1,7),14,'*') ssn, a.phone, a.email, LISTAGG(m.SUBJ_ID, ',') within group (order by m.SUBJ_ID) title, to_char(a.regdate,'yyyy-MM-dd') regdate 
    from member a
        left outer join major m on a.member_id = m.member_id
     --   left join subject s on m.subj_id = s.subj_id
    group by a.member_id, a.name, a.ssn, a.phone, a.email,a.regdate  
    order by regdate 
) t
order by rownum desc;
  
  select * from STUDENT;
	select * from major;
	
	<!-- 마지막으로 가입한 순서 5명부터 뽑아 출력  -->
select * 
from student
where rownum <=5;

	
select * 
from student  
where num>(select count(*) from student)-5;

select t.*
from(select rownum rnum,s.*
    from student s)t
    where t.rnum between 1 and 5;
    
    select t2.*
from(select rownum seq,t.*
    from (select *
	from student 
	where name like '%이길동%'
	order by num desc) t)t2
    where t2.seq between 1 and 5
    ;

    select t2.* from(select rownum seq,t.* from (select * from student where name like '%이%' order by num desc) t)t2 where t2.seq between 1 and 5;
    
     select t2.* from(select rownum seq,t.* from (select * from student where name like '%이%' order by num desc) t)t2 where t2.seq between 1 and 5;