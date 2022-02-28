
CREATE TABLE TBSI_RUN_PTN
(
  ROUT_CD             CHAR(5)              NOT NULL,
  RUN_PTN_NO          INT                  NOT NULL,
  APL_ST_DT           CHAR(8)              NOT NULL,
  APL_CLS_DT          CHAR(8)              NOT NULL,
  PTN_DV_CD           CHAR(1)              NOT NULL,
  UND_DV_CD           CHAR(1)              NOT NULL,
  PTN_NOTE            VARCHAR(200)
);

CREATE UNIQUE INDEX IDX_TBSI_RUN_PTN ON TBSI_RUN_PTN (ROUT_CD, RUN_PTN_NO);
ALTER TABLE TBSI_RUN_PTN ADD CONSTRAINT PK_TBSI_RUN_PTN PRIMARY KEY (ROUT_CD, RUN_PTN_NO);
