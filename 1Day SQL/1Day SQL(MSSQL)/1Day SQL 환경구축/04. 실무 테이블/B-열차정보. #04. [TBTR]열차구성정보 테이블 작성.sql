
CREATE TABLE TBTR_TRN_MK
(
  PLN_NO            CHAR(8)                NOT NULL,
  TRN_NO            CHAR(5)                NOT NULL,
  DAY_CD            CHAR(1)                NOT NULL,
  SEG_NO            INT                    NOT NULL,
  ST_STN_CD         CHAR(8)                NOT NULL,
  ST_STN_ORDR       INT                    NOT NULL,
  CLS_STN_CD        CHAR(8)                NOT NULL,
  CLS_STN_ORDR      INT                    NOT NULL,
  MK_CD             CHAR(5)                NOT NULL
);

CREATE UNIQUE INDEX IDX_TBTR_TRN_MK ON TBTR_TRN_MK (PLN_NO, TRN_NO, DAY_CD, SEG_NO);

ALTER TABLE TBTR_TRN_MK ADD CONSTRAINT PK_TBTR_TRN_MK PRIMARY KEY (PLN_NO, TRN_NO, DAY_CD, SEG_NO);
