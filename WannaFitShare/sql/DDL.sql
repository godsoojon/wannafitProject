create sequence friendlist_fl_key_seq;
create sequence reple_id;
create sequence photo_id;

drop sequence reple_id;
drop sequence photo_id;
drop sequence friendlist_fl_key_seq;

delete from CUSTOMER;
delete from FRIENDLIST;
delete from PHOTO;
delete from PARTY;
delete from REPLE;

/* 고객 */
DROP TABLE customer 
   CASCADE CONSTRAINTS;

/* 건강 */
DROP TABLE health 	
   CASCADE CONSTRAINTS;

/* 친구목록 */
DROP TABLE friendlist 
   CASCADE CONSTRAINTS;

/* 칼로리 */
DROP TABLE calorie 
   CASCADE CONSTRAINTS;

/* 사진 */
DROP TABLE photo 
   CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE reple 
   CASCADE CONSTRAINTS;

/* 그룹 */
DROP TABLE party 
   CASCADE CONSTRAINTS;

/* 칼로리캘린더 */
DROP TABLE caloriecalendar 
   CASCADE CONSTRAINTS;

/* 고객 */
CREATE TABLE customer (
   cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
   cs_password VARCHAR2(20) NOT NULL, /* 패스워드 */
   cs_name VARCHAR2(30) NOT NULL, /* 고객이름 */
   cs_email VARCHAR2(50) NOT NULL, /* 이메일 */
   cs_phone VARCHAR2(20) NOT NULL, /* 폰번호 */
   cs_picture VARCHAR2(500) /*고객 사진 */
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
   h_hdh NUMBER, /* HDH */
constraint health_customer_cs_id_pk foreign key(cs_id) references customer(cs_id) on delete cascade
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
   friend_id VARCHAR2(10), /* 친구ID */
   friend_picture VARCHAR2(500),
constraint friendlist_customer_cs_id_pk foreign key(cs_id) references customer(cs_id) on delete cascade
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
   photo_id NUMBER NOT NULL, /* 사진ID */
   cs_id VARCHAR2(10), /* 고객_id */
   party_name VARCHAR2(30), /* 그룹이름 */
   photo_time DATE, /* 시간 */
   photo_content CLOB, /* 내용 */
   photo_title VARCHAR2(30), /* 사진타이틀 */
constraint photo_customer_cs_id_fk foreign key(cs_id) references customer(cs_id) on delete cascade
);

ALTER TABLE photo
   ADD
      CONSTRAINT PK_photo
      PRIMARY KEY (
         photo_id
      );

/* 댓글 */
CREATE TABLE reple (
   reple_id NUMBER NOT NULL, /* 댓글id */
   cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
   photo_id NUMBER, /* 사진ID */
   reple_content VARCHAR2(50), /* 댓글내용 */
   reple_time DATE, /* 시간 */
   cs_name VARCHAR2(30), /* 고객이름 */
   cs_picture VARCHAR2(500), /*고객 사진 */
   
constraint reple_customer_cs_id_pk foreign key(cs_id) references customer(cs_id) on delete cascade
);

ALTER TABLE reple
   ADD
      CONSTRAINT PK_reple
      PRIMARY KEY (
         reple_id,
         cs_id
      );
      
     
/* 그룹 */
CREATE TABLE party (
   party_name VARCHAR2(30) NOT NULL, /* 그룹이름 */
   cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
   party_right NUMBER NOT NULL, /* 그룹권한 */
   party_date DATE NOT NULL, /* 생성날짜 */
constraint party_customer_cs_id_fk foreign key(cs_id) references customer(cs_id) on delete cascade
);

ALTER TABLE party
   ADD
      CONSTRAINT PK_party
      PRIMARY KEY (
         party_name,
         cs_id
      );
   
/* 칼로리캘린더 */
CREATE TABLE caloriecalendar (
   cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
   calorie_date DATE NOT NULL, /* 날짜 */
   total_calorie NUMBER, /* 총칼로리 */
constraint caloriecalendar_cs_id_pk foreign key(cs_id) references customer(cs_id) on delete cascade
);

ALTER TABLE caloriecalendar
   ADD
      CONSTRAINT PK_caloriecalendar
      PRIMARY KEY (
         cs_id,
         calorie_date
      );



ALTER TABLE photo
   ADD
      CONSTRAINT FK_party_TO_photo
      FOREIGN KEY (
         party_name,
         cs_id
      )
      REFERENCES party (
         party_name,
         cs_id
      );

ALTER TABLE reple

   ADD
      CONSTRAINT FK_photo_TO_reple
      FOREIGN KEY (
         photo_id
      )
      REFERENCES photo (
         photo_id
      );


