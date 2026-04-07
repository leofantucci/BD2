SET SERVEROUTPUT ON;
--EXERCICIO 1
DROP TABLE PRODUTOS;

CREATE TABLE PRODUTOS
(
    CODIGO INTEGER PRIMARY KEY,
    CATEGORIA VARCHAR2(1),
    VALOR NUMBER
);

INSERT INTO PRODUTOS VALUES(1001, 'A', 7.55);
INSERT INTO PRODUTOS VALUES(1002, 'B', 5.95);
INSERT INTO PRODUTOS VALUES(1003, 'C', 3.45);

COMMIT;

DECLARE
    PROCEDURE REAJUSTE(categoria IN VARCHAR2, reajuste IN NUMBER) IS
    BEGIN
        UPDATE PRODUTOS p
        SET p.valor = p.valor + (p.valor * reajuste)
        WHERE p.categoria = categoria;
    END;
BEGIN
    REAJUSTE('A', 0.05);
    REAJUSTE('B', 0.10);
    REAJUSTE('C', 0.15);
END;
/

SELECT * FROM PRODUTOS;

--EXERCICIO 2

DROP TABLE CLIENTE;

CREATE TABLE CLIENTE
(
    COD_CLI INTEGER PRIMARY KEY,
    NOME_CLI VARCHAR2(32),
    EMAIL_CLI VARCHAR2(32)
);

INSERT INTO CLIENTE(COD_CLI, NOME_CLI, EMAIL_CLI) VALUES(10, 'BEATRIZ BERNARDES', 'bb@dominio.com.br');

SELECT * FROM CLIENTE;

DECLARE
    v_nome_cliente varchar(255);
    v_email_cliente varchar(255);
    
    PROCEDURE puxarClientePorID(cod_cliente INTEGER) IS
    BEGIN
        SELECT c.nome_cli, c.email_cli INTO v_nome_cliente, v_email_cliente FROM CLIENTE c WHERE c.cod_cli = cod_cliente;
        DBMS_OUTPUT.PUT_LINE('NOME: ' || v_nome_cliente || ' - EMAIL: ' || v_email_cliente);
    END;
    
BEGIN
    puxarClientePorID(10);
END;

--EXERCICIO 3

CREATE TABLE ALUNO2
(
    RA NUMBER PRIMARY KEY,
    NOME VARCHAR2(255),
    N1 NUMBER,
    N2 NUMBER,
    N3 NUMBER,
    N4 NUMBER,
    MEDIA NUMBER,
    APROVADO VARCHAR2(255)
);

SELECT * FROM ALUNO2;

DECLARE
    v_maior_nota NUMBER;
    v_media NUMBER;
    v_resultado VARCHAR2(255);
    PROCEDURE mediaAluno(RA NUMBER, NOME VARCHAR2, N1 NUMBER, N2 NUMBER, N3 NUMBER, N4 NUMBER) IS
    BEGIN
        v_maior_nota := GREATEST(N1, N2);
        v_media := (v_maior_nota + N3 + N4)/3;
        IF(v_media >= 6) THEN
            v_resultado := 'APROVADO';
        ELSE
            v_resultado := 'REPROVADO';
        END IF;
        INSERT INTO ALUNO2(RA, NOME, N1, N2, N3, N4, MEDIA, APROVADO) VALUES(RA, NOME, N1, N2, N3, N4, v_media, v_resultado);
    END;
    
BEGIN
    mediaAluno(123, 'Antonio Alves', 6.5, 3.5, 9.5, 5.0);
END;

--EXERCICIO 4

DROP TABLE PRODUTOS;
DROP TABLE ALIQUOTA;

CREATE TABLE PRODUTOS
(
    CODIGO INTEGER PRIMARY KEY,
    CATEGORIA VARCHAR2(1),
    VALOR NUMBER
);

CREATE TABLE ALIQUOTA
(
    COD_CAT VARCHAR2(255),
    IPI NUMBER
);

INSERT INTO PRODUTOS VALUES(1001, 'A', 120);
INSERT INTO PRODUTOS VALUES(1002, 'B', 250);

INSERT INTO ALIQUOTA VALUES('A', 10);
INSERT INTO ALIQUOTA VALUES('B', 15);

SELECT * FROM PRODUTOS;
SELECT * FROM ALIQUOTA;

DECLARE
    v_valor_final NUMBER;
    v_categoria_prod VARCHAR2(255);
    v_preco_prod NUMBER;
    v_aliquota NUMBER;
    
    PROCEDURE CalcularPrecoFinal(cod_prod NUMBER) IS
        BEGIN
            SELECT p.categoria, p.valor, a.ipi
            INTO v_categoria_prod, v_preco_prod, v_aliquota
            FROM Produtos p, Aliquota a 
            WHERE p.codigo = cod_prod
            AND p.categoria = a.cod_cat;
            
            v_valor_final := v_preco_prod + v_preco_prod * (v_aliquota/100); 
            
            DBMS_OUTPUT.PUT_LINE('VALOR FINAL: R$' || v_valor_final);
            
        END;
