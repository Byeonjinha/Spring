-- --------------------------------------------------------------------------------------------------
-- 연습 테이블 생성
-- --------------------------------------------------------------------------------------------------

-- ------------------------------------------------
-- 고객 테이블
-- ------------------------------------------------


CREATE TABLE TB_CUSTOMER
(
  CUSTOMER_CD      CHAR(7)                 NOT NULL,   -- 고객코드
  CUSTOMER_NM      VARCHAR(10)             NOT NULL,   -- 고객명
  MW_FLG           CHAR(1)                 NOT NULL,   -- 성별구분
  BIRTH_DAY        CHAR(8)                 NOT NULL,   -- 생일
  PHONE_INT     VARCHAR(16),                           -- 전화번호
  EMAIL            VARCHAR(30),                        -- EMAIL
  TOTAL_POINT      INT,                                -- 누적포인트
  REG_DTTM         CHAR(14)                            -- 등록일
);
CREATE UNIQUE INDEX IDX_TB_CUSTOMER ON TB_CUSTOMER (CUSTOMER_CD);
ALTER TABLE TB_CUSTOMER ADD CONSTRAINT PK_TB_CUSTOMER PRIMARY KEY (CUSTOMER_CD);

-- ------------------------------------------------
-- 추가 고객 테이블
-- ------------------------------------------------

CREATE TABLE TB_ADD_CUSTOMER
(
  CUSTOMER_CD      CHAR(7)                 NOT NULL,   -- 고객코드
  CUSTOMER_NM      VARCHAR(10)             NOT NULL,   -- 고객명
  MW_FLG           CHAR(1)                 NOT NULL,   -- 성별구분
  BIRTH_DAY        CHAR(8)                 NOT NULL,   -- 생일
  PHONE_INT     VARCHAR(16)                            -- 전화번호
);
CREATE UNIQUE INDEX IDX_TB_ADD_CUSTOMER ON TB_ADD_CUSTOMER (CUSTOMER_CD);
ALTER TABLE TB_ADD_CUSTOMER ADD CONSTRAINT PK_TB_ADD_CUSTOMER PRIMARY KEY (CUSTOMER_CD);

-- ------------------------------------------------
-- 포인트 테이블
-- ------------------------------------------------

CREATE TABLE TB_POINT
(
  CUSTOMER_CD      CHAR(7)                     NOT NULL,   -- 고객코드
  SEQ_NO           INT                         NOT NULL,   -- 일련번호
  POINT_MEMO       VARCHAR(50),                            -- 포인트 내용
  POINT            INT,                                    -- 포인트
  REG_DTTM         CHAR(14)                                -- 등록일
);
CREATE UNIQUE INDEX IDX_TB_POINT ON TB_POINT (CUSTOMER_CD, SEQ_NO);
ALTER TABLE TB_POINT ADD CONSTRAINT PK_TB_POINT PRIMARY KEY (CUSTOMER_CD, SEQ_NO);

-- ------------------------------------------------
-- 2017년 포인트 테이블
-- ------------------------------------------------

CREATE TABLE TB_POINT_2017
(
  CUSTOMER_CD      CHAR(7)                     NOT NULL,   -- 고객코드
  SEQ_NO           INT(10)                     NOT NULL,   -- 일련번호
  POINT_MEMO       VARCHAR(50),                            -- 포인트 내용
  POINT            INT(10),                                -- 포인트
  REG_DTTM         CHAR(14)                                -- 등록일
);
CREATE UNIQUE INDEX IDX_TB_POINT_2017 ON TB_POINT_2017 (CUSTOMER_CD, SEQ_NO);
ALTER TABLE TB_POINT_2017 ADD CONSTRAINT PK_TB_POINT_2017 PRIMARY KEY (CUSTOMER_CD, SEQ_NO);

-- ------------------------------------------------
-- 2018년 포인트 테이블
-- ------------------------------------------------

CREATE TABLE TB_POINT_2018
(
  CUSTOMER_CD      CHAR(7)                     NOT NULL,   -- 고객코드
  SEQ_NO           INT                         NOT NULL,   -- 일련번호
  POINT_MEMO       VARCHAR(50),                            -- 포인트 내용
  POINT            INT,                                    -- 포인트
  REG_DTTM         CHAR(14)                                -- 등록일
);
CREATE UNIQUE INDEX IDX_TB_POINT_2018 ON TB_POINT_2018 (CUSTOMER_CD, SEQ_NO);
ALTER TABLE TB_POINT_2018 ADD CONSTRAINT PK_TB_POINT_2018 PRIMARY KEY (CUSTOMER_CD, SEQ_NO);

-- ------------------------------------------------
-- 2019년 포인트 테이블
-- ------------------------------------------------

