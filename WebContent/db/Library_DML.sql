----------------------------------------------------------------------
--                         MEMBER    DAO                            --
----------------------------------------------------------------------
-- 1. 회원 mID중복체크
SELECT * FROM MEMBER WHERE mID = 'aaa';

-- 2. 회원email 중복체크
SELECT COUNT(*) CNT FROM MEMBER WHERE MEMAIL='de@de.com';

-- 3. 회원가입
INSERT INTO MEMBER (mID, mPW, mNAME, mTEL, mEMAIL, mGENDER, mBIRTH, mADDRESS)
    VALUES ('ZZZ', '1', '김갑순', '010-5533-2222', 'kim@kim.com', 'w','', '부산');
    
-- 4. 로그인
SELECT * FROM MEMBER WHERE mID = 'ZZZ' AND mPW = '1';

-- 5. MID로 DTO가져오기
SELECT * FROM MEMBER WHERE mID = 'aaa';

-- 6. 수정 
UPDATE MEMBER
    SET mPW = '2',
        mNAME = '김둘레',
        mTEL = '010-2929-2930',
        mEMAIL = 'ki@ki.com',
        mGENDER = 'W',
        mBIRTH = '1999-06-06',
        mADDRESS = '일산'
    WHERE mID = 'ZZZ';
    
-- 7. 회원리스트
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MEMBER ORDER BY mRDATE DESC) A)
    WHERE RN BETWEEN 4 AND 6;
-- 8. 회원수
SELECT COUNT(*) CNT FROM MEMBER;
-- 9. 회원탈퇴
COMMIT;
DELETE FROM MEMBER WHERE mID = 'aaa';
ROLLBACK;
----------------------------------------------------------------------
--                       FILEBOARD    DAO                           --
----------------------------------------------------------------------
-- 1. 글목록
SELECT *
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT F.*, mNAME FROM FILEBOARD F, MEMBER M 
                WHERE F.mID=M.mID ORDER BY fGROUP DESC, fSTEP)A)
    WHERE RN BETWEEN 1 AND 4;
-- 2. 글갯수
SELECT COUNT(*) FROM FILEBOARD;
-- 3. 글쓰기
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fPW, fGROUP, fSTEP, fINDENT, fIP)
    VALUES (BOARD_SEQ.NEXTVAL, 'ggg', '글7', '이글의내용', NULL, '1', BOARD_SEQ.CURRVAL, 0, 0, '192.000.1.0');
-- 4. hit 1회 올리기
UPDATE FILEBOARD SET fHIT = fHIT +1 WHERE FID=1;
-- 5. 글번호(fid)로 글전체 내용(BoardDto) 가져오기
SELECT F.*, MNAME FROM FILEBOARD F, MEMBER M WHERE F.mID=M.mID AND fID=1;
-- 6. 글 수정하기(fid, ftitle, fcontent, ffilename, frdate(SYSDATE), fip 수정)
UPDATE FILEBOARD 
    SET FTITLE = '바뀐제목',
        FCONTENT = '바뀐본문',
        fFILENAME = NULL,
        FIP = '192.168.151.10',
        FRDATE = SYSDATE
    WHERE FID = 2;
-- 7. 글 삭제하기
COMMIT;
DELETE FROM FILEBOARD WHERE FID=3;
ROLLBACK;
-- 글 삭제시 답변글까지 삭제하는 로직(지우려는 3번글의 삭제하려는 글의 FGROUP=1, FSTEP=1, FINDENT=1 필요)
SELECT * FROM FILEBOARD ORDER BY FGROUP DESC, FSTEP;
DELETE FROM FILEBOARD WHERE FGROUP = 1 AND (FSTEP>=1 AND 
    FSTEP<(SELECT NVL(MIN(FSTEP),9999) 
          FROM FILEBOARD WHERE FGROUP=1 AND FSTEP>1 AND FINDENT<=1));
UPDATE FILEBOARD SET fSTEP = fSTEP-2 WHERE fGROUP=1 AND fSTEP>2;-- 생략 가능(2은 위의 DELETE문 수행결과) : fSTEP 재조정
COMMIT;
-- 8. 답변글 쓰기 전 단계(원글의 fgroup과 같고, 원글의 fstep보다 크면 fstep을 하나 증가하기)
UPDATE FILEBOARD SET FSTEP = FSTEP + 1 WHERE FGROUP=5 AND FSTEP>0;
-- 9. 답변글 쓰기
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME, fPW, fGROUP, fSTEP, fINDENT, fIP)
    VALUES (BOARD_SEQ.NEXTVAL, 'aaa', '글8', '글의내용', NULL, '1', 1, 0, 0, '192.0.1.0');
COMMIT;
-- 10. 회원탈퇴시 탈퇴하는 회원(mid)이 쓴 글 모두 삭제하기
DELETE FROM FILEBOARD WHERE MID='aaa';
ROLLBACK;
----------------------------------------------------------------------
--                          ADMIN    DAO                            --
----------------------------------------------------------------------
-- (1) admin 로그인
SELECT * FROM ADMIN WHERE aID='aaa' AND aPW='111';
-- (2) 로그인 후 세션에 넣을 용도 : admin aid로 dto 가져오기
SELECT * FROM ADMIN WHERE aID='aaa';
----------------------------------------------------------------------
--                          BOOK    DAO                            --
----------------------------------------------------------------------
-- 1. 책 등록
INSERT INTO BOOK (bID, bTITLE, bAUTHOR, bIMAGE1, bIMAGE2, bCONTENT)
    VALUES (BOOK_SEQ.NEXTVAL, 'HTML5', '저자', '114.jpg', 'noImg.png', '컨텐트');
COMMIT;
-- 2. 책 목록(PAGING 없이)
SELECT * FROM BOOK ORDER BY BRDATE DESC;

-- 2. 책 목록(PAGING처리 : TOP-N)
SELECT ROWNUM RN, A.*
    FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A; -- TOP-N구문의 INLINE VIEW에 들어갈 QUERY
SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A)
    WHERE RN BETWEEN 1 AND 6; -- DAO에 들어갈 QUERY

-- 3. 등록된 책 갯수
SELECT COUNT(*) CNT FROM BOOK;

-- 4. 책 상세보기(BID로 DTO가져오기)
SELECT * FROM BOOK WHERE BID=2;

-- 5. 책 삭제
COMMIT;
DELETE FROM BOOK WHERE bID = '2';
ROLLBACK;
----------------------------------------------------------------------
--                      LIBRARYBORROW    DAO                        --
----------------------------------------------------------------------
-- 1. 책 대여 

-- 2. 대여한 책 목록

-- 3. 대여한 책 갯수
SELECT COUNT(*) CNT FROM LIBRARYBORROW;
-- 4. 책 반납
----------------------------------------------------------------------
--                       NOTICEBOARD    DAO                         --
----------------------------------------------------------------------
-- 1. 책 등록