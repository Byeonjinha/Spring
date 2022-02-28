
CREATE TABLE TBTR_TRN_CPX
(
  PLN_NO            CHAR(8)                NOT NULL,
  TRN_NO            CHAR(5)                NOT NULL,
  DAY_CD            CHAR(1)                NOT NULL,
  TGT_TRN_NO        CHAR(5)                NOT NULL,
  PRE_FLG           CHAR(1)                NOT NULL,
  TGT_STN_CD        CHAR(8)                NOT NULL,
  TGT_STN_ORDR      INT                    NOT NULL
);

CREATE UNIQUE INDEX IDX_TBTR_TRN_CPX ON TBTR_TRN_CPX (PLN_NO, TRN_NO, DAY_CD);

ALTER TABLE TBTR_TRN_CPX ADD CONSTRAINT PK_TBTR_TRN_CPX PRIMARY KEY (PLN_NO, TRN_NO, DAY_CD);
