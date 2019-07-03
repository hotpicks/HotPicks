ALTER TABLE review
	DROP
		CONSTRAINT FK_member_TO_review
		CASCADE;

ALTER TABLE review
	DROP
		CONSTRAINT FK_hashTag_TO_review
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
		CONSTRAINT FK_sido_TO_contents
		CASCADE;

ALTER TABLE contents
	DROP
		CONSTRAINT FK_sigungu_TO_contents
		CASCADE;

ALTER TABLE contents
	DROP
		CONSTRAINT FK_boardType_TO_contents
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

ALTER TABLE contents_detail
	DROP
		CONSTRAINT FK_contents_TO_contents_detail
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

ALTER TABLE boardType
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE pickList
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

ALTER TABLE contents_detail
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
DROP TABLE boardType 
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
DROP TABLE contents_detail 
	CASCADE CONSTRAINTS;
	
	/* sequence1 */
DROP SEQUENCE seq;

/* sequence1 */
CREATE SEQUENCE seq
	start with 100;

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
	tagCount NUMBER /* 사용횟수 */
);

COMMENT ON TABLE hashTag IS '해시테그';

COMMENT ON COLUMN hashTag.hashTag IS '태그이름';

COMMENT ON COLUMN hashTag.tagCount IS '사용횟수';

ALTER TABLE hashTag
	ADD
		CONSTRAINT PK_hashTag
		PRIMARY KEY (
			hashTag
		);

/* 리뷰 */
CREATE TABLE review (
	seq NUMBER NOT NULL, /* 글번호 */
	userId VARCHAR2(100), /* 회원아이디 */
	contentsId NUMBER(12), /* 컨텐츠아이디 */
	hashTag VARCHAR2(100), /* 태그이름 */
	subject VARCHAR2(100), /* 제목 */
	starPoint NUMBER, /* 별점 */
	content CLOB, /* 내용 */
	logTime DATE, /* 작성시간 */
	folder VARCHAR2(8), /* 저장폴더 */
	mainImg VARCHAR2(100), /* 원본사진이름 */
	saveImg VARCHAR2(100) /* 저장사진이름 */
);

COMMENT ON TABLE review IS '리뷰';

COMMENT ON COLUMN review.seq IS '글번호';

COMMENT ON COLUMN review.userId IS '회원아이디';

COMMENT ON COLUMN review.contentsId IS '컨텐츠아이디';

COMMENT ON COLUMN review.hashTag IS '태그이름';

COMMENT ON COLUMN review.subject IS '제목';

COMMENT ON COLUMN review.starPoint IS '별점';

COMMENT ON COLUMN review.content IS '내용';

COMMENT ON COLUMN review.logTime IS '작성시간';

COMMENT ON COLUMN review.folder IS '저장폴더';

COMMENT ON COLUMN review.mainImg IS '원본사진이름';

COMMENT ON COLUMN review.saveImg IS '저장사진이름';

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			seq
		);

/* 카테고리 */
CREATE TABLE boardType (
	catId NUMBER NOT NULL, /* 카테고리id */
	catName VARCHAR2(600) /* 카테고리name */
);

COMMENT ON TABLE boardType IS '카테고리';

COMMENT ON COLUMN boardType.catId IS '카테고리id';

COMMENT ON COLUMN boardType.catName IS '카테고리name';

ALTER TABLE boardType
	ADD
		CONSTRAINT PK_boardType
		PRIMARY KEY (
			catId
		);

/* 댓글 */
CREATE TABLE comments (
	seq NUMBER NOT NULL, /* 글번호 */
	logId VARCHAR2(40), /* 작성자아이디 */
	logTime DATE, /* 작성시간 */
	content VARCHAR2(200) /* 글내용 */
);

COMMENT ON TABLE comments IS '댓글';

COMMENT ON COLUMN comments.seq IS '글번호';

COMMENT ON COLUMN comments.logId IS '작성자아이디';

