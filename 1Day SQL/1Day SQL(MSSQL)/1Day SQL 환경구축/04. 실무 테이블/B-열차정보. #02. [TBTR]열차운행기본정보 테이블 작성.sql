
CREATE TABLE TBTR_TRN_BS
(
  PLN_NO            CHAR(8)                NOT NULL,
  TRN_NO            CHAR(5)                NOT NULL,
  RUN_ST_DT         CHAR(8)                NOT NULL,
  RUN_CLS_DT        CHAR(8)                NOT NULL,
  DAY_CD            CHAR(1)                NOT NULL,
  TRN_KND_CD        CHAR(3)                NOT NULL,
  UND_DV_CD         CHAR(1)                NOT NULL,
  ROUT_CD           CHAR(5)                NOT NULL,
  RUN_PTN_NO        INT,
  ST_STN_RUN_ORDR   INT,
  CLS_STN_RUN_ORDR  INT,
  ST_STN_CD         CHAR(8)                NOT NULL,
  ST_TM             CHAR(6)                NOT NULL,
  CLS_STN_CD        CHAR(8)                NOT NULL,
  CLS_TM            CHAR(6)                NOT NULL,
  RUN_DAY_CNT       INT,
  RUN_DV_CD         CHAR(1)                NOT NULL,
  TRN_MK_CD         CHAR(5)                NOT NULL,
  CPX_TGT_TRN_NO    CHAR(5),
  CPX_DV_CD         CHAR(1),
  TGT_STN_RUN_ORDR  INT,
  PRC_LVL_CD        VARCHAR(2),
  BF_MK_RSV_FLG     CHAR(1),
  AFT_MK_RSV_FLG    CHAR(1),
  TRN_RUN_FLG       CHAR(1)
);

CREATE UNIQUE INDEX IDX_TBTR_TRN_BS ON TBTR_TRN_BS (PLN_NO, TRN_NO, DAY_CD);
ALTER TABLE TBTR_TRN_BS ADD CONSTRAINT PK_TBTR_TRN_BS PRIMARY KEY (PLN_NO, TRN_NO, DAY_CD);
