-- 회원 테이블 생성
-- 인덱스는 넣어주는 것이 좋다!
-- 오토인크리먼트는 프라이먼트이여만 한다.

-- 로그 테이블 생성

insert into posture(memID, video, TakeBack, Swing, Impact, FollowThrough, score, comment_1, comment_2, comment_3, comment_4, memo, train_date) 
values('admin0581', 'asdasdasd', 'back', 'swing', 'impact', 'followthrough', 90, 'good1', 'good2', 'good3', 'good4', 'memo', '2023-06-13')
select * from posture;

-- 훈련 로그 테이블 생성
create table log (
   logIdx int not null auto_increment,
   logDate varchar(20) not null,
   logMemo varchar(200) not null,
   memID varchar(20) not null,
   FOREIGN KEY (memID) REFERENCES member (memID) ON DELETE CASCADE,
   primary key(logIdx)
);

select * from log;

drop table log;

insert into log(logDate, logMemo, memID) 
values('2023-06-07', '디비 끊어졌다.(06.07)1', 'a');

insert into log(logDate, logMemo, memID) 
values('2023-06-07', '디비 끊어졌다.(06.07)2', 'a');

insert into log(logDate, logMemo, memID) 
values('2023-06-08', '목요일이다.(06.08)1', 'a');

insert into log(logDate, logMemo, memID) 
values('2023-06-08', '목요일이다.(06.08)2', 'a');

insert into log(logDate, logMemo, memID) 
values('2023-06-09', '금요일이다.(06.09)1', 'a');

insert into log(logDate, logMemo, memID) 
values('2023-06-09', '금요일이다.(06.09)2', 'a');

-- 코치 테이블 생성
create table coach (
   coachIdx int not null auto_increment,
   region varchar(20) not null,
   name varchar(20) not null,
   career varchar(300) not null,
   beginDate varchar (50) not null,
   img varchar(20) not null,
   primary key(coachIdx)
);

select * from coach;

DROP TABLE coach;
DELETE FROM coach WHERE name = '이성열'

create table posture(
   pIdx int not null auto_increment,
   memID varchar(20),
   video varchar(30),
   TakeBack varchar(100),
   Swing varchar(100),   
   Impact varchar(100),   
   FollowThrough varchar(100),
   score varchar(10),
   comment_1 varchar(200),
   comment_2 varchar(200),
   comment_3 varchar(200),
   comment_4 varchar(200),
   train_date datetime default now(),
   primary key(pIdx)
);

DROP TABLE posture;

select * from posture;