COMMENT ON COLUMN comments.logTime IS '작성시간';

COMMENT ON COLUMN comments.content IS '글내용';

/* pickList */
CREATE TABLE pickList (
	seq NUMBER NOT NULL, /* 글번호 */
	userId VARCHAR2(100), /* 회원아이디 */
	contentsId NUMBER(12) /* 아이디 */
);

COMMENT ON TABLE pickList IS 'pickList';

COMMENT ON COLUMN pickList.seq IS '글번호';

COMMENT ON COLUMN pickList.userId IS '회원아이디';

COMMENT ON COLUMN pickList.contentsId IS '아이디';

ALTER TABLE pickList
	ADD
		CONSTRAINT PK_pickList
		PRIMARY KEY (
			seq
		);

/* 컨텐츠 */
CREATE TABLE contents (
	contentsId NUMBER(12) NOT NULL, /* 아이디 */
	title VARCHAR(600), /* 제목 */
	catId NUMBER, /* 카테고리id */
	sggCode VARCHAR2(100), /* 시군구코드 */
	sdCode VARCHAR2(100), /* 시도코드 */
	hit NUMBER, /* 조회수 */
	image1 CLOB, /* 이미지1 */
	image2 CLOB /* 이미지2 */
);

COMMENT ON TABLE contents IS '컨텐츠';

COMMENT ON COLUMN contents.contentsId IS '아이디';

COMMENT ON COLUMN contents.title IS '제목';

COMMENT ON COLUMN contents.catId IS '카테고리id';

COMMENT ON COLUMN contents.sggCode IS '시군구코드';

COMMENT ON COLUMN contents.sdCode IS '시도코드';

COMMENT ON COLUMN contents.hit IS '조회수';

COMMENT ON COLUMN contents.image1 IS '이미지1';

COMMENT ON COLUMN contents.image2 IS '이미지2';

ALTER TABLE contents
	ADD
		CONSTRAINT PK_contents
		PRIMARY KEY (
			contentsId
		);

/* 신고내역 */
CREATE TABLE blackreview (
	seq NUMBER NOT NULL, /* 글번호 */
	userId VARCHAR2(100), /* 회원아이디 */
	reportContent VARCHAR2(200), /* 신고내용 */
	reportDate DATE /* 신고일자 */
);

COMMENT ON TABLE blackreview IS '신고내역';

COMMENT ON COLUMN blackreview.seq IS '글번호';

COMMENT ON COLUMN blackreview.userId IS '회원아이디';

COMMENT ON COLUMN blackreview.reportContent IS '신고내용';

COMMENT ON COLUMN blackreview.reportDate IS '신고일자';

/* 시/도코드 */
CREATE TABLE sido (
	sdCode VARCHAR2(100) NOT NULL, /* 시도코드 */
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
	sggCode VARCHAR2(100) NOT NULL, /* 시군구코드 */
	sggName VARCHAR2(100), /* 시군구이름 */
	sdCode VARCHAR2(100) /* 시도코드 */
);

COMMENT ON TABLE sigungu IS '시군구코드';

COMMENT ON COLUMN sigungu.sggCode IS '시군구코드';

COMMENT ON COLUMN sigungu.sggName IS '시군구이름';

COMMENT ON COLUMN sigungu.sdCode IS '시도코드';

ALTER TABLE sigungu
	ADD
		CONSTRAINT PK_sigungu
		PRIMARY KEY (
			sggCode
		);

