ALTER TABLE review
	DROP
		CONSTRAINT FK_member_TO_review
		CASCADE;

ALTER TABLE review
	DROP
		CONSTRAINT FK_contents_TO_review
		CASCADE;

ALTER TABLE comments
	DROP
		CONSTRAINT FK_review_TO_comments
		CASCADE;

ALTER TABLE pickList
	DROP
		CONSTRAINT FK_member_TO_pickList
		CASCADE;

ALTER TABLE pickList
	DROP
		CONSTRAINT FK_contents_TO_pickList
		CASCADE;

ALTER TABLE contents
	DROP
		CONSTRAINT FK_sigungu_TO_contents
		CASCADE;

ALTER TABLE contents
	DROP
		CONSTRAINT FK_contentsCate_TO_contents
		CASCADE;

ALTER TABLE blackreview
	DROP
		CONSTRAINT FK_review_TO_blackreview
		CASCADE;

ALTER TABLE blackreview
	DROP
		CONSTRAINT FK_member_TO_blackreview
		CASCADE;

ALTER TABLE sigungu
	DROP
		CONSTRAINT FK_sido_TO_sigungu
		CASCADE;

ALTER TABLE contentsDetail
	DROP
		CONSTRAINT FK_contents_TO_contentsDetail
		CASCADE;

ALTER TABLE contentsImage
	DROP
		CONSTRAINT FK_contents_TO_contentsImage
		CASCADE;

ALTER TABLE member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE hashTag
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE contentsCate
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE contents
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE sido
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE sigungu
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE contentsDetail
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE contentsImage
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE visitCount
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 해시테그 */
DROP TABLE hashTag 
	CASCADE CONSTRAINTS;

/* 리뷰 */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* 카테고리 */
DROP TABLE contentsCate 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE comments 
	CASCADE CONSTRAINTS;

/* pickList */
DROP TABLE pickList 
	CASCADE CONSTRAINTS;

/* 컨텐츠 */
DROP TABLE contents 
	CASCADE CONSTRAINTS;

/* 신고내역 */
DROP TABLE blackreview 
	CASCADE CONSTRAINTS;

/* 시/도코드 */
DROP TABLE sido 
	CASCADE CONSTRAINTS;

/* 시군구코드 */
DROP TABLE sigungu 
	CASCADE CONSTRAINTS;

/* contents_detail */
DROP TABLE contentsDetail 
	CASCADE CONSTRAINTS;

/* 컨텐츠이미지 */
DROP TABLE contentsImage 
	CASCADE CONSTRAINTS;

/* 방문 */
DROP TABLE visitCount 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE member (
	userId VARCHAR2(100) NOT NULL, /* 회원아이디 */
	pass VARCHAR2(16) NOT NULL, /* 비밀번호 */
	name VARCHAR2(40) NOT NULL, /* 이름 */
	age NUMBER, /* 나이 */
	gender VARCHAR2(3), /* 성별 */
	joinDate DATE DEFAULT sysdate, /* 가입일 */
	profile VARCHAR2(100), /* 프로필사진 */
	enable NUMBER(3) DEFAULT 1 /* 상태 */
);

COMMENT ON TABLE member IS '회원';

COMMENT ON COLUMN member.userId IS '회원아이디';

COMMENT ON COLUMN member.pass IS '비밀번호';

COMMENT ON COLUMN member.name IS '이름';

COMMENT ON COLUMN member.age IS '나이';

COMMENT ON COLUMN member.gender IS '성별';

COMMENT ON COLUMN member.joinDate IS '가입일';

COMMENT ON COLUMN member.profile IS '프로필사진';

COMMENT ON COLUMN member.enable IS '상태';

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			userId
		);

/* 해시테그 */
CREATE TABLE hashTag (
	hashTag VARCHAR2(100) NOT NULL, /* 태그이름 */
	rseq NUMBER(12) NOT NULL, /* 리뷰글번호 */
	contentsId NUMBER(12), /* 컨텐츠아이디 */
	logTime DATE /* 사용날짜 */
);

COMMENT ON TABLE hashTag IS '해시테그';

COMMENT ON COLUMN hashTag.hashTag IS '태그이름';

COMMENT ON COLUMN hashTag.rseq IS '리뷰글번호';

COMMENT ON COLUMN hashTag.contentsId IS '컨텐츠아이디';

COMMENT ON COLUMN hashTag.logTime IS '사용날짜';

ALTER TABLE hashTag
	ADD
		CONSTRAINT PK_hashTag
		PRIMARY KEY (
			hashTag,
			rseq
		);

