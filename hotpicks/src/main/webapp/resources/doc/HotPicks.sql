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

ALTER TABLE TABLE3
	DROP
		CONSTRAINT FK_review_TO_TABLE3
		CASCADE;

ALTER TABLE TABLE5
	DROP
		CONSTRAINT FK_review_TO_TABLE5
		CASCADE;

ALTER TABLE comment
	DROP
		CONSTRAINT FK_review_TO_comment
		CASCADE;

ALTER TABLE pickList
	DROP
		CONSTRAINT FK_member_TO_pickList
		CASCADE;

ALTER TABLE pickList
	DROP
		CONSTRAINT FK_contents_TO_pickList
		CASCADE;

ALTER TABLE TABLE8
	DROP
		CONSTRAINT FK_member_TO_TABLE8
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

ALTER TABLE blacklist
	DROP
		CONSTRAINT FK_member_TO_blacklist
		CASCADE;

ALTER TABLE blackreview
	DROP
		CONSTRAINT FK_review_TO_blackreview
		CASCADE;

ALTER TABLE blackreview
	DROP
		CONSTRAINT FK_member_TO_blackreview
		CASCADE;

ALTER TABLE TABLE7
	DROP
		CONSTRAINT FK_review_TO_TABLE7
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

ALTER TABLE contents
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE review2
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE review3
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE review4
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE blacklist
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE TABLE7
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

DROP INDEX PK_member;

DROP INDEX PK_hashTag;

DROP INDEX PK_review;

DROP INDEX PK_boardType;

DROP INDEX PK_contents;

DROP INDEX PK_review2;

DROP INDEX PK_review3;

DROP INDEX PK_review4;

DROP INDEX PK_blacklist;

DROP INDEX PK_TABLE7;

DROP INDEX PK_sido;

DROP INDEX PK_sigungu;

DROP INDEX PK_contents_detail;

/* 공연 */
DROP TABLE TABLE 
	CASCADE CONSTRAINTS;

/* 맛집 */
DROP TABLE TABLE2 
	CASCADE CONSTRAINTS;

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

/* 답변형게시판 */
DROP TABLE TABLE3 
	CASCADE CONSTRAINTS;

/* 새 테이블2 */
DROP TABLE TABLE4 
	CASCADE CONSTRAINTS;

/* 앨범형게시판 */
DROP TABLE TABLE5 
	CASCADE CONSTRAINTS;

/* 임시 테이블 */
DROP TABLE Temporary 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE comment 
	CASCADE CONSTRAINTS;

/* pickList */
DROP TABLE pickList 
	CASCADE CONSTRAINTS;

/* 가고싶은곳 */
DROP TABLE TABLE8 
	CASCADE CONSTRAINTS;

/* 갔다온곳 */
DROP TABLE TABLE9 
	CASCADE CONSTRAINTS;

/* 컨텐츠 */
DROP TABLE contents 
	CASCADE CONSTRAINTS;

/* 공연/전시 */
DROP TABLE review2 
	CASCADE CONSTRAINTS;

/* 리뷰3 */
DROP TABLE review3 
	CASCADE CONSTRAINTS;

/* 맛집 */
DROP TABLE review4 
	CASCADE CONSTRAINTS;

/* 신고회원 */
DROP TABLE blacklist 
	CASCADE CONSTRAINTS;

/* 신고내역 */
DROP TABLE blackreview 
	CASCADE CONSTRAINTS;

/* 카테고리 */
DROP TABLE TABLE6 
	CASCADE CONSTRAINTS;

/* 리뷰상세 */
DROP TABLE TABLE7 
	CASCADE CONSTRAINTS;

/* 컨텐츠상세 */
DROP TABLE TABLE10 
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

/* 공연 */
CREATE TABLE TABLE (
);

COMMENT ON TABLE TABLE IS '공연';

/* 맛집 */
CREATE TABLE TABLE2 (
);

COMMENT ON TABLE TABLE2 IS '맛집';

