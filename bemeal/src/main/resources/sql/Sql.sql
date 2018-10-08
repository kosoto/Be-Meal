/* 수정된 테이블 : ITEM_INGREDIENT, MEMBER, TAG, TASTE, PRESENT, KEYWORD, BOARD, ARTICLE, JUDGMENT, IMAGE*/
CREATE TABLE INGREDIENT(
	ING_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	ING_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE ITEM(
	ITEM_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	ITEM_NAME VARCHAR(30) NOT NULL,
	BRAND VARCHAR(20),
	CATEGORY VARCHAR(30),
	PRICE INT NOT NULL,
	SALE_PERCENT DOUBLE,
	EVENT BOOLEAN,
	NEW_ITEM BOOLEAN,
	IMAGE VARCHAR(200),
	EXPLAINS VARCHAR(200),
	CALORIE INT
);

CREATE TABLE ITEM_INGREDIENT(
	ITEM_ING_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	ING_SEQ INT NOT NULL,
	ITEM_SEQ INT NOT NULL,
	FOREIGN KEY (ING_SEQ) REFERENCES INGREDIENT (ING_SEQ) ON DELETE CASCADE,
	FOREIGN KEY (ITEM_SEQ) REFERENCES ITEM (ITEM_SEQ) ON DELETE CASCADE
);

CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR(20) PRIMARY KEY,
	PASSWORD VARCHAR(20) NOT NULL,
	NAME VARCHAR(20) NOT NULL,
	AGE INT,
	SSN VARCHAR(14),
	GENDER VARCHAR(1),
	ADDRESS VARCHAR(255),
	E_MAIL VARCHAR(255),
	PHONE_NUM VARCHAR(30)
);

CREATE TABLE TAG(
	TAG_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	TAG_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE TASTE(
	TASTE_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	QUANTITY INT,
	DIR_NAME VARCHAR(50),
	GRADE DOUBLE,
	TASTE_DATE DATE NOT NULL DEFAULT (CURRENT_DATE),
	TASTE_TIME TIME NOT NULL DEFAULT (CURRENT_TIME),
	FLAG VARCHAR(10) NOT NULL,
	MEMBER_ID VARCHAR(20) NOT NULL,
	ITEM_SEQ INT NOT NULL,
	TAG_SEQ INT,
	FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY (ITEM_SEQ) REFERENCES ITEM (ITEM_SEQ) ON DELETE CASCADE,
	FOREIGN KEY (TAG_SEQ) REFERENCES TAG (TAG_SEQ) ON DELETE CASCADE
);

CREATE TABLE PRESENT(
	PRESENT_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	TO_ID VARCHAR(20),
	TASTE_SEQ INT NOT NULL,
	FOREIGN KEY (TO_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL,
	FOREIGN KEY (TASTE_SEQ) REFERENCES TASTE (TASTE_SEQ)
);

CREATE TABLE KEYWORD(
	KEYWORD_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	KEYWORD VARCHAR(50) NOT NULL
);

CREATE TABLE SEARCH(
	SEARCH_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	SEARCH_DATE TIMESTAMP NOT NULL DEFAULT now(),
	MEMBER_ID VARCHAR(20) NOT NULL,
	KEYWORD_SEQ INT NOT NULL,	
	FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
	FOREIGN KEY (KEYWORD_SEQ) REFERENCES KEYWORD (KEYWORD_SEQ) ON DELETE CASCADE
);

CREATE TABLE BOARD(
	BOARD_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	BOARD_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE ARTICLE(
	ARTICLE_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	TITLE VARCHAR(255) NOT NULL,
	CONTENT TEXT NULL,
	ARTICLE_DATE DATE NOT NULL DEFAULT (CURRENT_DATE),
	ARTICLE_TIME TIME NOT NULL DEFAULT (CURRENT_TIME),
	URL VARCHAR(255),
	BOARD_SEQ INT,
	MEMBER_ID VARCHAR(20),
	ITEM_SEQ INT,
	FOREIGN KEY (BOARD_SEQ) REFERENCES BOARD (BOARD_SEQ),
	FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID),
	FOREIGN KEY (ITEM_SEQ) REFERENCES ITEM (ITEM_SEQ)
);

CREATE TABLE JUDGMENT(
	JUDGMENT_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	FLAG VARCHAR(5) NOT NULL,
	ARTICLE_SEQ INT NOT NULL,
	FOREIGN KEY (ARTICLE_SEQ) REFERENCES ARTICLE (ARTICLE_SEQ) ON DELETE CASCADE
);

CREATE TABLE IMAGE(
	IMG_SEQ INT PRIMARY KEY AUTO_INCREMENT,
	IMG VARCHAR(255) NOT NULL,
	ITEM_SEQ INT,
	FOREIGN KEY (ITEM_SEQ) REFERENCES ITEM (ITEM_SEQ) ON DELETE CASCADE,
	MEMBER_ID VARCHAR(20),
	FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
	ARTICLE_SEQ INT,
	FOREIGN KEY (ARTICLE_SEQ) REFERENCES ARTICLE (ARTICLE_SEQ) ON DELETE CASCADE
);

show tables;
desc article;
desc board;
desc image;
desc ingredient;
desc item;
desc item_ingredient;
desc judgment;
desc keyword;
desc member;
desc present;
desc search;
desc tag;
desc taste;







