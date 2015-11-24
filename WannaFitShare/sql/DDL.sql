drop table calorie;
drop table health;
drop table partylist;
drop table reple;
drop table totalcustomer;
drop table totalparty;
drop table photo;
drop table friendlist;
drop table customer;
drop table party;
drop table caloriecalendar;

drop sequence person_no_seq;
--------------------------------------------------------


/* 고객 */
CREATE TABLE customer (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	cs_password VARCHAR2(20) NOT NULL, /* 패스워드 */
	cs_name VARCHAR2(30) NOT NULL, /* 고객이름 */
	cs_email VARCHAR2(50) NOT NULL, /* 이메일 */
	cs_phone VARCHAR2(20) NOT NULL /* 폰번호 */
);

ALTER TABLE customer
	ADD
		CONSTRAINT PK_customer
		PRIMARY KEY (
			cs_id
		);

/* 건강 */
CREATE TABLE health (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	h_weight NUMBER, /* 몸무게 */
	h_tall NUMBER, /* 키 */
	h_bloodtype VARCHAR2(10), /* 혈액형 */
	h_bloodsugar NUMBER, /* 혈당 */
	h_bmi NUMBER, /* BMI */
	h_bloodpressure NUMBER, /* 혈압 */
	h_ldl NUMBER, /* LDL */
	h_hdh NUMBER /* HDH */
);

ALTER TABLE health
	ADD
		CONSTRAINT PK_health
		PRIMARY KEY (
			cs_id
		);

/* 친구목록 */
CREATE TABLE friendlist (
	fl_key NUMBER NOT NULL, /* 친구목록식별키 */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	friend_id VARCHAR2(10) /* 친구ID */
);

ALTER TABLE friendlist
	ADD
		CONSTRAINT PK_friendlist
		PRIMARY KEY (
			fl_key
		);

/* 칼로리 */
CREATE TABLE calorie (
	calorie_food VARCHAR2(50) NOT NULL, /* 음식이름 */
	calorie_calorie NUMBER /* 칼로리 */
);

ALTER TABLE calorie
	ADD
		CONSTRAINT PK_calorie
		PRIMARY KEY (
			calorie_food
		);

/* 사진 */
CREATE TABLE photo (
	photo_id VARCHAR2(20) NOT NULL, /* 사진ID */
	party_name VARCHAR2(30) NOT NULL, /* 그룹이름 */
	photo_name VARCHAR2(20), /* 사진이름 */
	photo_path VARCHAR2(30) NOT NULL, /* 경로 */
	photo_time DATE, /* 시간 */
	photo_comment VARCHAR2(100) /* 사진설명 */
);

ALTER TABLE photo
	ADD
		CONSTRAINT PK_photo
		PRIMARY KEY (
			photo_id,
			party_name
		);

/* 댓글 */
CREATE TABLE reple (
	reple_id VARCHAR2(20) NOT NULL, /* 댓글id */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	photo_id VARCHAR2(20), /* 사진ID */
	replet_content VARCHAR2(50), /* 댓글내용 */
	reple_time DATE, /* 시간 */
	party_name VARCHAR2(30) /* 그룹이름 */
);

ALTER TABLE reple
	ADD
		CONSTRAINT PK_reple
		PRIMARY KEY (
			reple_id
		);

/* 그룹 */
CREATE TABLE party (
	party_name VARCHAR2(30) NOT NULL, /* 그룹이름 */
	party_right NUMBER NOT NULL, /* 그룹권한 */
	party_date DATE NOT NULL, /* 생성날짜 */
	party_member NUMBER, /* 가입회원수 */
	party_manager VARCHAR2(10) /* 관리자ID */
);

ALTER TABLE party
	ADD
		CONSTRAINT PK_party
		PRIMARY KEY (
			party_name
		);

/* 그룹고객목록 */
CREATE TABLE partylist (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	party_name VARCHAR2(30) NOT NULL /* 그룹이름 */
);

ALTER TABLE partylist
	ADD
		CONSTRAINT PK_partylist
		PRIMARY KEY (
			cs_id,
			party_name
		);

/* 칼로리캘린더 */
CREATE TABLE caloriecalendar (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	calorie_date DATE, /* 날짜 */
	total_calorie NUMBER /* 총칼로리 */
);

ALTER TABLE caloriecalendar
	ADD
		CONSTRAINT PK_caloriecalendar
		PRIMARY KEY (
			cs_id
		);

ALTER TABLE health
	ADD
		CONSTRAINT FK_customer_TO_health
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

ALTER TABLE friendlist
	ADD
		CONSTRAINT FK_customer_TO_friendlist
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

ALTER TABLE photo
	ADD
		CONSTRAINT FK_party_TO_photo
		FOREIGN KEY (
			party_name
		)
		REFERENCES party (
			party_name
		);

ALTER TABLE reple
	ADD
		CONSTRAINT FK_customer_TO_reple
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

ALTER TABLE reple
	ADD
		CONSTRAINT FK_photo_TO_reple
		FOREIGN KEY (
			photo_id,
			party_name
		)
		REFERENCES photo (
			photo_id,
			party_name
		);

ALTER TABLE partylist
	ADD
		CONSTRAINT FK_customer_TO_partylist
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

ALTER TABLE partylist
	ADD
		CONSTRAINT FK_party_TO_partylist
		FOREIGN KEY (
			party_name
		)
		REFERENCES party (
			party_name
		);

ALTER TABLE caloriecalendar
	ADD
		CONSTRAINT FK_customer_TO_caloriecalendar
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

insert into caloriecalendar (
		cs_id,calorie_date,total_calorie
		)
		values('son','12',1);
---------------------------------------------------
----------------------------------------------------	
----------------------------------------------------	
		create sequence friendlist_fl_key_seq;