BEGIN
    CalcularPrecoFinal(1001);
END;

--EXERCICIO 5

DROP TABLE LUCRO;
CREATE TABLE LUCRO(
    ANO NUMBER,
    VALOR NUMBER
);

INSERT INTO LUCRO(ANO, VALOR) VALUES(2007, 1200000);
INSERT INTO LUCRO(ANO, VALOR) VALUES(2008, 1500000);
INSERT INTO LUCRO(ANO, VALOR) VALUES(2009, 1400000);

CREATE TABLE SALARIO(
    MATRICULA NUMBER PRIMARY KEY,
    VALOR NUMBER
);

INSERT INTO SALARIO(MATRICULA, VALOR) VALUES(1001, 2500);
INSERT INTO SALARIO(MATRICULA, VALOR) VALUES(1002, 3200);

SELECT * FROM LUCRO;
SELECT * FROM SALARIO;

DECLARE
    v_bonus NUMBER;
    v_salario NUMBER;
    v_lucro NUMBER;
    
    PROCEDURE calcularBonus(ano NUMBER, matr_func NUMBER) IS
        BEGIN
            v_bonus := 0;
            SELECT s.valor, l.valor
            INTO v_salario, v_lucro
            FROM Salario s, Lucro l
            WHERE s.matricula = matr_func
            AND l.ano = ano
            AND ROWNUM = 1;
            
            v_bonus := (v_lucro * 0.01) + (v_salario * 0.05);
            
            DBMS_OUTPUT.PUT_LINE('Bonus do funcionário(' || matr_func || '): R$ ' || v_bonus);
        END;
BEGIN
    calcularBonus(2007, 1001);
    calcularBonus(2008, 1002);
END;

--EXERCICIO 6
DECLARE
    v_primo BOOLEAN;

    PROCEDURE ehPrimo(numero NUMBER) IS
    BEGIN
        v_primo := TRUE;

        IF numero <= 1 THEN
            v_primo := FALSE;
        ELSE
            FOR i IN 2..numero-1 LOOP
                IF MOD(numero, i) = 0 THEN
                    v_primo := FALSE;
                    EXIT;
                END IF;
            END LOOP;
        END IF;

        IF v_primo THEN
            DBMS_OUTPUT.PUT_LINE('Eh primo');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Nao eh primo');
        END IF;
    END;

BEGIN
    ehPrimo(6);
END;

--EXERCICIO 7

DECLARE
    temp_final NUMBER;
    
    FUNCTION converterFah_Cel(temperatura NUMBER) RETURN NUMBER;
    
    FUNCTION converterFah_Cel(temperatura NUMBER) RETURN NUMBER IS
    BEGIN
        temp_final := (temperatura-32)/1.8;
        return temp_final;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE(converterFah_Cel(443));
END;

--EXERCICIO 8

DROP TABLE FUNCIONARIO;
DROP TABLE DEPARTAMENTO;
CREATE TABLE FUNCIONARIO(
    MATRICULA NUMBER,
    NOME VARCHAR2(255),
    COD_DEPTO NUMBER
);

CREATE TABLE DEPARTAMENTO(
    COD_DEPTO NUMBER,
    NOME_DEPTO VARCHAR2(255)
);

INSERT INTO FUNCIONARIO(MATRICULA, NOME, COD_DEPTO) VALUES(1001, 'ANTONIO', 1);
INSERT INTO FUNCIONARIO(MATRICULA, NOME, COD_DEPTO) VALUES(1002, 'BEATRIZ', 2);
INSERT INTO FUNCIONARIO(MATRICULA, NOME, COD_DEPTO) VALUES(1003, 'CLAUDIO', 1);

INSERT INTO DEPARTAMENTO(COD_DEPTO, NOME_DEPTO) VALUES(1, 'ENGENHARIA');
INSERT INTO DEPARTAMENTO(COD_DEPTO, NOME_DEPTO) VALUES(2, 'INFORMATICA');

SELECT * FROM FUNCIONARIO;
SELECT * FROM DEPARTAMENTO;

DECLARE
    nome_func VARCHAR2(255);
    nome_dept VARCHAR2(255);
    PROCEDURE infoFuncionario(mat NUMBER) IS
    BEGIN
        SELECT f.nome, d.nome_depto
        INTO nome_func, nome_dept
        FROM FUNCIONARIO f
        JOIN DEPARTAMENTO d
        ON f.cod_depto = d.cod_depto
        WHERE f.matricula = mat
        AND ROWNUM = 1;
        
        DBMS_OUTPUT.PUT_LINE('MATRICULA(' || mat || ') -- NOME DO FUNCIONARIO: ' || nome_func || ' -- DEPARTAMENTO: ' || nome_dept);
        
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Funcionario nao encontrado.');
        
    END;
    
BEGIN
    infoFuncionario(1001);
END;