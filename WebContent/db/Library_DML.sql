----------------------------------------------------------------------
--                         MEMBER    DAO                            --
----------------------------------------------------------------------
-- 1. 회원 mID중복체크
SELECT * FROM MEMBER WHERE mID = 'aaa';

-- 2. 회원email 중복체크
SELECT * FROM MEMBER WHERE mEMAIL = 'DUL@DUL.COM';

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
SELECT F.* FROM FILEBOARD F, MEMBER M WHERE F.mID=M.mID AND fID=1;
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

-- 8. 답변글 쓰기 전 단계(원글의 fgroup과 같고, 원글의 fstep보다 크면 fstep을 하나 증가하기)
-- 9. 답변글 쓰기
-- 10. 회원탈퇴시 탈퇴하는 회원(mid)이 쓴 글 모두 삭제하기

----------------------------------------------------------------------
--                          ADMIN    DAO                            --
----------------------------------------------------------------------
-- (1) admin 로그인
-- (2) 로그인 후 세션에 넣을 용도 : admin aid로 dto 가져오기