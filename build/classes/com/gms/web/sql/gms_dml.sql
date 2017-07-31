-- id,name,password,ssn,regdate
 --모든 카운트를 가져오는 문법 AS "" 이름만 변수바꾸는거
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('hong','홍길동','1','841213-123456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('cho','조봉기','1','841113-123456',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('byon','변용주','1','861111-111111',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('kim','김하윤','1','930103-211111',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('park','박정권','1','741013-111111',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('lee','이순신','1','861111-111111',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('cho4','조봉암','1','891013-111111',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate)
VALUES('hong1','홍길동','1','881111-111111',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('song','송혜교','1','801023-211111',SYSDATE);
INSERT INTO Member(id,name,password,ssn,regdate) 
VALUES('lee1','이순신','1','581013-111111',SYSDATE);  --입력
SELECT * FROM Member; --확인전체 C
SELECT * FROM Member WHERE name='홍길동';  --R
SELECT * FROM Member WHERE id='cho';
SELECT COUNT(*) AS count FROM Member; --U
UPDATE Member SET password='2' WHERE id='cho';
DELETE FROM Member WHERE id='kim';

SELECT * FROM Member WHERE id='hong'; -이름으로찾기

SELECT * FROM Board;  --테이블확인

--테이블안에 데이터 넣게
INSERT INTO %s(%s,%s,%s,%s,%s,%s) VALUES(article_seq.nextval,?,?,?,0,SYSDATE);
insert into %s(%s, %s, %s, %s, %s, %s)values(article_seq.nextval, ?, ?, ?, ?, SYSDATE)
;
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'cho','조봉기하이','별과 그들을 그림자는 천고에 그리하였는가?',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'cho','임꺽정','품었기 피고, 주며, 실로 물방아 굳세게 앞이 보이는 운다. ',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'lee','이순신하이','인생의 길을 이것을 능히 것이다.',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'kim','김건모노래','노래하며 얼마나 이것이다. ',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'song','송중기',' 것이 것은 동산에는 피부가 있으랴?',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'song','송혜교','그들의 어디 인간의 이것이다.',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'song','송승헌','청춘 하여도 있을 피가 얼마나 그들의 방황하였으며,',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'jang','전자렌지',' 봄바람이다. 위하여 실현에 피어나기 있으랴? 트고, ',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'cho1','밥솥','자신과 피가 주는 풍부하게 약동하다. ',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'cho2','사이다','것이 청춘의 이것은 노년에게서 광야에서 튼튼하며,',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'cho3','냉장고','? 새가 방황하여도, 속에서 그리하였는가?',0,SYSDATE);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(article_seq.nextval,'cho4','하이','그리하였는가?!@#@#!@#!@#@!#!@#@!#',0,SYSDATE);