/* 리뷰 */
CREATE TABLE review (
	rseq NUMBER NOT NULL, /* 리뷰글번호 */
	userId VARCHAR2(100), /* 회원아이디 */
	contentsId NUMBER(12), /* 컨텐츠아이디 */
	hashTag VARCHAR2(4000), /* 태그이름 */
	subject VARCHAR2(100), /* 제목 */
	starPoint NUMBER, /* 별점 */
	content CLOB, /* 내용 */
	logTime DATE, /* 작성시간 */
	saveFolder VARCHAR2(8), /* 저장폴더 */
	orignPicture VARCHAR2(100), /* 원본사진이름 */
	savePicture VARCHAR2(100) /* 저장사진이름 */
);

COMMENT ON TABLE review IS '리뷰';

COMMENT ON COLUMN review.rseq IS '리뷰글번호';

COMMENT ON COLUMN review.userId IS '회원아이디';

COMMENT ON COLUMN review.contentsId IS '컨텐츠아이디';

COMMENT ON COLUMN review.hashTag IS '태그이름';

COMMENT ON COLUMN review.subject IS '제목';

COMMENT ON COLUMN review.starPoint IS '별점';

COMMENT ON COLUMN review.content IS '내용';

COMMENT ON COLUMN review.logTime IS '작성시간';

COMMENT ON COLUMN review.saveFolder IS '저장폴더';

COMMENT ON COLUMN review.orignPicture IS '원본사진이름';

COMMENT ON COLUMN review.savePicture IS '저장사진이름';

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			rseq
		);

/* 카테고리 */
CREATE TABLE contentsCate (
	catCode VARCHAR2(12) NOT NULL, /* 분류코드 */
	catId NUMBER NOT NULL, /* 카테고리id */
	catName VARCHAR2(600), /* 카테고리name */
	catType VARCHAR2(8) /* 분류타입 */
);

COMMENT ON TABLE contentsCate IS '카테고리';

COMMENT ON COLUMN contentsCate.catCode IS '분류코드';

COMMENT ON COLUMN contentsCate.catId IS '카테고리id';

COMMENT ON COLUMN contentsCate.catName IS '카테고리name';

COMMENT ON COLUMN contentsCate.catType IS '분류타입';

ALTER TABLE contentsCate
	ADD
		CONSTRAINT PK_contentsCate
		PRIMARY KEY (
			catCode,
			catId
		);

/* 댓글 */
CREATE TABLE comments (
	rceq NUMBER NOT NULL, /* 리뷰글번호 */
	logId VARCHAR2(40), /* 작성자아이디 */
	logTime DATE, /* 작성시간 */
	content VARCHAR2(200) /* 글내용 */
);

COMMENT ON TABLE comments IS '댓글';

COMMENT ON COLUMN comments.rceq IS '리뷰글번호';

COMMENT ON COLUMN comments.logId IS '작성자아이디';

COMMENT ON COLUMN comments.logTime IS '작성시간';

COMMENT ON COLUMN comments.content IS '글내용';

/* pickList */
CREATE TABLE pickList (
	contentsId NUMBER(12) NOT NULL, /* 아이디 */
	userId VARCHAR2(100), /* 회원아이디 */
	wanna NUMBER, /* 가보고싶은곳/다녀온곳 */
	distence NUMBER /* 거리계산용 */
);

COMMENT ON TABLE pickList IS 'pickList';

COMMENT ON COLUMN pickList.contentsId IS '아이디';

COMMENT ON COLUMN pickList.userId IS '회원아이디';

COMMENT ON COLUMN pickList.wanna IS '가보고싶은곳/다녀온곳';

COMMENT ON COLUMN pickList.distence IS '거리계산용';

/* 컨텐츠 */
CREATE TABLE contents (
	contentsId NUMBER(12) NOT NULL, /* 아이디 */
	catCode VARCHAR2(12), /* 분류코드 */
	catId NUMBER, /* 카테고리id */
	sggCode NUMBER(5), /* 시군구코드 */
	sdCode NUMBER(5), /* 시도코드 */
	title VARCHAR2(600), /* 제목 */
	hit NUMBER, /* 조회수 */
	image1 VARCHAR2(), /* 이미지1 */
	image2 VARCHAR2(), /* 이미지2 */
	updateDate DATE, /* 갱신일자 */
	isEnd VARCHAR2(3) DEFAULT 1 /* 유효여부 */
);

COMMENT ON TABLE contents IS '컨텐츠';

COMMENT ON COLUMN contents.contentsId IS '아이디';

COMMENT ON COLUMN contents.catCode IS '분류코드';

COMMENT ON COLUMN contents.catId IS '카테고리id';

COMMENT ON COLUMN contents.sggCode IS '시군구코드';

COMMENT ON COLUMN contents.sdCode IS '시도코드';

COMMENT ON COLUMN contents.title IS '제목';

COMMENT ON COLUMN contents.hit IS '조회수';

COMMENT ON COLUMN contents.image1 IS '이미지1';

