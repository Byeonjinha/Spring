CREATE FUNCTION FN_DT_SecToTm(@p_sec INT)
RETURNS CHAR(6)

BEGIN
    DECLARE @ret_tm CHAR(6);

    SET @ret_tm = CONCAT(RIGHT(CONCAT('00',FLOOR((@p_sec%86400)/3600)),2),
                         RIGHT(CONCAT('00',FLOOR(((@p_sec%86400)%3600)/60)),2),
                         RIGHT(CONCAT('00',FLOOR((((@p_sec%86400)%3600)%60))),2));

    RETURN @ret_tm;

END;