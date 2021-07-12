CREATE TABLE "MEMBER"(
   MEMBER_ID VARCHAR2(100),
   MEMBER_NAME VARCHAR2(50) DEFAULT NULL,
   MEMBER_EMAIL VARCHAR2(50) DEFAULT NULL,
   MEMBER_PASSWORD VARCHAR2(50) DEFAULT NULL,
   MEMBER_NICKNAME VARCHAR2(50) UNIQUE,
   MEMBER_STAMP NUMBER DEFAULT 0,
   MEMBER_PREFERENCE_FOOD VARCHAR2(100) DEFAULT NULL,
   MEMBER_REGION VARCHAR2(20) DEFAULT NULL,
   MEMBER_REPORT NUMBER DEFAULT 0,
   MEMBER_LAST_REPORT DATE DEFAULT NULL,
   MEMBER_TYPE NUMBER DEFAULT 1,
   CONSTRAINT MEMBER_PK PRIMARY KEY(MEMBER_ID)
);

DROP TABLE "MEMBER";

CREATE TABLE RESTAURANT(
   RESTAURANT_NUM NUMBER,
   RESTAURANT_TEL VARCHAR2(30),
   RESTAURANT_NAME VARCHAR2(100),
   RESTAURANT_ADDRESS_ROAD VARCHAR2(200),
   RESTAURANT_ADDRESS VARCHAR2(200),
   RESTAURANT_FOOD_CATEGORY VARCHAR2(50),
   RESTAURANT_FACILITY VARCHAR2(100),
   RESTAURANT_DISASTER_GRANT VARCHAR2(200),
   RESTAURANT_LOCAL_CURRENCY VARCHAR2(200),
   RESTAURANT_RATION_TOTAL FLOAT DEFAULT 0,
   RESTAURANT_HIT NUMBER DEFAULT 0,
   RESTAURANT_LINK VARCHAR2(500),
   MENU VARCHAR2(500),
   PRICE VARCHAR2(500),
   CONSTRAINT RESTAURANT_PK PRIMARY KEY(RESTAURANT_NUM)
);

DROP TABLE RESTAURANT;

ALTER TABLE RESTAURANT ADD
	(RESTAURANT_BEST VARCHAR2(10)); -- 추가 예정

CREATE SEQUENCE RESTAURANT_SEQ;

DROP SEQUENCE RESTAURANT_SEQ;

CREATE TABLE MENU_LIST(
	RESTAURANT_NUM NUMBER,
	MENU VARCHAR2(200),
	PRICE VARCHAR2(200),
	CONSTRAINT MENU_LIST_FK FOREIGN KEY(RESTAURANT_NUM) REFERENCES RESTAURANT(RESTAURANT_NUM)
);

DROP TABLE MENU_LIST;

CREATE TABLE REVIEW(
	REVIEW_NUM NUMBER,
	RESTAURANT_NUM NUMBER,
	MEMBER_NICKNAME VARCHAR2(50),
	REVIEW VARCHAR2(3000),
	REVIEW_RATION NUMBER,
	REVIEW_RECOMMEND NUMBER DEFAULT 0,
	REVIEW_REPORT NUMBER DEFAULT 0,
	REVIEW_UPLOAD_DATE DATE,
	CONSTRAINT REVIEW_PK PRIMARY KEY(REVIEW_NUM),
	CONSTRAINT REVIEW_FK_1 FOREIGN KEY(RESTAURANT_NUM) REFERENCES RESTAURANT(RESTAURANT_NUM),
	CONSTRAINT REVIEW_FK_2 FOREIGN KEY(MEMBER_NICKNAME) REFERENCES "MEMBER"(MEMBER_NICKNAME) ON DELETE CASCADE
); -- 다시 만들기

DROP TABLE REVIEW;

CREATE SEQUENCE REVIEW_SEQ;

DROP SEQUENCE REVIEW_SEQ;

CREATE TABLE BOOKMARK(
   BOOKMARK_NUM NUMBER,
   MEMBER_ID VARCHAR2(100),
   RESTAURANT_NUM NUMBER,
   CONSTRAINT BOOKMARK_FK FOREIGN KEY(MEMBER_ID) REFERENCES "MEMBER"(MEMBER_ID),
   CONSTRAINT BOOKMARK_FK2 FOREIGN KEY(RESTAURANT_NUM) REFERENCES RESTAURANT(RESTAURANT_NUM) ON DELETE CASCADE,
   CONSTRAINT BOOKMARK_PK PRIMARY KEY(BOOKMARK_NUM)
);

DROP TABLE BOOKMARK;

CREATE SEQUENCE BOOKMARK_SEQ;

DROP SEQUENCE BOOKMARK_SEQ;

CREATE TABLE PICTURE(
   REVIEW_NUM NUMBER,
   PICTURE_NAME VARCHAR2(200),
   CONSTRAINT PICTURE_PK PRIMARY KEY(PICTURE_NAME), 
   CONSTRAINT PICTURE_FK FOREIGN KEY(REVIEW_NUM) REFERENCES REVIEW(REVIEW_NUM)
);

DROP TABLE PICTURE;

CREATE TABLE REVIEW_REPORT(
	REVIEW_NUM NUMBER,
	DECLARATION_ID VARCHAR2(50),
	CONSTRAINT REVIEW_REPORT_FK FOREIGN KEY(REVIEW_NUM) REFERENCES REVIEW(REVIEW_NUM)
);

DROP TABLE REVIEW_REPORT;

CREATE TABLE EVENT(
	EVENT_TITLE VARCHAR2(100),
	EVENT_CONTENTS VARCHAR2(2000),
	EVENT_END_DATE DATE
);

DROP TABLE EVENT;

CREATE TABLE REVIEW_RECOMMEND(
	REVIEW_NUM NUMBER,
	REFERRER_ID VARCHAR2(100),
	CONSTRAINT REVIEW_RECOMMEND_FK FOREIGN KEY(REVIEW_NUM) REFERENCES REVIEW(REVIEW_NUM)
);

DROP TABLE REVIEW_RECOMMEND;



































