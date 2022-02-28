CREATE FUNCTION FN_DT_CnvTmFmt(@p_tm CHAR(6))
RETURNS CHAR(8)

BEGIN
    DECLARE @ret_fmt_tm CHAR(8);

    SET @ret_fmt_tm = CONCAT(SUBSTRING(@p_tm,1,2), '-', SUBSTRING(@p_tm,3,2), '-', SUBSTRING(@p_tm,5,2));

    RETURN @ret_fmt_tm;

END;