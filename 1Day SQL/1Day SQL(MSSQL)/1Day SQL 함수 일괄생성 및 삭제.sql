-- --------------------------------------------------------------------------------------------------
-- 연습 함수 삭제
-- --------------------------------------------------------------------------------------------------


-- ------------------------------------------------
-- ## 사용자 함수 일괄 삭제
-- ------------------------------------------------

DROP FUNCTION IF EXISTS FN_DT_TmToSec;
DROP FUNCTION IF EXISTS FN_DT_SecToTm;
DROP FUNCTION IF EXISTS FN_DT_OffsetTm;
DROP FUNCTION IF EXISTS FN_DT_OffsetTmDno;
DROP FUNCTION IF EXISTS FN_DT_CnvDtFmt;
DROP FUNCTION IF EXISTS FN_DT_CnvTmFmt;
DROP FUNCTION IF EXISTS FN_DT_CnvDttmFmt;


-- ------------------------------------------------
-- ## 사용자 함수 일괄 삭제
-- ------------------------------------------------

DROP FUNCTION IF EXISTS FN_CD_CnvLnNm;
DROP FUNCTION IF EXISTS FN_CD_CnvStnNm;
DROP FUNCTION IF EXISTS FN_CD_CnvRoutNm;
DROP FUNCTION IF EXISTS FN_CD_CnvRunPtnNote;
DROP FUNCTION IF EXISTS FN_CD_CnvCarNm;
DROP FUNCTION IF EXISTS FN_CD_CnvMkNm;


-- --------------------------------------------------------------------------------------------------
-- 연습 함수 생성
-- --------------------------------------------------------------------------------------------------


CREATE FUNCTION FN_DT_TmToSec(@p_day INT, @p_tm CHAR(6))
RETURNS INT

BEGIN
       DECLARE @ret_sec INT;

       SET @ret_sec = (@p_day * 86400) +
	                  (CONVERT(INT, SUBSTRING(@p_tm,1,2)) * 60 * 60) + 
                      (CONVERT(INT, SUBSTRING(@p_tm,3,2)) * 60 ) +
	                  (CONVERT(INT, SUBSTRING(@p_tm,5,2)));

       RETURN @ret_sec;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_DT_SecToTm(@p_sec INT)
RETURNS CHAR(6)

BEGIN
    DECLARE @ret_tm CHAR(6);

    SET @ret_tm = CONCAT(RIGHT(CONCAT('00',FLOOR((@p_sec%86400)/3600)),2),
                         RIGHT(CONCAT('00',FLOOR(((@p_sec%86400)%3600)/60)),2),
                         RIGHT(CONCAT('00',FLOOR((((@p_sec%86400)%3600)%60))),2));

    RETURN @ret_tm;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_DT_OffsetTm(@p_day INT, @p_tm CHAR(8), @p_offset_sec INT)
RETURNS CHAR(6)

BEGIN
    DECLARE @ret_offset_tm CHAR(6);

	SET @ret_offset_tm = 
        CONCAT(RIGHT(CONCAT('00',FLOOR(((dbo.FN_DT_TmToSec(@p_day, @p_tm)+@p_offset_sec)%86400)/3600)),2),
               RIGHT(CONCAT('00',FLOOR((((dbo.FN_DT_TmToSec(@p_day, @p_tm)+@p_offset_sec)%86400)%3600)/60)),2),
               RIGHT(CONCAT('00',FLOOR(((((dbo.FN_DT_TmToSec(@p_day, @p_tm)+@p_offset_sec)%86400)%3600)%60))),2));

    RETURN @ret_offset_tm;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_DT_OffsetTmDno(@p_day INT, @p_tm CHAR(8), @p_offset_sec INT)
RETURNS INT 

BEGIN
    DECLARE @ret_offset_dno INT;

    SET @ret_offset_dno = FLOOR((dbo.FN_DT_TmToSec(@p_day, @p_tm)+@p_offset_sec)/86400);

    RETURN @ret_offset_dno;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_DT_CnvDtFmt(@p_dt CHAR(8))
RETURNS CHAR(10)

