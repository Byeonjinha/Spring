CREATE FUNCTION FN_CD_CnvCarNm(@p_car_cd CHAR(5))
RETURNS VARCHAR(40)

BEGIN
    DECLARE @ret_car_nm VARCHAR(40);

    SET @ret_car_nm = (SELECT car_nm
    FROM   tbsi_car
    WHERE  car_cd = @p_car_cd);

    RETURN @ret_car_nm;

END;