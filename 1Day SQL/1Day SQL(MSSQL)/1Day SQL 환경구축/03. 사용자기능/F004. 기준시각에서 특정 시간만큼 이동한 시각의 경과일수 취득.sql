CREATE FUNCTION FN_DT_OffsetTmDno(@p_day INT, @p_tm CHAR(8), @p_offset_sec INT)
RETURNS INT 

BEGIN
    DECLARE @ret_offset_dno INT;

    SET @ret_offset_dno = FLOOR((dbo.FN_DT_TmToSec(@p_day, @p_tm)+@p_offset_sec)/86400);

    RETURN @ret_offset_dno;

END;