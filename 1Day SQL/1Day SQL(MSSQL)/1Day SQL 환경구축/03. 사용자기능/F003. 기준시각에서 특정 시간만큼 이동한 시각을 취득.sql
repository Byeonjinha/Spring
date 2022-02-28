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