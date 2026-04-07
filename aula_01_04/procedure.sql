SET SERVEROUTPUT ON;

DECLARE
    v_numero NUMBER;
    v_count NUMBER;
    v_resultado NUMBER;
    
    PROCEDURE TABUADA (N IN NUMBER) IS
    BEGIN
        FOR v_count in 1..10 LOOP
            v_resultado := N* v_count;
            DBMS_OUTPUT.PUT_LINE(v_count || ' x ' || N || ' = ' || v_resultado);
        END LOOP;
    END;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('TABUADA');
    TABUADA(5);
    
END;