insert into coach(region, name, career, beginDate, img) 
values('용산','정경배','삼성 라이온즈 (1996~2001),
SK 와이번스 (2002~2009),
SK 와이번스 1군 타격코치 (2010),
SK 와이번스 1군 타격코치 (2014~2018),
두산 베어스 1군 타격코치 (2019),
두산 베어스 2군 타격코치 (2019),
한화 이글스 2군 타격코치 (2020),
한화 이글스 1군 수석·타격코치 (2020),
한화 이글스 2군 타격코치 (2021),
SSG 랜더스 1군 타격코치 (2022)','1996년 2차 6라운드 (전체 37번, 삼성)','정경배.png');

insert into coach(region, name, career, beginDate, img) 
values('용산','홍세완','해태-KIA 타이거즈 (2000~2010),
KIA 타이거즈 2군 타격코치 (2011~2012),
KIA 타이거즈 3군 타격코치 (2013),
KIA 타이거즈 1군 트레이닝·타격코치 (2013),
KIA 타이거즈 2군 타격코치 (2017),
KIA 타이거즈 1군 타격코치 (2019),
KIA 타이거즈 2군 타격코치 (2022~2023),
KIA 타이거즈 1군 타격보조코치 (2023~)','1996년 2차 11라운드 (해태)','홍세완.png');

insert into coach(region, name, career, beginDate, img) 
values('용산','김종훈','롯데 자이언츠 (1994~1997),
삼성 라이온즈 (1997~2007),
삼성 라이온즈 1군 타격보조코치 (2012~2013),
삼성 라이온즈 3군 타격코치 (2014~2016),
삼성 라이온즈 2군 타격코치 (2017),
삼성 라이온즈 1군 타격코치 (2017~2018),
삼성 라이온즈 2군 타격코치 (2018~2021),
삼성 라이온즈 1군 타격코치 (2022),
삼성 라이온즈 2군 타격코치 (2022)','1994년 2차 2라운드 (전체 12번, 롯데)','김종훈.png');

insert into coach(region, name, career, beginDate, img) 
values('강남','박한이','삼성 라이온즈 (2001~2019),
삼성 라이온즈 육성군 야수코치 (2021),
삼성 라이온즈 2군 타격코치 (2022),
삼성 라이온즈 1군 타격코치 (2022~)','1997년 2차 6라운드 (전체 44번, 삼성)','박한이.png');

insert into coach(region, name, career, beginDate, img) 
values('강남','이호준','해태 타이거즈 (1994~2000),
SK 와이번스 (2000~2012),
NC 다이노스 (2013~2017),
요미우리 자이언츠 2군 타격코치 (2018),
NC 다이노스 1군 타격코치 (2019~2021),
LG 트윈스 1군 타격코치 (2022~)','1994년 고졸 연고구단 자유계약 (해태)','이호준.png');

insert into coach(region, name, career, beginDate, img) 
values('강남','모창민','SK 와이번스 (2008~2012),
NC 다이노스 (2013~2021),
상무 피닉스 야구단 (2011~2012),
LG 트윈스 1군 타격보조코치 (2022~)','2008년 2차 1라운드 (전체 3번, SK)','모창민.png');

insert into coach(region, name, career, beginDate, img) 
values('송파','이병규','LG 트윈스 (1997~2006),
주니치 드래곤즈 (2007~2009),
LG 트윈스 (2010~2016),
LG 트윈스 1군 타격보조코치 (2018~2019),
LG 트윈스 1군 타격코치 (2020~2021),
LG 트윈스 2군 타격코치 (2022),
삼성 라이온즈 1군 수석코치 (2023~)','1997년 1차 지명 (LG)','이병규.png');

insert into coach(region, name, career, beginDate, img) 
values('송파','강동우','삼성 라이온즈 (1998~2005),
두산 베어스 (2006~2007),
KIA 타이거즈 (2008),
한화 이글스 (2009~2013),
두산 베어스 2군 타격코치 (2014),
두산 베어스 1군 타격코치 (2018),
두산 베어스 2군 타격코치 (2019),
두산 베어스 1군 타격코치 (2019~2022)','1998년 1차 지명 (삼성)','강동우.png');

insert into coach(region, name, career, beginDate, img) 
values('송파','김남형','현대 유니콘스 (2007),
우리-서울-넥센 히어로즈 (2008~2014),
한화 이글스 1군 타격보조코치 (2021),
한화 이글스 1군 타격코치 (2022~)','2007년 2차 3라운드 (전체 18번, 현대)','김남형.png');

insert into coach(region, name, career, beginDate, img) 
values('노원','강병식','현대 유니콘스 (2002~2007),
우리-서울-넥센 히어로즈 (2008~2012),
넥센 히어로즈 2군 타격코치 (2013~2014),
넥센 히어로즈 1군 타격보조코치 (2015~2016),
넥센-키움 히어로즈 1군 타격코치 (2017~2023),
고양 히어로즈 수석코치 (2023~)','1996년 2차 8라운드 (전체 59번, 현대)','강병식.png');

insert into coach(region, name, career, beginDate, img) 
values('노원','김태완','한화 이글스 (2006~2016),
넥센 히어로즈 (2017~2018),
고양 히어로즈 타격코치 (2019~),
질롱 코리아 코치 (2019/20)','2002년 2차 8라운드 (전체 60번, 한화)','김태완.png');

insert into coach(region, name, career, beginDate, img) 
values('노원','이범호','한화 이글스 (2000~2009),
후쿠오카 소프트뱅크 호크스 (2010),
KIA 타이거즈 (2011~2019),
KIA 타이거즈 2군 총괄코치 (2021),
KIA 타이거즈 1군 타격코치 (2022~)','2000년 2차 1라운드 (전체 8번, 한화)','이범호.png');

insert into coach(region, name, career, beginDate, img) 
values('노원','김강','한화 이글스 (2007~2011),
두산 베어스 (2012~2016),
두산 베어스 (2012~2016),
두산 베어스 2군 타격코치 (2017~2018),
kt wiz 1군 타격보조코치 (2019),
kt wiz 1군 타격코치 (2020~)','2007년 2차 3라운드 (전체 21번, 한화)','김강.png');

insert into coach(region, name, career, beginDate, img) 
values('강남','오윤','넥센 히어로즈 육성군 수비·주루코치 (2017~2018),
키움 히어로즈 1군 수비·주루코치 (2019~2020),
키움 히어로즈 1군 타격보조코치 (2021~2023),
키움 히어로즈 1군 타격코치 (2023~)','2000년 2차 2라운드 (전체 12번, 현대)','오윤.png');

insert into coach(region, name, career, beginDate, img) 
values('강남','조중근','kt wiz (2014~2015),
경찰 야구단 타격코치 (2016~2018),
kt wiz 2군 타격코치 (2019),
kt wiz 1군 타격보조코치 (2020),
kt wiz 2군 타격코치 (2021),
kt wiz 1군 타격보조코치 (2022~2023.04),
kt wiz 2군 타격코치 (2023.04~)','2001년 2차 8라운드 (전체 50번, SK)','조중근.png');

insert into coach(region, name, career, beginDate, img) 
values('송파','이영수','KIA 타이거즈 (2004~2011),
삼성 라이온즈 (2013),
상무 피닉스 야구단 타격코치 (2014~2017),
삼성 라이온즈 2군 타격코치 (2018),
삼성 라이온즈 1군 타격코치 (2018~2019),
삼성 라이온즈 1군 타격보조코치 (2020~2022)
두산 베어스 2군 타격코치 (2023~)','2000년 2차 4라운드 (전체 26번, 해태)','이영수.png');

insert into coach(region, name, career, beginDate, img) 
values('송파','유한준','현대 유니콘스 (2004~2007),
우리-서울-넥센 히어로즈 (2008~2015),
kt wiz (2016~2021),
kt wiz 2군 타격코치 (2023),
kt wiz 1군 타격보조코치 (2023~)','2000년 2차 3라운드 (전체 20번, 현대)','유한준.png');


insert into coach(region, name, career, beginDate, img) 
values('용산','김주찬','삼성 라이온즈 (2000),
롯데 자이언츠 (2001~2012),
KIA 타이거즈 (2013~2020),
두산 베어스 1군 수비·주루코치 (2021),
두산 베어스 1군 작전코치 (2022),
두산 베어스 1군 타격보조코치 (2023~)','2000년 2차 1라운드 (전체 5번, 삼성)','김주찬.png');

insert into coach(region, name, career, beginDate, img) 
values('용산','이도형','OB-두산 베어스 (1993~2001),
한화 이글스 (2002~2010),
고양 다이노스 배터리코치 (2015~2016),
NC 다이노스 1군 타격코치 (2017~2018),
고양 다이노스 타격코치 (2018),
NC 다이노스 1군 타격코치 (2018),
두산 베어스 1군 타격코치 (2019~2021),
두산 베어스 2군 타격코치 (2021),
두산 베어스 1군 타격코치 (2022),
두산 베어스 2군 타격코치 (2022~)','1993년 고졸 연고 자유계약 (OB)','이도형.png');

insert into coach(region, name, career, beginDate, img) 
values('노원','이성열','LG 트윈스 (2003~2008),
두산 베어스 (2008~2012),
넥센 히어로즈 (2012~2015),
한화 이글스 (2015~2021),
kt wiz 2군 타격 코치 (2022),
kt wiz 육성/재활군 타격 코치 (2023~)','2003년 2차 1라운드 (전체 3번, LG)','이성열.png');



-- 훈련 일지 테이블 생성
create table diary (
   DiaryIdx int not null auto_increment,
   DiaryTitle varchar(20) not null,
   DiaryStart varchar(20) not null,
   DiaryEnd varchar(20) not null,
   DiaryContent varchar(20) not null,
   DiaryColor varchar(20) not null,
   memID varchar(20) not null,
   FOREIGN KEY (memID) REFERENCES member (memID) ON DELETE CASCADE,
   primary key(DiaryIdx)
);

select * from diary;

DROP TABLE diary;

















drop table member;

create table member (
	memIdx int,
	memID varchar(20) not null,
	memPassword varchar(20) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(50),
	memProfile varchar(50),
	primary key(memID)
);

select * from member;


insert into member(memID,memPassword, memName, memAge, memGender, memEmail, memProfile) 
values('admin', '1234', '관리자', 20, '남자', 'admin@gmail.com', '');


-- 게시판 테이블 생성
create table board (
	idx int  not null auto_increment,
	memID varchar(20) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writter varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);

insert into board (title, content, writter)
values('나 손흥민인데 찐짜로', '주말에 조기축구 할사람', '손흥민');

insert into board (title, content, writter)
values('나 아이유인데 찐짜로', '노래방 갈사람', '아이유');

insert into board (title, content, writter)
values('나 이제동인데', '스타하러 갈사람', '이제동');

insert into board (title, content, writter)
values('나 브롬달인데', '주말에 당구치러 갈사람', '브롬달');

insert into board (title, content, writter)
values('나 쿠드롱인데', '주말에 죽빵치러 갈사람', '브롬달');

select * from board;
