CREATE TABLE TB_POINT_2019
(
  CUSTOMER_CD      CHAR(7)                     NOT NULL,   -- 고객코드
  SEQ_NO           INT                         NOT NULL,   -- 일련번호
  POINT_MEMO       VARCHAR(50),                            -- 포인트 내용
  POINT            INT,                                    -- 포인트
  REG_DTTM         CHAR(14)                                -- 등록일
);
CREATE UNIQUE INDEX IDX_TB_POINT_2019 ON TB_POINT_2019 (CUSTOMER_CD, SEQ_NO);
ALTER TABLE TB_POINT_2019 ADD CONSTRAINT PK_TB_POINT_2019 PRIMARY KEY (CUSTOMER_CD, SEQ_NO);

-- ------------------------------------------------
-- 기타정보 테이블
-- ------------------------------------------------

CREATE TABLE TB_ETC_INFO
(
  CUSTOMER_CD        CHAR(7)                 NOT NULL,   -- 고객코드
  CUSTOMER_ENG_NM    VARCHAR(20),                        -- 영문 고객명
  ITEM_LIST          VARCHAR(40)                         -- 관심 품목
);
CREATE UNIQUE INDEX IDX_TB_ETC_INFO ON TB_ETC_INFO (CUSTOMER_CD);
ALTER TABLE TB_ETC_INFO ADD CONSTRAINT PK_TB_ETC_INFO PRIMARY KEY (CUSTOMER_CD);

-- ------------------------------------------------
-- 품목정보 테이블
-- ------------------------------------------------

CREATE TABLE TB_ITEM_INFO
(
  ITEM_CD          CHAR(7)                 NOT NULL,   -- 관심 품목 코드
  ITEM_NM          VARCHAR(20)                        -- 관심 품목명

);
CREATE UNIQUE INDEX IDX_TB_ITEM_INFO ON TB_ITEM_INFO (ITEM_CD);
ALTER TABLE TB_ITEM_INFO ADD CONSTRAINT PK_TB_ITEM_INFO PRIMARY KEY (ITEM_CD);

-- ------------------------------------------------
-- 성적 테이블
-- ------------------------------------------------

CREATE TABLE TB_GRADE
(
  CLASS_CD         CHAR(1)                 NOT NULL,   -- 반코드
  STUDENT_NO       INT                    NOT NULL,   -- 학생번호
  STUDENT_NM       VARCHAR(10)            NOT NULL,   -- 학생명
  KOR              INT,                               -- 국어
  ENG              INT,                               -- 영어
  MAT              INT,                               -- 수학
  TOT              INT,                               -- 합계
  AVG              NUMERIC(5,1)                       -- 평균
);
CREATE UNIQUE INDEX IDX_TB_GRADE ON TB_GRADE (CLASS_CD, STUDENT_NO);
ALTER TABLE TB_GRADE ADD CONSTRAINT PK_TB_GRADE PRIMARY KEY (CLASS_CD, STUDENT_NO);

-- ------------------------------------------------
-- 7월 성적 테이블
-- ------------------------------------------------

CREATE TABLE TB_GRADE_07
(
  TEST_CD          CHAR(3)                   NOT NULL,   -- 시험코드
  KOR              INT,                                  -- 국어
  ENG              INT,                                  -- 영어
  MAT              INT                                   -- 수학
);
CREATE UNIQUE INDEX IDX_TB_GRADE_07 ON TB_GRADE_07 (TEST_CD);
ALTER TABLE TB_GRADE_07 ADD CONSTRAINT PK_TB_GRADE_07 PRIMARY KEY (TEST_CD);

-- ------------------------------------------------
-- 8월 성적 테이블
-- ------------------------------------------------

CREATE TABLE TB_GRADE_08
(
  TEST_CD          CHAR(3)                  NOT NULL,   -- 시험코드
  KOR              INT,                                 -- 국어
  ENG              INT,                                 -- 영어
  MAT              INT                                  -- 수학
);
CREATE UNIQUE INDEX IDX_TB_GRADE_08 ON TB_GRADE_08 (TEST_CD);
ALTER TABLE TB_GRADE_08 ADD CONSTRAINT PK_TB_GRADE_08 PRIMARY KEY (TEST_CD);

-- ------------------------------------------------
-- 9월 성적 테이블
-- ------------------------------------------------

CREATE TABLE TB_GRADE_09
(
  TEST_CD          CHAR(3)                  NOT NULL,   -- 시험코드
  KOR              INT,                                 -- 국어
  ENG              INT,                                 -- 영어
  MAT              INT                                  -- 수학
);
CREATE UNIQUE INDEX IDX_TB_GRADE_09 ON TB_GRADE_09 (TEST_CD);
ALTER TABLE TB_GRADE_09 ADD CONSTRAINT PK_TB_GRADE_09 PRIMARY KEY (TEST_CD);

