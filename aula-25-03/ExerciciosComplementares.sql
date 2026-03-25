SET SERVEROUTPUT ON;

--1. Criar um bloco PL/SQL anônimo para imprimir a tabuada do 5.
BEGIN
    DBMS_OUTPUT.PUT_LINE('TABUADA DO 5');
    for x IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('5 x ' || x || ' = ' || 5*x);
    END LOOP;
END;

--2. Criar um bloco PL/SQL anônimo para imprimir as tabuadas para os números 1 ao 10.

BEGIN
    for x IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('TABUADA DO ' || x);
        for y IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(x || ' x ' || y || ' = ' || x*y);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;

--3. Criar um bloco PL/SQL para apresentar os anos bissextos entre 2000 e 2100. Um ano será bissexto quando for possível dividi‐lo por 4, mas não por 100 ou quando for possível dividi‐lo por 400.

BEGIN
    for ano IN 2000..2101 LOOP
        if(mod(ano,4) = 0) then
            if(not mod(ano,100) = 0) then
                if(not mod(ano,400) = 0) then
                DBMS_OUTPUT.PUT_LINE('O ANO ' || ano || ' É BISSEXTO');
                end if;
            end if;
        end if;
    END LOOP;
END;

--4. Criar um bloco PL/SQL para imprimir a sequência de Fibonacci: 1  1  2  3  5  8  13  21  34  55.
DECLARE
    v_num1 number := 1;
    v_num2 number := 1;
    v_prox number;

BEGIN
    DBMS_OUTPUT.PUT_LINE(v_num1);
    DBMS_OUTPUT.PUT_LINE(v_num2);
    for x in 1..8 LOOP
        v_prox := v_num1 + v_num2;
        
        v_num1 := v_num2;
        v_num2 := v_prox;
        DBMS_OUTPUT.PUT_LINE(v_prox);
    end loop;
END;