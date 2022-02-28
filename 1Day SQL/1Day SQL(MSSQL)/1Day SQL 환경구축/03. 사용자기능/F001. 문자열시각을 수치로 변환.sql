CREATE FUNCTION FN_DT_TmToSec(@p_day INT, @p_tm CHAR(6))
RETURNS INT

BEGIN
       DECLARE @ret_sec INT;

       SET @ret_sec = (@p_day * 86400) +
	                  (CONVERT(INT, SUBSTRING(@p_tm,1,2)) * 60 * 60) + 
                      (CONVERT(INT, SUBSTRING(@p_tm,3,2)) * 60 ) +
	                  (CONVERT(INT, SUBSTRING(@p_tm,5,2)));

       RETURN @ret_sec;

END;