/* 회원 */
CREATE TABLE member (
	userId VARCHAR2(100) NOT NULL, /* 회원아이디 */
	pass VARCHAR2(16) NOT NULL, /* 비밀번호 */
	name VARCHAR2(40) NOT NULL, /* 이름 */
	age NUMBER, /* 나이 */
	gender VARCHAR2(3), /* 성별 */
	joinDate DATE DEFAULT sysdate, /* 가입일 */
	profile CLOB, /* 프로필사진 */
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

CREATE UNIQUE INDEX PK_member
	ON member (
		userId ASC
	);

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

CREATE UNIQUE INDEX PK_hashTag
	ON hashTag (
		hashTag ASC
	);

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
	contentsId VARCHAR2(50), /* 컨텐츠아이디 */
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

CREATE UNIQUE INDEX PK_review
	ON review (
		seq ASC
	);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			seq
		);

/* 카테고리 */
CREATE TABLE boardType (
	cat_id NUMBER NOT NULL, /* 카테고리id */
	cat_name VARCHAR2(600) /* 카테고리name */
);

COMMENT ON TABLE boardType IS '카테고리';

COMMENT ON COLUMN boardType.cat_id IS '카테고리id';

COMMENT ON COLUMN boardType.cat_name IS '카테고리name';

CREATE UNIQUE INDEX PK_boardType
	ON boardType (
		cat_id ASC
	);

ALTER TABLE boardType
	ADD
		CONSTRAINT PK_boardType
		PRIMARY KEY (
			cat_id
		);

/* 답변형게시판 */
CREATE TABLE TABLE3 (
	seq NUMBER NOT NULL, /* 글번호 */
	COL4 NUMBER, /* 들여쓰기 */
	COL5 NUMBER, /* 답글정렬 */
	COL3 NUMBER, /* 원글번호 */
	COL6 NUMBER /* 답글갯수 */
);

COMMENT ON TABLE TABLE3 IS '답변형게시판';

COMMENT ON COLUMN TABLE3.seq IS '글번호';

COMMENT ON COLUMN TABLE3.COL4 IS '들여쓰기';

COMMENT ON COLUMN TABLE3.COL5 IS '답글정렬';

COMMENT ON COLUMN TABLE3.COL3 IS '원글번호';

COMMENT ON COLUMN TABLE3.COL6 IS '답글갯수';

/* 새 테이블2 */
CREATE TABLE TABLE4 (
);

COMMENT ON TABLE TABLE4 IS '새 테이블2';

/* 앨범형게시판 */
CREATE TABLE TABLE5 (
	seq NUMBER, /* 글번호 */
	COL3 VARCHAR2(8), /* 저장폴더 */
	COL4 VARCHAR2(100), /* 원본사진이름 */
	COL5 VARCHAR2(100), /* 저장사진이름 */
	COL6 NUMBER(3) /* 사진타입 */
);

COMMENT ON TABLE TABLE5 IS '앨범형게시판';

COMMENT ON COLUMN TABLE5.seq IS '글번호';

COMMENT ON COLUMN TABLE5.COL3 IS '저장폴더';

COMMENT ON COLUMN TABLE5.COL4 IS '원본사진이름';

COMMENT ON COLUMN TABLE5.COL5 IS '저장사진이름';

COMMENT ON COLUMN TABLE5.COL6 IS '사진타입';

/* 임시 테이블 */
CREATE TABLE Temporary (
	COL5 <지정 되지 않음> /* 새 컬럼 */
);

COMMENT ON TABLE Temporary IS '임시 테이블';

COMMENT ON COLUMN Temporary.COL5 IS '새 컬럼';

/* 댓글 */
CREATE TABLE comment (
	seq NUMBER NOT NULL, /* 글번호 */
	logId VARCHAR2(40), /* 작성자아이디 */
	logTime DATE, /* 작성시간 */
	content VARCHAR2(200) /* 글내용 */
);

COMMENT ON TABLE comment IS '댓글';

COMMENT ON COLUMN comment.seq IS '글번호';

COMMENT ON COLUMN comment.logId IS '작성자아이디';

COMMENT ON COLUMN comment.logTime IS '작성시간';

COMMENT ON COLUMN comment.content IS '글내용';

/* pickList */
CREATE TABLE pickList (
	userId VARCHAR2(100), /* 회원아이디 */
	contentsId VARCHAR2(50) /* 아이디 */
);

COMMENT ON TABLE pickList IS 'pickList';

COMMENT ON COLUMN pickList.userId IS '회원아이디';

COMMENT ON COLUMN pickList.contentsId IS '아이디';

/* 가고싶은곳 */
CREATE TABLE TABLE8 (
	userId VARCHAR2(100) /* 회원아이디 */
);

