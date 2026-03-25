--AULA 25/03 >> COMANDOS DE CONTROLE(IF, ELSE, WHILE)--

SET SERVEROUTPUT ON;

DECLARE
    v_mes NUMBER := 101;
    v_count NUMBER := 1;
    v_soma NUMBER := 0;
    v_num_max NUMBER := 10;
    v_media NUMBER;
    
BEGIN

    /*CASE v_mes
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('JANEIRO');
        WHEN 2 THEN
            DBMS_OUTPUT.PUT_LINE('FEVEREIRO');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Mês não cadastrado');
    END CASE;*/
    
    /*IF v_mes = 1 THEN
        DBMS_OUTPUT.PUT_LINE('JANEIRO');
    ELSIF v_mes = 2 THEN
        DBMS_OUTPUT.PUT_LINE('FEVEREIRO');
    ELSE
        DBMS_OUTPUT.PUT_LINE('MES NAO CADASTRADO!!');
    END IF;*/
    
    /*WHILE v_count <= v_num_max LOOP
        v_soma := v_soma + v_count;
        v_count := v_count+1;
    END LOOP;
    v_media := v_soma/v_num_max;
    DBMS_OUTPUT.PUT_LINE(v_media);*/
    
    /*FOR v_ctd IN 1..10 LOOP --Variável é declarada dentro do for
        DBMS_OUTPUT.PUT_LINE('Valor: ' || v_ctd);
    END LOOP;
    
    FOR v_ctd_regressivo IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Valor: ' || v_ctd_regressivo);
    END LOOP;*/
    
    --SOMAR TODOS OS NUMEROS IMPARES DE 10 A 123
    FOR v_ctd IN 10..123 LOOP
        IF(NOT MOD(v_ctd, 2) = 0) THEN
            v_soma := v_soma + v_ctd;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('SOMA: ' || v_soma);
END;