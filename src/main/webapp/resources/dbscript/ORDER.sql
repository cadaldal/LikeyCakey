--ORDER
DROP TABLE PRODUCT_ORDER;
CREATE TABLE PRODUCT_ORDER
(
   P_O_NUM NUMBER(10),
   P_O_DATE DATE DEFAULT SYSDATE,
   P_O_BOOKDATE DATE DEFAULT SYSDATE,
   P_O_CNT NUMBER NOT NULL,
   P_O_PRICE NUMBER(10) NOT NULL,
   P_O_TEXT VARCHAR2(60),
   P_O_REC_NAME VARCHAR2(50) NOT NULL,
   P_O_REC_CP VARCHAR2(50) NOT NULL,
   P_O_REC_POST VARCHAR2(10) NOT NULL,
   P_O_REC_BASIC_ADDR VARCHAR2(150) NOT NULL,
   P_O_REC_DETAIL_ADDR VARCHAR2(100) NOT NULL,
   P_O_MEMO VARCHAR2(300),

   M_ID VARCHAR2(50),
   P_B_NUM NUMBER(10),
   BIZ_DELIVERY NUMBER(10),
   D_STATUS_NUM NUMBER,
    
    CONSTRAINT ORDER_PK_NUM PRIMARY KEY (P_O_NUM),
    CONSTRAINT ORDER_FK_ID FOREIGN KEY (M_ID) REFERENCES MEMBER (M_ID),
    CONSTRAINT ORDER_FK_P_B_NUM FOREIGN KEY (P_B_NUM) REFERENCES PRODUCT_BOARD (P_B_NUM),
    CONSTRAINT ORDER_FK_BIZ_DELIVERY FOREIGN KEY (BIZ_DELIVERY) REFERENCES MEMBER_BIZ (BIZ_DELIVERY),
    CONSTRAINT ORDER_D_STATUS_NUM FOREIGN KEY (D_STATUS_NUM) REFERENCES DELIVERY_STATUS (D_STATUS_NUM)
);

DROP TABLE CUSTOM_ORDER;
CREATE TABLE CUSTOM_ORDER
(
   C_O_NUM NUMBER,
   C_O_DATE DATE DEFAULT SYSDATE,
   C_O_BOOKDATE DATE DEFAULT SYSDATE,
   C_O_CNT NUMBER NOT NULL,
   C_O_PRICE NUMBER(10) NOT NULL,
   C_O_TEXT VARCHAR2(60),
   C_O_SHEET VARCHAR2(20) NOT NULL,
   C_O_TOPPING VARCHAR2(20) NOT NULL,
   C_O_CREAM VARCHAR2(20) NOT NULL,
   C_O_REC_NAME VARCHAR2(50) NOT NULL,
   C_O_REC_CP VARCHAR2(50) NOT NULL,
   C_O_REC_POST VARCHAR2(10) NOT NULL,
   C_O_REC_BASIC_ADDR VARCHAR2(150) NOT NULL,
   C_O_REC_DETAIL_ADDR VARCHAR2(100) NOT NULL,
   C_O_MEMO VARCHAR2(300),
   
   M_ID VARCHAR2(50),
   C_B_NUM VARCHAR2(10),
   BIZ_DELIVERY NUMBER(10),
   D_STATUS_NUM NUMBER
    
    CONSTRAINT CUSTOM_PK_NUM PRIMARY KEY (C_O_NUM),
    CONSTRAINT CUSTOM_FK_ID FOREIGN KEY (M_ID) REFERENCES MEMBER (M_ID),
    CONSTRAINT CUSTOM_FK_P_B_NUM FOREIGN KEY (C_B_NUM) REFERENCES COSTOM_BOARD (C_B_NUM),
    CONSTRAINT CUSTOM_FK_BIZ_DELIVERY FOREIGN KEY (BIZ_DELIVERY) REFERENCES MEMBER_BIZ (BIZ_DELIVERY),
    CONSTRAINT CUSTOM_D_STATUS_NUM FOREIGN KEY (D_STATUS_NUM) REFERENCES DELIVERY_STATUS (D_STATUS_NUM)
);

DROP TABLE CUSTOM_SHEET;
CREATE TABLE CUSTOM_SHEET
(
   M_ID VARCHAR2(50),
   SH_NUM VARCHAR2(20) NOT NULL,
   SH_NAME VARCHAR2(50) NOT NULL,
   SH_PRICE NUMBER  NOT NULL
    
     CONSTRAINT CUSTOM_SHEET_FK_ID FOREIGN KEY (M_ID) REFERENCES MEMBER (M_ID),
);

DROP TABLE CUSTOM_TOPPING;
CREATE TABLE CUSTOM_TOPPING
(
   M_ID VARCHAR2(50),
   TP_NUM VARCHAR2(20) NOT NULL,
   TP_NAME VARCHAR2(50) NOT NULL,
   TP_PRICE NUMBER NOT NULL
     CONSTRAINT CUSTOM_TOPPING_FK_ID FOREIGN KEY (M_ID) REFERENCES MEMBER (M_ID),
);

DROP TABLE CUSTOM_CREAM;
CREATE TABLE CUSTOM_CREAM
(
   M_ID VARCHAR2(50) NOT NULL,
   CR_NUM VARCHAR2(20) NOT NULL,
   CR_NAME VARCHAR2(50) NOT NULL,
   CR_PRICE NUMBER
     CONSTRAINT CUSTOM_CREAM_FK_ID FOREIGN KEY (M_ID) REFERENCES MEMBER (M_ID),
);