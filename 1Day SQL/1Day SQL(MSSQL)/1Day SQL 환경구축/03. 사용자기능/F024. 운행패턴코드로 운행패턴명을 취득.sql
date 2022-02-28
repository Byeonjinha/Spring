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