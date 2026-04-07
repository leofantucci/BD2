SET SERVEROUTPUT ON;

DECLARE
    v_area NUMBER;
    FUNCTION AREA(x in NUMBER, y in NUMBER) RETURN NUMBER IS
    BEGIN
        v_area := x*y;
        return v_area;
    END;

BEGIN
    DBMS_OUTPUT.PUT_LINE(AREA(5,2));
END;