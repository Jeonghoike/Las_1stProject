-- TABLE 및 SEQUENCE 제거
DROP TABLE NOTICEBOARD;
DROP TABLE LIBRARYBORROW;
DROP TABLE ADMIN;
DROP TABLE FILEBOARD;
DROP TABLE BOOK;
DROP TABLE MEMBER;
DROP SEQUENCE BOOK_SEQ;
DROP SEQUENCE FILEBOARD_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE LIBRARYBOARD_SEQ;
DROP SEQUENCE NOTICEBOARD_SEQ;

----------------------------------------------------------------------
--                    MEMBER    테이블 생성                           --
----------------------------------------------------------------------
CREATE TABLE MEMBER(
    mID      VARCHAR2(30) PRIMARY KEY,
    mPW      VARCHAR2(30) NOT NULL,
    mNAME    VARCHAR2(30) NOT NULL,
    mTEL     VARCHAR2(30),
    mEMAIL   VARCHAR2(30),
    mGENDER  VARCHAR2(10),
    mBIRTH   DATE,
    mADDRESS VARCHAR2(100),
    mRDATE   DATE DEFAULT SYSDATE
);
-- DUMMY DATA
INSERT INTO MEMBER (mID, mPW, mNAME, mTEL, mEMAIL, mGENDER, mBIRTH, mADDRESS)
    VALUES ('aaa', '1', '둘리', '010-9999-9999', 'DUL@DUL.COM', 'M','', '남극');
INSERT INTO MEMBER (mID, mPW, mNAME, mTEL, mEMAIL, mGENDER, mBIRTH, mADDRESS)
    VALUES ('bbb', '1', '도우너', '010-8888-9999', 'de@de.com', 'w','', '서울');
INSERT INTO MEMBER (mID, mPW, mNAME, mTEL, mEMAIL, mGENDER, mBIRTH, mADDRESS)
    VALUES ('ccc', '1', '또치', '010-7777-9999', 'qw@qw.com', 'w','', '마포');
INSERT INTO MEMBER (mID, mPW, mNAME, mTEL, mEMAIL, mGENDER, mBIRTH, mADDRESS)
    VALUES ('ddd', '1', '마이콜', '010-6666-9999', 'er@er.com', 'M','', '전북');
INSERT INTO MEMBER (mID, mPW, mNAME, mTEL, mEMAIL, mGENDER, mBIRTH, mADDRESS)
    VALUES ('eee', '1', '꼴뚜기', '010-5555-9999', 'vr@vr.com', 'M','', '경남');
INSERT INTO MEMBER (mID, mPW, mNAME, mTEL, mEMAIL, mGENDER, mBIRTH, mADDRESS)
    VALUES ('fff', '1', '고길동', '010-4444-9999', 'fda@fda.com', 'M','', '제주');
INSERT INTO MEMBER (mID, mPW, mNAME, mTEL, mEMAIL, mGENDER, mBIRTH, mADDRESS)
    VALUES ('ggg', '1', '김길동', '010-3333-9999', 'eee@ddd.com', 'M','', '울릉도');
SELECT * FROM MEMBER;

----------------------------------------------------------------------
--              FILEBOARD    테이블 및 SEQUENCE  생성                 --
----------------------------------------------------------------------
CREATE TABLE FILEBOARD(
    fID       NUMBER(6) PRIMARY KEY,
    mID       VARCHAR2(100) REFERENCES MEMBER(mID),
    fTITLE    VARCHAR2(100) NOT NULL,
    fCONTENT  VARCHAR2(4000),
    fFILENAME VARCHAR2(100),
    fPW       VARCHAR2(100) NOT NULL,
    fHIT      NUMBER(6) DEFAULT 0,
    fGROUP    NUMBER(6) NOT NULL,
    fSTEP     NUMBER(6) NOT NULL,
    fINDENT   NUMBER(6) NOT NULL,
    fIP       VARCHAR2(50) NOT NULL,
    fRDATE    DATE DEFAULT SYSDATE NOT NULL
);
CREATE SEQUENCE BOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
-- DUMMY DATA
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fPW, fGROUP, fSTEP, fINDENT, fIP)
    VALUES (BOARD_SEQ.NEXTVAL, 'aaa', '글1', '냉무', NULL, '1', BOARD_SEQ.CURRVAL, 0, 0, '192.168.5.4');
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fPW, fGROUP, fSTEP, fINDENT, fIP)
    VALUES (BOARD_SEQ.NEXTVAL, 'bbb', '글2', '본문', NULL, '1', BOARD_SEQ.CURRVAL, 0, 0, '192.000.5.4');
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fPW, fGROUP, fSTEP, fINDENT, fIP)
    VALUES (BOARD_SEQ.NEXTVAL, 'ccc', '글3', '컨텐츠', NULL, '1', BOARD_SEQ.CURRVAL, 0, 0, '192.168.5');
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fPW, fGROUP, fSTEP, fINDENT, fIP)
    VALUES (BOARD_SEQ.NEXTVAL, 'ddd', '글4', '내용', NULL, '1', BOARD_SEQ.CURRVAL, 0, 0, '192.100.0.4');
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fPW, fGROUP, fSTEP, fINDENT, fIP)
    VALUES (BOARD_SEQ.NEXTVAL, 'eee', '글5', '없음', NULL, '1', BOARD_SEQ.CURRVAL, 0, 0, '192.158.2.4');
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fPW, fGROUP, fSTEP, fINDENT, fIP)
    VALUES (BOARD_SEQ.NEXTVAL, 'fff', '글6', '몰라', NULL, '1', BOARD_SEQ.CURRVAL, 0, 0, '192.108.1.0');