-- ------------------------------------------------
-- 2020년 성적 테이블
-- ------------------------------------------------

CREATE TABLE TB_GRADE_2020
(
  TEST_MONTH       CHAR(2)                 NOT NULL,   -- 월
  TEST_CD          CHAR(3)                 NOT NULL,   -- 시험코드
  KOR              INT,                                -- 국어
  ENG              INT,                                -- 영어
  MAT              INT                                 -- 수학
);

CREATE UNIQUE INDEX IDX_TB_GRADE_2020 ON TB_GRADE_2020 (TEST_MONTH);
ALTER TABLE TB_GRADE_2020 ADD CONSTRAINT PK_TB_GRADE_2020 PRIMARY KEY (TEST_MONTH);

-- ------------------------------------------------
-- 반 정보 테이블
-- ------------------------------------------------

CREATE TABLE TB_CLASS_INFO
(
  CLASS_CD         CHAR(1)                 NOT NULL,   -- 반코드
  CLASS_NM         VARCHAR(20)             NOT NULL    -- 반명
);
CREATE UNIQUE INDEX IDX_TB_CLASS_INFO ON TB_CLASS_INFO (CLASS_CD, CLASS_NM);
ALTER TABLE TB_CLASS_INFO ADD CONSTRAINT PK_TB_CLASS_INFO PRIMARY KEY (CLASS_CD, CLASS_NM);

-- ------------------------------------------------
-- 판매 테이블
-- ------------------------------------------------

CREATE TABLE TB_SALES
(
  SALES_DT         CHAR(8)                 NOT NULL,   -- 등록일
  SEQ_NO           INT                     NOT NULL,   -- 일련번호
  PRODUCT_NM       VARCHAR(20),                        -- 상품명
  PRICE            INT,                                -- 단가(원)
  SALES_COUNT      INT                                 -- 판매개수
);
CREATE UNIQUE INDEX IDX_TB_SALES ON TB_SALES (SALES_DT, SEQ_NO);
ALTER TABLE TB_SALES ADD CONSTRAINT PK_TB_SALES PRIMARY KEY (SALES_DT, SEQ_NO);

-- ------------------------------------------------
-- 9월 판매 테이블
-- ------------------------------------------------

CREATE TABLE TB_SALES_09
(
  SEQ_NO           INT                     NOT NULL,   -- 일련번호
  PRODUCT_NM       VARCHAR(20),                        -- 상품명
  CUSTOMER_CD      CHAR(7),                            -- 고객코드
  SALES_COUNT      INT                                 -- 판매개수
);
CREATE UNIQUE INDEX IDX_TB_SALES_09 ON TB_SALES_09 (SEQ_NO);
ALTER TABLE TB_SALES_09 ADD CONSTRAINT PK_TB_SALES_09 PRIMARY KEY (SEQ_NO);

-- ------------------------------------------------
-- 열차시각표 테이블
-- ------------------------------------------------

CREATE TABLE TB_TRAIN_TM
(
  TRAIN_NO         CHAR(5)                  NOT NULL,   -- 열차번호
  RUN_ORDR         INT                      NOT NULL,   -- 운행순서
  STATION_NM       VARCHAR(20),                         -- 역명
  ARV_TM           CHAR(6),                             -- 도착시각
  DPT_TM           CHAR(6)                              -- 출발시각
);
CREATE UNIQUE INDEX IDX_TB_TRAIN_TM ON TB_TRAIN_TM (TRAIN_NO, RUN_ORDR);
ALTER TABLE TB_TRAIN_TM ADD CONSTRAINT PK_TB_TRAIN_TM PRIMARY KEY (TRAIN_NO, RUN_ORDR);


-- ------------------------------------------------
-- 포인트 정보 테이블 (연간정보, 프로시저로 등록/삭제)
-- ------------------------------------------------

CREATE TABLE TB_POINT_INFO
(
  YEAR1            CHAR(4)                 NOT NULL,   -- 연도
  RANK1            INT                     NOT NULL,   -- 순위
  CUSTOMER_CD      CHAR(7)                 NOT NULL,   -- 고객코드
  POINT            INT,                                -- 포인트
  LAST_POINT_DT    CHAR(8)                             -- 최종 포인트 적립일
);
CREATE UNIQUE INDEX IDX_TB_POINT_INFO ON TB_POINT_INFO (YEAR1, RANK1);
ALTER TABLE TB_POINT_INFO ADD CONSTRAINT PK_TB_POINT_INFO PRIMARY KEY (YEAR1, RANK1);

