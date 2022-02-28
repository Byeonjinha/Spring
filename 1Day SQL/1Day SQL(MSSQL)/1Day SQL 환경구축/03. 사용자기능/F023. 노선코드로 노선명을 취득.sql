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