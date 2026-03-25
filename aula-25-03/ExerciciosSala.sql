SET SERVEROUTPUT ON;
--1- Crie um bloco PL/SQL para imprimir o nome e a cidade do professor de código: P003.
DECLARE
    v_nome_professor VARCHAR2(100);
    v_nome_cidade VARCHAR2(100);
BEGIN
    SELECT p.nome_professor, c.nome_cidade
    INTO v_nome_professor, v_nome_cidade
    FROM PROFESSOR p
    JOIN USUARIO u ON u.id_usuario = p.id_usuario
    JOIN CIDADE c ON c.id_cidade = u.id_cidade
    WHERE p.cod_professor = 'P003';

    DBMS_OUTPUT.PUT_LINE('NOME: ' || v_nome_professor);
    DBMS_OUTPUT.PUT_LINE('CIDADE: ' || v_nome_cidade);
END;

--2 - Crie um bloco PL/SQL para imprimir o nome e a cidade do professor de código: P003 utilizando %TYPE.
DECLARE
    v_nome_professor PROFESSOR.nome_professor%TYPE;
    v_nome_cidade CIDADE.nome_cidade%TYPE;
BEGIN
    SELECT p.nome_professor, c.nome_cidade
    INTO v_nome_professor, v_nome_cidade
    FROM PROFESSOR p
    JOIN USUARIO u ON u.id_usuario = p.id_usuario
    JOIN CIDADE c ON c.id_cidade = u.id_cidade
    WHERE p.cod_professor = 'P003';

    DBMS_OUTPUT.PUT_LINE('NOME: ' || v_nome_professor);
    DBMS_OUTPUT.PUT_LINE('CIDADE: ' || v_nome_cidade);
END;

--3 - Crie um bloco PL/SQL para imprimir o nome e a cidade do professor de código: P003 utilizando %ROWTYPE.*/
DECLARE
    TYPE t_ProfessorRecord IS RECORD(
        COD_PROFESSOR professor.cod_professor%TYPE,
        NOME_PROFESSOR professor.nome_professor%TYPE,
        NOME_CIDADE cidade.nome_cidade%TYPE);
    v_professor t_ProfessorRecord;
BEGIN
    SELECT p.COD_PROFESSOR, p.NOME_PROFESSOR, c.NOME_CIDADE
    INTO v_professor
    FROM PROFESSOR p JOIN USUARIO u ON u.id_usuario = p.id_usuario
    JOIN CIDADE c ON c.id_cidade = u.id_cidade
    WHERE p.cod_professor = 'P003';
    
    DBMS_OUTPUT.PUT_LINE('CODIGO: ' || v_professor.cod_professor);
    DBMS_OUTPUT.PUT_LINE('NOME: ' || v_professor.nome_professor);
    DBMS_OUTPUT.PUT_LINE('CIDADE: ' || v_professor.nome_cidade);
    
END;