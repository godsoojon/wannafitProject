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



CREATE TABLE customer (
	cs_id VARCHAR2(10) NOT NULL,
	cs_password VARCHAR2(20) NOT NULL, 
	cs_name VARCHAR2(30) NOT NULL,
	cs_email VARCHAR2(50) NOT NULL, 
	cs_phone VARCHAR2(20) NOT NULL 
);



ALTER TABLE customer
	ADD
		CONSTRAINT PK_customer
		PRIMARY KEY (
			cs_id
		);

CREATE TABLE health (
	cs_id VARCHAR2(10) NOT NULL, 
	h_weight NUMBER, 
	h_tall NUMBER, 
	h_bloodtype VARCHAR2(10),
	h_bloodsugar NUMBER, 
	h_bmi NUMBER, 
	h_bloodpressure NUMBER, 
	h_ldl NUMBER, 
	h_hdh NUMBER 
);


ALTER TABLE health
	ADD
		CONSTRAINT PK_health
		PRIMARY KEY (
			cs_id
		);


CREATE TABLE friendlist (
	fl_key VARCHAR2(20) NOT NULL, 
	cs_id VARCHAR2(10) NOT NULL,
	firend_name VARCHAR2(10) 
);


ALTER TABLE friendlist
	ADD
		CONSTRAINT PK_friendlist
		PRIMARY KEY (
			fl_key
		);

CREATE TABLE calorie (
	calorie_food VARCHAR2(50) NOT NULL, 
	calorie_calorie NUMBER 
);


ALTER TABLE calorie
	ADD
		CONSTRAINT PK_calorie
		PRIMARY KEY (
			calorie_food
		);

CREATE TABLE photo (
	photo_id VARCHAR2(20) NOT NULL, 
	party_id NUMBER NOT NULL, 
	photo_name VARCHAR2(20), 
	photo_path VARCHAR2(30) NOT NULL, 
	photo_time DATE, 
	photo_comment VARCHAR2(100) 
);


ALTER TABLE photo
	ADD
		CONSTRAINT PK_photo
		PRIMARY KEY (
			photo_id,
			party_id
		);


CREATE TABLE reple (
	reple_id VARCHAR2(20) NOT NULL, 
	cs_id VARCHAR2(10) NOT NULL, 
	photo_id VARCHAR2(20), 
	party_id NUMBER, /* 그룹id */
	replet_content VARCHAR2(50), 
	reple_time DATE /* 시간 */
);



ALTER TABLE reple
	ADD
		CONSTRAINT PK_reple
		PRIMARY KEY (
			reple_id
		);

/* 그룹 */
CREATE TABLE party (
	party_id NUMBER NOT NULL, /* 그룹id */
	party_right NUMBER NOT NULL, /* 그룹권한 */
	party_name VARCHAR2(30) NOT NULL, /* 그룹이름 */
	party_date DATE NOT NULL, /* 생성날짜 */
	party_member NUMBER /* 가입회원수 */
);

ALTER TABLE party
	ADD
		CONSTRAINT PK_party
		PRIMARY KEY (
			party_id
		);

/* 그룹고객목록 */
CREATE TABLE partylist (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	party_id NUMBER NOT NULL /* 그룹id */
);


ALTER TABLE partylist
	ADD
		CONSTRAINT PK_partylist
		PRIMARY KEY (
			cs_id,
			party_id
		);

/* 전체 고객 */
CREATE TABLE totalcustomer (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	cs_name VARCHAR2(30) /* 고객이름 */
);

ALTER TABLE totalcustomer
	ADD
		CONSTRAINT PK_totalcustomer
		PRIMARY KEY (
			cs_id
		);

/* 전체그룹 */
CREATE TABLE totalparty (
	party_id NUMBER NOT NULL, /* 그룹id */
	party_name VARCHAR2(30) /* 그룹이름 */
);


ALTER TABLE totalparty
	ADD
		CONSTRAINT PK_totalparty
		PRIMARY KEY (
			party_id
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
			party_id
		)
		REFERENCES party (
			party_id
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
			party_id
		)
		REFERENCES photo (
			photo_id,
			party_id
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
			party_id
		)
		REFERENCES party (
			party_id
		);