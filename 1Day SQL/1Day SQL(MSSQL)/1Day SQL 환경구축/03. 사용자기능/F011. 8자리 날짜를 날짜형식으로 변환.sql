CREATE FUNCTION FN_DT_CnvDtFmt(@p_dt CHAR(8))
RETURNS CHAR(10)

BEGIN
    DECLARE @ret_fmt_dt CHAR(10);

    SET @ret_fmt_dt = CONCAT(SUBSTRING(@p_dt,1,4), '-', SUBSTRING(@p_dt,5,2), '-', SUBSTRING(@p_dt,7,2));

    RETURN @ret_fmt_dt;

END;