COMMENT ON COLUMN contents.image2 IS '이미지2';

COMMENT ON COLUMN contents.updateDate IS '갱신일자';

COMMENT ON COLUMN contents.isEnd IS '유효여부';

ALTER TABLE contents
	ADD
		CONSTRAINT PK_contents
		PRIMARY KEY (
			contentsId
		);

/* 신고내역 */
CREATE TABLE blackreview (
	rseq NUMBER NOT NULL, /* 리뷰글번호 */
	userId VARCHAR2(100), /* 회원아이디 */
	reportContent VARCHAR2(200), /* 신고내용 */
	reportDate DATE /* 신고일자 */
);

COMMENT ON TABLE blackreview IS '신고내역';

COMMENT ON COLUMN blackreview.rseq IS '리뷰글번호';

COMMENT ON COLUMN blackreview.userId IS '회원아이디';

COMMENT ON COLUMN blackreview.reportContent IS '신고내용';

COMMENT ON COLUMN blackreview.reportDate IS '신고일자';

/* 시/도코드 */
CREATE TABLE sido (
	sdCode NUMBER(5) NOT NULL, /* 시도코드 */
	sdName VARCHAR2(100) /* 시도이름 */
);

COMMENT ON TABLE sido IS '시/도코드';

COMMENT ON COLUMN sido.sdCode IS '시도코드';

COMMENT ON COLUMN sido.sdName IS '시도이름';

ALTER TABLE sido
	ADD
		CONSTRAINT PK_sido
		PRIMARY KEY (
			sdCode
		);

/* 시군구코드 */
CREATE TABLE sigungu (
	sggCode NUMBER(5) NOT NULL, /* 시군구코드 */
	sdCode NUMBER(5) NOT NULL, /* 시도코드 */
	sggName VARCHAR2(100) /* 시군구이름 */
);

COMMENT ON TABLE sigungu IS '시군구코드';

COMMENT ON COLUMN sigungu.sggCode IS '시군구코드';

COMMENT ON COLUMN sigungu.sdCode IS '시도코드';

COMMENT ON COLUMN sigungu.sggName IS '시군구이름';

ALTER TABLE sigungu
	ADD
		CONSTRAINT PK_sigungu
		PRIMARY KEY (
			sggCode,
			sdCode
		);

/* contents_detail */
CREATE TABLE contentsDetail (
	contentsId NUMBER(12) NOT NULL, /* 아이디 */
	homePage VARCHAR2(4000), /* 홈페이지 */
	telName VARCHAR2(1000), /* 주최자 명 */
	tel VARCHAR2(300), /* 주최자 전화번호 */
	playTime CLOB, /* 공연시간 */
	program CLOB, /* 행사프로그램 */
	useTime CLOB, /* 이용요금 */
	spendTime CLOB, /* 관람소요시간 */
	ageLimit VARCHAR2(2000), /* 관람가능연령 */
	bookingPlace CLOB, /* 예매처 */
	discountInfo CLOB, /* 할인정보 */
	placeInfo CLOB, /* 행사장위치안내 */
	infoSogae CLOB, /* 행사소개 */
	infoNaeyong CLOB, /* 행사내용 */
	eventStartDate NUMBER(8), /* 행사시작일 */
	eventEndDate NUMBER(8), /* 행사종료일 */
	xPoint NUMBER, /* x좌표 */
	yPoint NUMBER, /* y좌표 */
	zipCode VARCHAR2(20), /* 우편번호 */
	addr1 VARCHAR2(400), /* 주소 */
	addr2 VARCHAR2(400) /* 상세주소 */
);

COMMENT ON TABLE contentsDetail IS 'contents_detail';

COMMENT ON COLUMN contentsDetail.contentsId IS '아이디';

COMMENT ON COLUMN contentsDetail.homePage IS '홈페이지';

COMMENT ON COLUMN contentsDetail.telName IS '주최자 명';

COMMENT ON COLUMN contentsDetail.tel IS '주최자 전화번호';

COMMENT ON COLUMN contentsDetail.playTime IS '공연시간';

COMMENT ON COLUMN contentsDetail.program IS '행사프로그램';

COMMENT ON COLUMN contentsDetail.useTime IS '이용요금';

COMMENT ON COLUMN contentsDetail.spendTime IS '관람소요시간';

COMMENT ON COLUMN contentsDetail.ageLimit IS '관람가능연령';

COMMENT ON COLUMN contentsDetail.bookingPlace IS '예매처';

COMMENT ON COLUMN contentsDetail.discountInfo IS '할인정보';

COMMENT ON COLUMN contentsDetail.placeInfo IS '행사장위치안내';

COMMENT ON COLUMN contentsDetail.infoSogae IS '행사소개';

COMMENT ON COLUMN contentsDetail.infoNaeyong IS '행사내용';

