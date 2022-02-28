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