/* contents_detail */
CREATE TABLE contents_detail (
	contentsId NUMBER(12) NOT NULL, /* 아이디 */
	homePage VARCHAR(4000), /* 홈페이지 */
	telName VARCHAR(1000), /* 주최자 명 */
	tel VARCHAR(300), /* 주최자 전화번호 */
	zipCode NUMBER(12), /* 우편번호 */
	addr1 VARCHAR(400), /* 주소 */
	addr2 VARCHAR(400), /* 상세주소 */
	eventStartDate NUMBER(8), /* 행사시작일 */
	eventEndDate NUMBER(8), /* 행사종료일 */
	playTime CLOB, /* 공연시간 */
	program CLOB, /* 행사프로그램 */
	useTime CLOB, /* 이용요금 */
	spendTime CLOB, /* 관람소요시간 */
	ageLimit VARCHAR(2000), /* 관람가능연령 */
	bookingPlace CLOB, /* 예매처 */
	discountInfo CLOB, /* 할인정보 */
	placeInfo CLOB, /* 행사장위치안내 */
	infoName CLOB, /* 행사소개 */
	infoText CLOB, /* 행사내용 */
	xPoint NUMBER, /* x좌표 */
	yPoint NUMBER /* y좌표 */
);

COMMENT ON TABLE contents_detail IS 'contents_detail';

COMMENT ON COLUMN contents_detail.contentsId IS '아이디';

COMMENT ON COLUMN contents_detail.homePage IS '홈페이지';

COMMENT ON COLUMN contents_detail.telName IS '주최자 명';

COMMENT ON COLUMN contents_detail.tel IS '주최자 전화번호';

COMMENT ON COLUMN contents_detail.zipCode IS '우편번호';

COMMENT ON COLUMN contents_detail.addr1 IS '주소';

COMMENT ON COLUMN contents_detail.addr2 IS '상세주소';

COMMENT ON COLUMN contents_detail.eventStartDate IS '행사시작일';

COMMENT ON COLUMN contents_detail.eventEndDate IS '행사종료일';

COMMENT ON COLUMN contents_detail.playTime IS '공연시간';

COMMENT ON COLUMN contents_detail.program IS '행사프로그램';

COMMENT ON COLUMN contents_detail.useTime IS '이용요금';

COMMENT ON COLUMN contents_detail.spendTime IS '관람소요시간';

COMMENT ON COLUMN contents_detail.ageLimit IS '관람가능연령';

COMMENT ON COLUMN contents_detail.bookingPlace IS '예매처';

COMMENT ON COLUMN contents_detail.discountInfo IS '할인정보';

COMMENT ON COLUMN contents_detail.placeInfo IS '행사장위치안내';

COMMENT ON COLUMN contents_detail.infoName IS '행사소개';

COMMENT ON COLUMN contents_detail.infoText IS '행사내용';

COMMENT ON COLUMN contents_detail.xPoint IS 'x좌표';

COMMENT ON COLUMN contents_detail.yPoint IS 'y좌표';

ALTER TABLE contents_detail
	ADD
		CONSTRAINT PK_contents_detail
		PRIMARY KEY (
			contentsId
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
		CONSTRAINT FK_hashTag_TO_review
		FOREIGN KEY (
			hashTag
		)
		REFERENCES hashTag (
			hashTag
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
			seq
		)
		REFERENCES review (
			seq
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
		CONSTRAINT FK_sido_TO_contents
		FOREIGN KEY (
			sdCode
		)
		REFERENCES sido (
			sdCode
		);

ALTER TABLE contents
	ADD
		CONSTRAINT FK_sigungu_TO_contents
		FOREIGN KEY (
			sggCode
		)
		REFERENCES sigungu (
			sggCode
		);

ALTER TABLE contents
	ADD
		CONSTRAINT FK_boardType_TO_contents
		FOREIGN KEY (
			catId
		)
		REFERENCES boardType (
			catId
		);

ALTER TABLE blackreview
	ADD
		CONSTRAINT FK_review_TO_blackreview
		FOREIGN KEY (
			seq
		)
		REFERENCES review (
			seq
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

ALTER TABLE contents_detail
	ADD
		CONSTRAINT FK_contents_TO_contents_detail
		FOREIGN KEY (
			contentsId
		)
		REFERENCES contents (
			contentsId
		);