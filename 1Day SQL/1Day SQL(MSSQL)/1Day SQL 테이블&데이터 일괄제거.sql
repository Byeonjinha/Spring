-- --------------------------------------------------------------------------------------------------
-- 연습 테이블 삭제
-- --------------------------------------------------------------------------------------------------

-- 고객 관련 테이블

DROP TABLE IF EXISTS TB_CUSTOMER;
DROP TABLE IF EXISTS TB_ADD_CUSTOMER;
DROP TABLE IF EXISTS TB_POINT;
DROP TABLE IF EXISTS TB_POINT_2017;
DROP TABLE IF EXISTS TB_POINT_2018;
DROP TABLE IF EXISTS TB_POINT_2019;
DROP TABLE IF EXISTS TB_ETC_INFO;
DROP TABLE IF EXISTS TB_ITEM_INFO;

-- 성적 관련 테이블

DROP TABLE IF EXISTS TB_GRADE;
DROP TABLE IF EXISTS TB_GRADE_07;
DROP TABLE IF EXISTS TB_GRADE_08;
DROP TABLE IF EXISTS TB_GRADE_09;
DROP TABLE IF EXISTS TB_GRADE_2020;
DROP TABLE IF EXISTS TB_CLASS_INFO;

-- 판매 관련 테이블

DROP TABLE IF EXISTS TB_SALES;
DROP TABLE IF EXISTS TB_SALES_09;

-- 열차 관련 테이블

DROP TABLE IF EXISTS TB_TRAIN_TM;

-- 사용자 기능 연습 관련 테이블

DROP TABLE IF EXISTS TB_POINT_INFO;


-- --------------------------------------------------------------------------------------------------
-- ## 실무 테이블 일괄 삭제
-- --------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS tbcm_cal;
DROP TABLE IF EXISTS tbcm_com_cd;
DROP TABLE IF EXISTS tbtr_pln;
DROP TABLE IF EXISTS tbtr_trn_bs;
DROP TABLE IF EXISTS tbtr_trn_stn;
DROP TABLE IF EXISTS tbtr_trn_mk;
DROP TABLE IF EXISTS tbtr_trn_scar;
DROP TABLE IF EXISTS tbtr_trn_cpx;
DROP TABLE IF EXISTS tbsi_run_ptn_det;
DROP TABLE IF EXISTS tbsi_run_ptn;
DROP TABLE IF EXISTS tbsi_mk;
DROP TABLE IF EXISTS tbsi_scar;
DROP TABLE IF EXISTS tbsi_car;
DROP TABLE IF EXISTS tbsi_rt_trn_no;
DROP TABLE IF EXISTS tbsi_rt_stn;
DROP TABLE IF EXISTS tbsi_rt_ln;
DROP TABLE IF EXISTS tbsi_rt;
DROP TABLE IF EXISTS tbsi_ln_cons;
DROP TABLE IF EXISTS tbsi_stn;
DROP TABLE IF EXISTS tbsi_ln;