----------------------------------------------------------------------
--                       ADMIN    테이블 및  생성                     --
----------------------------------------------------------------------
CREATE TABLE ADMIN(
    aID   VARCHAR2(30) PRIMARY KEY,
    aPW   VARCHAR2(30),
    aNAME VARCHAR2(30)
);
--DUMMY DATA
INSERT INTO ADMIN (aID, aPW, aNAME)
    VALUES ('aaa', '111', '관리자');

----------------------------------------------------------------------
--                   BOOK  테이블 및 SEQUENCE  생성                   --
----------------------------------------------------------------------
CREATE TABLE BOOK(
    bID      NUMBER(7) PRIMARY KEY,
    bTITLE   VARCHAR2(100) NOT NULL,
    bAUTHOR  VARCHAR2(30) NOT NULL,
    bIMAGE1  VARCHAR2(100) NOT NULL,
    bIMAGE2   VARCHAR2(100) NOT NULL,
    bCONTENT VARCHAR2(4000),
    bRDATE   DATE DEFAULT SYSDATE NOT NULL
);
CREATE SEQUENCE BOOK_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
-- DUMMY DATA 
INSERT INTO BOOK (bID, bTITLE, bAUTHOR, bIMAGE1, bIMAGE2, bCONTENT)
    VALUES (BOOK_SEQ.NEXTVAL, '이것이자바다', '저자', 'NOIMG.PNG', 'NOIMG.PNG', '자바란..');
INSERT INTO BOOK (bID, bTITLE, bAUTHOR, bIMAGE1, bIMAGE2, bCONTENT)
    VALUES (BOOK_SEQ.NEXTVAL, '자바다', '이길동', 'NOIMG.PNG', 'NOIMG.PNG', '');
INSERT INTO BOOK (bID, bTITLE, bAUTHOR, bIMAGE1, bIMAGE2, bCONTENT)
    VALUES (BOOK_SEQ.NEXTVAL, '이것이', '홍길동', 'NOIMG.PNG', 'NOIMG.PNG', '');
INSERT INTO BOOK (bID, bTITLE, bAUTHOR, bIMAGE1, bIMAGE2, bCONTENT)
    VALUES (BOOK_SEQ.NEXTVAL, '역사', '역사', 'NOIMG.PNG', 'NOIMG.PNG', '역사는');
INSERT INTO BOOK (bID, bTITLE, bAUTHOR, bIMAGE1, bIMAGE2, bCONTENT)
    VALUES (BOOK_SEQ.NEXTVAL, '수학', '수학', 'NOIMG.PNG', 'NOIMG.PNG', '1+1은');


----------------------------------------------------------------------
--             LIBRARYBORROW  테이블 및 SEQUENCE  생성                --
----------------------------------------------------------------------
CREATE TABLE LIBRARYBORROW(
    lbNO NUMBER(7) PRIMARY KEY,
    bID NUMBER(7) REFERENCES BOOK(bID),
    mID VARCHAR2(30) REFERENCES MEMBER(mID),
    lbRENTYN VARCHAR2(1) NOT NULL,
    lbRENTDATE DATE DEFAULT SYSDATE NOT NULL,
    lbRETURNDATE DATE
);
CREATE SEQUENCE LIBRARYBORROW_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;

----------------------------------------------------------------------
--             NOTICEBOARD  테이블 및 SEQUENCE  생성                --
----------------------------------------------------------------------
CREATE TABLE NOTICEBOARD(
    nNO      NUMBER(7) PRIMARY KEY,
    aID      VARCHAR2(30) REFERENCES ADMIN(aID),
    nTITLE   VARCHAR2(100) NOT NULL,
    nCONTENT VARCHAR2(4000) NOT NULL,
    nPW      VARCHAR2(30) NOT NULL,
    nHIT     NUMBER(6) NOT NULL,
    nRDATE   DATE DEFAULT SYSDATE NOT NULL
);
CREATE SEQUENCE NOTICEBOARD_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;