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