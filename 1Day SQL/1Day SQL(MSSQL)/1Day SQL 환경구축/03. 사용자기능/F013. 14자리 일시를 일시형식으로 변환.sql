CREATE FUNCTION FN_DT_CnvDttmFmt(@p_dttm CHAR(14))
RETURNS CHAR(23)

BEGIN
    DECLARE @ret_fmt_dttm CHAR(23);

    SET @ret_fmt_dttm =
	       CONCAT(SUBSTRING(@p_dttm,1,4), '-', SUBSTRING(@p_dttm,5,2), '-', SUBSTRING(@p_dttm,7,2), ' ',
                  SUBSTRING(@p_dttm,9,2), ':', SUBSTRING(@p_dttm,11,2), ':', SUBSTRING(@p_dttm,13,2));

    RETURN @ret_fmt_dttm;

END;