COMMENT ON COLUMN contentsDetail.eventStartDate IS '행사시작일';

COMMENT ON COLUMN contentsDetail.eventEndDate IS '행사종료일';

COMMENT ON COLUMN contentsDetail.xPoint IS 'x좌표';

COMMENT ON COLUMN contentsDetail.yPoint IS 'y좌표';

COMMENT ON COLUMN contentsDetail.zipCode IS '우편번호';

COMMENT ON COLUMN contentsDetail.addr1 IS '주소';

COMMENT ON COLUMN contentsDetail.addr2 IS '상세주소';

ALTER TABLE contentsDetail
	ADD
		CONSTRAINT PK_contentsDetail
		PRIMARY KEY (
			contentsId
		);

/* 컨텐츠이미지 */
CREATE TABLE contentsImage (
	contentsId NUMBER(12) NOT NULL, /* 컨텐츠아이디 */
	serialNum VARCHAR2(500) NOT NULL, /* 시리얼숫자 */
	imgName VARCHAR2(500), /* 이미지명 */
	originImgurl VARCHAR2(500), /* 이미지url */
	smallImageUrl VARCHAR2(500) /* 작은이미지url */
);

COMMENT ON TABLE contentsImage IS '컨텐츠이미지';

COMMENT ON COLUMN contentsImage.contentsId IS '컨텐츠아이디';

COMMENT ON COLUMN contentsImage.serialNum IS '시리얼숫자';

COMMENT ON COLUMN contentsImage.imgName IS '이미지명';

COMMENT ON COLUMN contentsImage.originImgurl IS '이미지url';

COMMENT ON COLUMN contentsImage.smallImageUrl IS '작은이미지url';

ALTER TABLE contentsImage
	ADD
		CONSTRAINT PK_contentsImage
		PRIMARY KEY (
			contentsId,
			serialNum
		);

/* 방문 */
CREATE TABLE visitCount (
	statDate DATE NOT NULL, /* 집계일자 */
	visitCount NUMBER, /* 방문수 */
	visitorCount NUMBER /* 방문자수 */
);

COMMENT ON TABLE visitCount IS '방문';

COMMENT ON COLUMN visitCount.statDate IS '집계일자';

COMMENT ON COLUMN visitCount.visitCount IS '방문수';

COMMENT ON COLUMN visitCount.visitorCount IS '방문자수';

ALTER TABLE visitCount
	ADD
		CONSTRAINT PK_visitCount
		PRIMARY KEY (
			statDate
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			userId
		)
		REFERENCES member (
			userId
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_contents_TO_review
		FOREIGN KEY (
			contentsId
		)
		REFERENCES contents (
			contentsId
		);

ALTER TABLE comments
	ADD
		CONSTRAINT FK_review_TO_comments
		FOREIGN KEY (
			rceq
		)
		REFERENCES review (
			rseq
		);

ALTER TABLE pickList
	ADD
		CONSTRAINT FK_member_TO_pickList
		FOREIGN KEY (
			userId
		)
		REFERENCES member (
			userId
		);

ALTER TABLE pickList
	ADD
		CONSTRAINT FK_contents_TO_pickList
		FOREIGN KEY (
			contentsId
		)
		REFERENCES contents (
			contentsId
		);

ALTER TABLE contents
	ADD
		CONSTRAINT FK_sigungu_TO_contents
		FOREIGN KEY (
			sggCode,
			sdCode
		)
		REFERENCES sigungu (
			sggCode,
			sdCode
		);

ALTER TABLE contents
	ADD
		CONSTRAINT FK_contentsCate_TO_contents
		FOREIGN KEY (
			catCode,
			catId
		)
		REFERENCES contentsCate (
			catCode,
			catId
		);

ALTER TABLE blackreview
	ADD
		CONSTRAINT FK_review_TO_blackreview
		FOREIGN KEY (
			rseq
		)
		REFERENCES review (
			rseq
		);

ALTER TABLE blackreview
	ADD
		CONSTRAINT FK_member_TO_blackreview
		FOREIGN KEY (
			userId
		)
		REFERENCES member (
			userId
		);

ALTER TABLE sigungu
	ADD
		CONSTRAINT FK_sido_TO_sigungu
		FOREIGN KEY (
			sdCode
		)
		REFERENCES sido (
			sdCode
		);

ALTER TABLE contentsDetail
	ADD
		CONSTRAINT FK_contents_TO_contentsDetail
		FOREIGN KEY (
			contentsId
		)
		REFERENCES contents (
			contentsId
		);

ALTER TABLE contentsImage
	ADD
		CONSTRAINT FK_contents_TO_contentsImage
		FOREIGN KEY (
			contentsId
		)
		REFERENCES contents (
			contentsId
		);

drop sequence review_seq;

create sequence review_seq
	start with 1
	increment by 1;