BEGIN
    DECLARE @ret_fmt_dt CHAR(10);

    SET @ret_fmt_dt = CONCAT(SUBSTRING(@p_dt,1,4), '-', SUBSTRING(@p_dt,5,2), '-', SUBSTRING(@p_dt,7,2));

    RETURN @ret_fmt_dt;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_DT_CnvTmFmt(@p_tm CHAR(6))
RETURNS CHAR(8)

BEGIN
    DECLARE @ret_fmt_tm CHAR(8);

    SET @ret_fmt_tm = CONCAT(SUBSTRING(@p_tm,1,2), '-', SUBSTRING(@p_tm,3,2), '-', SUBSTRING(@p_tm,5,2));

    RETURN @ret_fmt_tm;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_DT_CnvDttmFmt(@p_dttm CHAR(14))
RETURNS CHAR(23)

BEGIN
    DECLARE @ret_fmt_dttm CHAR(23);

    SET @ret_fmt_dttm =
	       CONCAT(SUBSTRING(@p_dttm,1,4), '-', SUBSTRING(@p_dttm,5,2), '-', SUBSTRING(@p_dttm,7,2), ' ',
                  SUBSTRING(@p_dttm,9,2), ':', SUBSTRING(@p_dttm,11,2), ':', SUBSTRING(@p_dttm,13,2));

    RETURN @ret_fmt_dttm;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_CD_CnvLnNm(@p_ln_cd CHAR(3), @p_apl_st_dt CHAR(8))
RETURNS VARCHAR(20)

BEGIN
    DECLARE @ret_ln_nm VARCHAR(20);

    SET @ret_ln_nm = (SELECT ln_nm
    FROM   tbsi_ln
    WHERE  ln_cd = @p_ln_cd
    AND    @p_apl_st_dt BETWEEN apl_st_dt AND apl_cls_dt);

    RETURN @ret_ln_nm;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_CD_CnvStnNm(@p_stn_cd CHAR(8), @p_apl_st_dt CHAR(8))
RETURNS VARCHAR(12)

BEGIN
    DECLARE @ret_stn_nm VARCHAR(12);

    SET @ret_stn_nm = (SELECT stn_nm
    FROM   tbsi_stn
    WHERE  stn_cd = @p_stn_cd
    AND    @p_apl_st_dt BETWEEN apl_st_dt AND apl_cls_dt);

    RETURN @ret_stn_nm;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_CD_CnvRoutNm(@p_rout_cd CHAR(5), @p_apl_st_dt CHAR(8))
RETURNS VARCHAR(40)

BEGIN
    DECLARE @ret_rout_nm VARCHAR(40);

    SET @ret_rout_nm = (SELECT rout_nm
    FROM   tbsi_rt
    WHERE  rout_cd = @p_rout_cd
    AND    @p_apl_st_dt BETWEEN apl_st_dt AND apl_cls_dt);

    RETURN @ret_rout_nm;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_CD_CnvRunPtnNote(@p_rout_cd CHAR(5), @p_run_ptn_no INT, @p_apl_st_dt CHAR(8))
RETURNS VARCHAR(200)

BEGIN
    DECLARE @ret_ptn_note VARCHAR(200);

    SET @ret_ptn_note = (SELECT ptn_note 
    FROM   tbsi_run_ptn
    WHERE  rout_cd = @p_rout_cd
    AND    run_ptn_no = @p_run_ptn_no
    AND    @p_apl_st_dt BETWEEN apl_st_dt AND apl_cls_dt);

    RETURN @ret_ptn_note;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_CD_CnvCarNm(@p_car_cd CHAR(5))
RETURNS VARCHAR(40)

BEGIN
    DECLARE @ret_car_nm VARCHAR(40);

    SET @ret_car_nm = (SELECT car_nm
    FROM   tbsi_car
    WHERE  car_cd = @p_car_cd);

    RETURN @ret_car_nm;

END;

-- --------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_CD_CnvMkNm(@p_mk_cd CHAR(5))
RETURNS VARCHAR(40)

BEGIN
    DECLARE @ret_mk_nm VARCHAR(40);

    SET @ret_mk_nm = (SELECT mk_nm
    FROM   tbsi_mk
    WHERE  mk_cd = @p_mk_cd);

    RETURN @ret_mk_nm;

END;

