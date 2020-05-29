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