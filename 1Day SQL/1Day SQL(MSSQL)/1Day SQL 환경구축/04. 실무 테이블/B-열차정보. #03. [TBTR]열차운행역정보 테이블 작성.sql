
CREATE TABLE TBTR_TRN_STN
(
  PLN_NO              CHAR(8)              NOT NULL,
  TRN_NO              CHAR(5)              NOT NULL,
  DAY_CD              CHAR(1)              NOT NULL,
  RUN_ORDR            INT                  NOT NULL,
  LN_CD               CHAR(3)              NOT NULL,
  STN_CD              CHAR(8)              NOT NULL,
  ARV_TM              CHAR(6)              NOT NULL,
  DPT_TM              CHAR(6)              NOT NULL,
  STOP_DV_CD          CHAR(2)              NOT NULL,
  ARV_DAY_CNT         INT,
  DPT_DAY_CNT         INT,
  ACM_KM              NUMERIC(5,1)         NOT NULL
);

CREATE UNIQUE INDEX IDX_TBTR_TRN_STN ON TBTR_TRN_STN (PLN_NO, TRN_NO, DAY_CD, RUN_ORDR);

CREATE INDEX IDX1_TBTR_TRN_STN ON TBTR_TRN_STN (PLN_NO, TRN_NO, DAY_CD, RUN_ORDR, STN_CD, STOP_DV_CD);

ALTER TABLE TBTR_TRN_STN ADD CONSTRAINT PK_RUN_TRN_STN PRIMARY KEY (PLN_NO, TRN_NO, DAY_CD, RUN_ORDR);
