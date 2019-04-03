
/* Create Tables */

CREATE TABLE basket
(
	basket_num number(7,0) NOT NULL,
	prod_num number(7,0) NOT NULL UNIQUE,
	basket_cnt number(7,0) NOT NULL,
	mem_id varchar2(15) NOT NULL UNIQUE,
	PRIMARY KEY (basket_num)
);


CREATE TABLE buy
(
	buy_num number(7,0) NOT NULL,
	buy_amount number(7,0) NOT NULL,
	mem_id varchar2(15) NOT NULL UNIQUE,
	prod_num number(7,0) NOT NULL UNIQUE,
	buy_bdate date NOT NULL,
	PRIMARY KEY (buy_num)
);


CREATE TABLE cate
(
	cate_num number(7,0) NOT NULL,
	cate_name varchar2(20) NOT NULL UNIQUE,
	PRIMARY KEY (cate_num)
);


CREATE TABLE comments
(
	comm_num number(7,0) NOT NULL,
	comm_content varchar2(2000) NOT NULL,
	mem_id varchar2(15) NOT NULL UNIQUE,
	comm_wdate date NOT NULL,
	review_num number(7,0) NOT NULL UNIQUE,
	PRIMARY KEY (comm_num)
);


CREATE TABLE image
(
	img_num number(7,0) NOT NULL,
	img_type number(2,0) NOT NULL,
	img_orgImg varchar2(30) NOT NULL,
	img_saveImg varchar2(30) NOT NULL,
	review_num number(7,0) NOT NULL UNIQUE,
	img_menu number(2,0) NOT NULL,
	PRIMARY KEY (img_num)
);


CREATE TABLE inter
(
	inter_num number(7,0) NOT NULL,
	mem_id varchar2(15) NOT NULL UNIQUE,
	prod_num number(7,0) NOT NULL UNIQUE,
	PRIMARY KEY (inter_num)
);


CREATE TABLE members
(
	mem_id varchar2(15) NOT NULL,
	mem_pwd varchar2(20) NOT NULL,
	mem_name varchar2(20) NOT NULL,
	mem_phone varchar2(15) NOT NULL UNIQUE,
	mem_email varchar2(30) NOT NULL UNIQUE,
	mem_addr varchar2(200) NOT NULL,
	mem_bday date,
	mem_point number(7,0),
	mem_grade varchar2(20),
	mem_stat number(2,0) NOT NULL,
	PRIMARY KEY (mem_id)
);


CREATE TABLE menu
(
	menu_num number(7,0) NOT NULL,
	menu_name varchar2(20) NOT NULL,
	cate_num number(7,0) NOT NULL UNIQUE,
	PRIMARY KEY (menu_num)
);


CREATE TABLE notice
(
	notice_num number(7,0) NOT NULL,
	notice_title varchar2(200) NOT NULL,
	notice_content varchar2(2000) NOT NULL,
	notice_wdate date NOT NULL,
	notice_step number(2,0) NOT NULL,
	notice_cate varchar2(20) NOT NULL,
	PRIMARY KEY (notice_num)
);


CREATE TABLE pay
(
	pay_num number(7,0) NOT NULL,
	pay_how varchar2(20) NOT NULL,
	pay_date date NOT NULL,
	pay_amount number(7,0) NOT NULL,
	buy_num number(7,0) NOT NULL,
	pay_stat varchar2(20) NOT NULL,
	PRIMARY KEY (pay_num)
);


CREATE TABLE product
(
	prod_num number(7,0) NOT NULL,
	prod_name varchar2(50) NOT NULL,
	prod_price number(7,0) NOT NULL,
	menu_num number(7,0) NOT NULL,
	PRIMARY KEY (prod_num)
);


CREATE TABLE qna
(
	qna_num number(7,0) NOT NULL,
	qna_title varchar2(200) NOT NULL,
	qna_content varchar2(2000) NOT NULL,
	qna_hit number(7,0) NOT NULL,
	qna_wdate date NOT NULL,
	qna_step number(2,0) NOT NULL,
	qna_ref number(7,0) NOT NULL,
	qna_level number(2,0) NOT NULL,
	qna_cate varchar2(20) NOT NULL,
	mem_id varchar2(15) NOT NULL UNIQUE,
	PRIMARY KEY (qna_num)
);


CREATE TABLE review
(
	review_num number(7,0) NOT NULL,
	review_wdate date NOT NULL,
	review_hit number(7,0) NOT NULL,
	review_like number(7,0) NOT NULL,
	review_star number(2,0) NOT NULL,
	review_title varchar2(200) NOT NULL,
	review_content varchar2(2000),
	mem_id varchar2(15) NOT NULL UNIQUE,
	prod_num number(7,0) NOT NULL UNIQUE,
	PRIMARY KEY (review_num)
);


CREATE TABLE ship
(
	ship_num number(7,0) NOT NULL,
	ship_addr varchar2(200) NOT NULL,
	pay_num number(7,0) NOT NULL,
	PRIMARY KEY (ship_num)
);



/* Create Foreign Keys */

ALTER TABLE pay
	ADD FOREIGN KEY (buy_num)
	REFERENCES buy (buy_num)
;


ALTER TABLE menu
	ADD FOREIGN KEY (cate_num)
	REFERENCES cate (cate_num)
;


ALTER TABLE basket
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE buy
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE comments
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE inter
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE qna
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE review
	ADD FOREIGN KEY (mem_id)
	REFERENCES members (mem_id)
;


ALTER TABLE product
	ADD FOREIGN KEY (menu_num)
	REFERENCES menu (menu_num)
;


ALTER TABLE ship
	ADD FOREIGN KEY (pay_num)
	REFERENCES pay (pay_num)
;


ALTER TABLE basket
	ADD FOREIGN KEY (prod_num)
	REFERENCES product (prod_num)
;


ALTER TABLE buy
	ADD FOREIGN KEY (prod_num)
	REFERENCES product (prod_num)
;


ALTER TABLE inter
	ADD FOREIGN KEY (prod_num)
	REFERENCES product (prod_num)
;


ALTER TABLE review
	ADD FOREIGN KEY (prod_num)
	REFERENCES product (prod_num)
;


ALTER TABLE comments
	ADD FOREIGN KEY (review_num)
	REFERENCES review (review_num)
;


ALTER TABLE image
	ADD FOREIGN KEY (review_num)
	REFERENCES review (review_num)
;



