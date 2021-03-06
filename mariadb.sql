-- member
create TABLE member(
mno number(5) PRIMARY KEY auto_increment,
name VARCHAR (15) not NULL,
jumin VARCHAR (18) not NULL,

userid VARCHAR (18) not NULL,
passwd VARCHAR (18) not NULL,

zipcode VARCHAR (7) not NULL,
addr1 VARCHAR (18) not NULL,
addr2 VARCHAR (18) not NULL,

email VARCHAR (18) not NULL,
mobile VARCHAR (18) not NULL,
regdate datetime DEFAULT CURRENT_TIMESTAMP
);

--board
create table board(
bno NUMBER (5) PRIMARY KEY auto_increment,
title VARCHAR (50) not NULL ,
userid VARCHAR (18) not NULL ,
regdate datetime DEFAULT CURRENT_TIMESTAMP ,
thumbup NUMBER (5) DEFAULT 0,
views NUMBER (5) DEFAULT 0,
contents mediumtext not null
);
--pds
create table pds(
pno int PRIMARY KEY auto_increment,
title VARCHAR (50) not NULL ,
userid VARCHAR (18) not NULL ,
regdate datetime DEFAULT CURRENT_TIMESTAMP ,
thumbup int DEFAULT 0,
views int DEFAULT 0,
contents mediumtext not null,
fname VARCHAR (50) ,
fsize int DEFAULT 0,
fdown int DEFAULT 0,
ftype VARCHAR (10)
);

--gallery
create table gallery(
gno int PRIMARY KEY auto_increment,
title VARCHAR (50) not NULL ,
userid VARCHAR (18) not NULL ,
regdate datetime DEFAULT CURRENT_TIMESTAMP ,
thumbup int DEFAULT 0,
views int DEFAULT 0,
contents mediumtext not null,
fname1 VARCHAR (50) ,
fname2 VARCHAR (50) ,
fname3 VARCHAR (50)
);

insert into board(title,userid,contents)
VALUES ('테스트입니다.','xzy123','아잉냉무');

insert into board(title,userid,contents)
VALUES ('시험용입니다.','abc123','제곧네');

insert into board(title,userid,contents)
VALUES ('연습용입니다.','popop','아잉냉무!!');

-- 페이징 SQL 문 : limit by
-- 첫 번째 게시물을 기준으로
-- 10-1만큼 게시물을 추출해서 출력
SELECT bno,title,userid,regdate,views FROM board
order by bno desc limit 0, 10; --1 page

SELECT bno,title,userid,regdate,views FROM board
order by bno desc limit 10, 10; --2 page


SELECT bno,title,userid,regdate,views FROM board
order by bno desc limit 20, 10; --3 page

-- select bno,title,userid,regdate,views from board
--order by bno desc limit startNum, 10
--cp: 1, perPage :10
--startNum? : startNum = (cp - 1) x perPage

SELECT count(bno) bdcnt from board;

--zipcode 지번주소 (2013.2 기준 52144건)
create table zipcode (
  zipcode VARCHAR (7),
  sido VARCHAR (7),
  gugun VARCHAR (25),
  dong VARCHAR (65),
  ri VARCHAR (50),
  bunji VARCHAR (25),
  seq VARCHAR(5)
);

select * from zipcode where dong like '주엽동';

select count(mno) from member where userid = 'abc123';

-- 댓글 시스템
CREATE TABLE bdreply (
  rno int PRIMARY KEY auto_increment,
  reply mediumtext,
  userid VARCHAR (18),
  regdate datetime default CURRENT_TIMESTAMP,
  thumbup int DEFAULT 0,
  bno int,
  refno int

);

insert into bdreply (reply, userid,bno,refno)
values('제곧내','xyz987',1,last_insert_id()+1);

insert into bdreply (reply, userid,bno,refno)
values('이잉','987xyz',1,last_insert_id()+1);

select * from bdreply;

select count(mno) cnt from member where userid = '123abc' and passwd = '987abc';