COMMENT ON TABLE TABLE8 IS '가고싶은곳';

COMMENT ON COLUMN TABLE8.userId IS '회원아이디';

/* 갔다온곳 */
CREATE TABLE TABLE9 (
	COL <지정 되지 않음>, /* 새 컬럼 */
	COL2 <지정 되지 않음> /* 새 컬럼2 */
);

COMMENT ON TABLE TABLE9 IS '갔다온곳';

COMMENT ON COLUMN TABLE9.COL IS '새 컬럼';

COMMENT ON COLUMN TABLE9.COL2 IS '새 컬럼2';

/* 컨텐츠 */
CREATE TABLE contents (
	contentsId VARCHAR2(50) NOT NULL, /* 아이디 */
	title VARCHAR(600), /* 제목 */
	cat_id NUMBER, /* 카테고리id */
	sggCode VARCHAR2(100), /* 시군구코드 */
	sdCode VARCHAR2(100), /* 시도코드 */
	mainImg CLOB, /* 이미지 */
	viewCount NUMBER /* 조회수 */
);

COMMENT ON TABLE contents IS '컨텐츠';

COMMENT ON COLUMN contents.contentsId IS '아이디';

COMMENT ON COLUMN contents.title IS '제목';

COMMENT ON COLUMN contents.cat_id IS '카테고리id';

COMMENT ON COLUMN contents.sggCode IS '시군구코드';

COMMENT ON COLUMN contents.sdCode IS '시도코드';

COMMENT ON COLUMN contents.mainImg IS '이미지';

COMMENT ON COLUMN contents.viewCount IS '조회수';

CREATE UNIQUE INDEX PK_contents
	ON contents (
		contentsId ASC
	);

ALTER TABLE contents
	ADD
		CONSTRAINT PK_contents
		PRIMARY KEY (
			contentsId
		);

/* 공연/전시 */
CREATE TABLE review2 (
	seq NUMBER NOT NULL, /* 글번호 */
	subject VARCHAR2(100), /* 제목 */
	content CLOB, /* 내용 */
	logTime DATE, /* 작성시간 */
	COL4 VARCHAR2(200), /* 주소 */
	boardType NUMBER /* 분류번호 */
);

COMMENT ON TABLE review2 IS '공연/전시';

COMMENT ON COLUMN review2.seq IS '글번호';

COMMENT ON COLUMN review2.subject IS '제목';

COMMENT ON COLUMN review2.content IS '내용';

COMMENT ON COLUMN review2.logTime IS '작성시간';

COMMENT ON COLUMN review2.COL4 IS '주소';

COMMENT ON COLUMN review2.boardType IS '분류번호';

CREATE UNIQUE INDEX PK_review2
	ON review2 (
		seq ASC
	);

ALTER TABLE review2
	ADD
		CONSTRAINT PK_review2
		PRIMARY KEY (
			seq
		);

/* 리뷰3 */
CREATE TABLE review3 (
	seq NUMBER NOT NULL, /* 글번호 */
	userId VARCHAR2(40), /* 아이디 */
	subject VARCHAR2(100), /* 제목 */
	content CLOB, /* 내용 */
	logTime DATE, /* 작성시간 */
	COL NUMBER, /* 별점 */
	COL4 VARCHAR2(200), /* 주소 */
	boardType NUMBER, /* 분류번호 */
	COL2 VARCHAR2(8), /* 저장폴더 */
	COL5 VARCHAR2(100), /* 원본사진이름 */
	COL6 VARCHAR2(100), /* 저장사진이름 */
	hashTag VARCHAR2(100), /* 태그이름 */
	contentNum NUMBER, /* 일련번호 */
	api CLOB /* API */
);

COMMENT ON TABLE review3 IS '리뷰3';

COMMENT ON COLUMN review3.seq IS '글번호';

COMMENT ON COLUMN review3.userId IS '아이디';

COMMENT ON COLUMN review3.subject IS '제목';

COMMENT ON COLUMN review3.content IS '내용';

COMMENT ON COLUMN review3.logTime IS '작성시간';

COMMENT ON COLUMN review3.COL IS '별점';

COMMENT ON COLUMN review3.COL4 IS '주소';

COMMENT ON COLUMN review3.boardType IS '분류번호';

COMMENT ON COLUMN review3.COL2 IS '저장폴더';

