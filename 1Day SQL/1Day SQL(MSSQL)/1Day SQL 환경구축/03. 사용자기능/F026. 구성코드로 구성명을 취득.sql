CREATE FUNCTION FN_CD_CnvMkNm(@p_mk_cd CHAR(5))
RETURNS VARCHAR(40)

BEGIN
    DECLARE @ret_mk_nm VARCHAR(40);

    SET @ret_mk_nm = (SELECT mk_nm
    FROM   tbsi_mk
    WHERE  mk_cd = @p_mk_cd);

    RETURN @ret_mk_nm;

END;