COMMENT ON COLUMN review3.COL5 IS '원본사진이름';

COMMENT ON COLUMN review3.COL6 IS '저장사진이름';

COMMENT ON COLUMN review3.hashTag IS '태그이름';

COMMENT ON COLUMN review3.contentNum IS '일련번호';

COMMENT ON COLUMN review3.api IS 'API';

CREATE UNIQUE INDEX PK_review3
	ON review3 (
		seq ASC
	);

ALTER TABLE review3
	ADD
		CONSTRAINT PK_review3
		PRIMARY KEY (
			seq
		);

/* 맛집 */
CREATE TABLE review4 (
	seq NUMBER NOT NULL, /* 글번호 */
	subject VARCHAR2(100), /* 제목 */
	content CLOB, /* 내용 */
	logTime DATE, /* 작성시간 */
	COL4 VARCHAR2(200), /* 주소 */
	boardType NUMBER /* 분류번호 */
);

COMMENT ON TABLE review4 IS '맛집';

COMMENT ON COLUMN review4.seq IS '글번호';

COMMENT ON COLUMN review4.subject IS '제목';

COMMENT ON COLUMN review4.content IS '내용';

COMMENT ON COLUMN review4.logTime IS '작성시간';

COMMENT ON COLUMN review4.COL4 IS '주소';

COMMENT ON COLUMN review4.boardType IS '분류번호';

CREATE UNIQUE INDEX PK_review4
	ON review4 (
		seq ASC
	);

ALTER TABLE review4
	ADD
		CONSTRAINT PK_review4
		PRIMARY KEY (
			seq
		);

/* 신고회원 */
CREATE TABLE blacklist (
	userId VARCHAR2(100) NOT NULL, /* 회원아이디 */
	statement NUMBER(3) NOT NULL /* 상태 */
);

COMMENT ON TABLE blacklist IS '신고회원';

COMMENT ON COLUMN blacklist.userId IS '회원아이디';

COMMENT ON COLUMN blacklist.statement IS '상태';

CREATE UNIQUE INDEX PK_blacklist
	ON blacklist (
		userId ASC
	);

ALTER TABLE blacklist
	ADD
		CONSTRAINT PK_blacklist
		PRIMARY KEY (
			userId
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

/* 카테고리 */
CREATE TABLE TABLE6 (
);

COMMENT ON TABLE TABLE6 IS '카테고리';

/* 리뷰상세 */
CREATE TABLE TABLE7 (
	seq NUMBER NOT NULL, /* 글번호 */
	content CLOB, /* 내용 */
	address VARCHAR2(200) /* 주소 */
);

COMMENT ON TABLE TABLE7 IS '리뷰상세';

COMMENT ON COLUMN TABLE7.seq IS '글번호';

COMMENT ON COLUMN TABLE7.content IS '내용';

COMMENT ON COLUMN TABLE7.address IS '주소';

CREATE UNIQUE INDEX PK_TABLE7
	ON TABLE7 (
		seq ASC
	);

ALTER TABLE TABLE7
	ADD
		CONSTRAINT PK_TABLE7
		PRIMARY KEY (
			seq
		);

/* 컨텐츠상세 */
CREATE TABLE TABLE10 (
	content CLOB, /* 내용 */
	COL6 VARCHAR2(40), /* X좌표 */
	COL7 VARCHAR2(40) /* Y좌표 */
);

COMMENT ON TABLE TABLE10 IS '컨텐츠상세';

COMMENT ON COLUMN TABLE10.content IS '내용';

COMMENT ON COLUMN TABLE10.COL6 IS 'X좌표';

COMMENT ON COLUMN TABLE10.COL7 IS 'Y좌표';

/* 시/도코드 */
CREATE TABLE sido (
	sdCode VARCHAR2(100) NOT NULL, /* 시도코드 */
	sdName VARCHAR2(100) /* 시도이름 */
);

COMMENT ON TABLE sido IS '시/도코드';

COMMENT ON COLUMN sido.sdCode IS '시도코드';

COMMENT ON COLUMN sido.sdName IS '시도이름';

CREATE UNIQUE INDEX PK_sido
	ON sido (
		sdCode ASC
	);

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

CREATE UNIQUE INDEX PK_sigungu
	ON sigungu (
		sggCode ASC
	);

ALTER TABLE sigungu
	ADD
		CONSTRAINT PK_sigungu
		PRIMARY KEY (
			sggCode
		);

/* contents_detail */
CREATE TABLE contents_detail (
	contentsid VARCHAR2(50) NOT NULL, /* 아이디 */
	homepage VARCHAR(4000), /* 홈페이지 */
	telname VARCHAR(1000), /* 주최자 명 */
	tel VARCHAR(300), /* 주최자 전화번호 */
	zipcode VARCHAR2(20), /* 우편번호 */
	addr1 VARCHAR(400), /* 주소 */
	addr2 VARCHAR(400), /* 상세주소 */
	eventstartdate DATE, /* 행사시작일 */
	eventenddate DATE, /* 행사종료일 */
	playtime LONG TEXT, /* 공연시간 */
	program LONG TEXT, /* 행사프로그램 */
	usetime LONG TEXT, /* 이용요금 */
	spendtime LONG TEXT, /* 관람소요시간 */
	agelimit VARCHAR(2000), /* 관람가능연령 */
	bookingplace LONG TEXT, /* 예매처 */
	discountinfo LONG TEXT, /* 할인정보 */
	placeinfo LONG TEXT, /* 행사장위치안내 */
	infoname LONG TEXT, /* 행사소개 */
	infotext LONG TEXT /* 행사내용 */
);

COMMENT ON TABLE contents_detail IS 'contents_detail';

COMMENT ON COLUMN contents_detail.contentsid IS '아이디';

COMMENT ON COLUMN contents_detail.homepage IS '홈페이지';

COMMENT ON COLUMN contents_detail.telname IS '주최자 명';

COMMENT ON COLUMN contents_detail.tel IS '주최자 전화번호';

COMMENT ON COLUMN contents_detail.zipcode IS '우편번호';

COMMENT ON COLUMN contents_detail.addr1 IS '주소';

COMMENT ON COLUMN contents_detail.addr2 IS '상세주소';

COMMENT ON COLUMN contents_detail.eventstartdate IS '행사시작일';

COMMENT ON COLUMN contents_detail.eventenddate IS '행사종료일';

COMMENT ON COLUMN contents_detail.playtime IS '공연시간';

COMMENT ON COLUMN contents_detail.program IS '행사프로그램';

COMMENT ON COLUMN contents_detail.usetime IS '이용요금';

COMMENT ON COLUMN contents_detail.spendtime IS '관람소요시간';

COMMENT ON COLUMN contents_detail.agelimit IS '관람가능연령';

COMMENT ON COLUMN contents_detail.bookingplace IS '예매처';

COMMENT ON COLUMN contents_detail.discountinfo IS '할인정보';

COMMENT ON COLUMN contents_detail.placeinfo IS '행사장위치안내';

COMMENT ON COLUMN contents_detail.infoname IS '행사소개';

COMMENT ON COLUMN contents_detail.infotext IS '행사내용';

CREATE UNIQUE INDEX PK_contents_detail
	ON contents_detail (
		contentsid ASC
	);

ALTER TABLE contents_detail
	ADD
		CONSTRAINT PK_contents_detail
		PRIMARY KEY (
			contentsid
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

ALTER TABLE TABLE3
	ADD
		CONSTRAINT FK_review_TO_TABLE3
		FOREIGN KEY (
			seq
		)
		REFERENCES review (
			seq
		);

ALTER TABLE TABLE5
	ADD
		CONSTRAINT FK_review_TO_TABLE5
		FOREIGN KEY (
			seq
		)
		REFERENCES review (
			seq
		);

ALTER TABLE comment
	ADD
		CONSTRAINT FK_review_TO_comment
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

ALTER TABLE TABLE8
	ADD
		CONSTRAINT FK_member_TO_TABLE8
		FOREIGN KEY (
			userId
		)
		REFERENCES member (
			userId
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
			cat_id
		)
		REFERENCES boardType (
			cat_id
		);

ALTER TABLE blacklist
	ADD
		CONSTRAINT FK_member_TO_blacklist
		FOREIGN KEY (
			userId
		)
		REFERENCES member (
			userId
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

ALTER TABLE TABLE7
	ADD
		CONSTRAINT FK_review_TO_TABLE7
		FOREIGN KEY (
			seq
		)
		REFERENCES review (
			seq
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
			contentsid
		)
		REFERENCES contents (
			contentsId
		);