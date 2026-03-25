--CRIAR UM REGISTRO CHAMADO t_DisciplinaRecord, com os campos:
--COD DISCIPLINA, NOME DISCIPLINA, NOME PROFESSOR
--IMPRIMIR OS DADOS DA DISCIPLINA COM COD_DISCIPLINA = 'BD1'

DECLARE
    TYPE t_alunoRecord IS RECORD(
    COD_ALUNO ALUNO.COD_ALUNO%TYPE,
    NOME_ALUNO ALUNO.NOME_ALUNO%TYPE);
    v_aluno t_alunoRecord;
    
    TYPE t_DisciplinaRecord IS RECORD(
        COD_DISCIPLINA disciplina.cod_disciplina%type,
        NOME_DISCIPLINA disciplina.nome_disciplina%type,
        NOME_PROFESSOR professor.nome_professor%type);
    v_disciplina t_DisciplinaRecord;
    
BEGIN
    SELECT d.cod_disciplina, p.NOME_PROFESSOR, d.NOME_DISCIPLINA 
    INTO v_disciplina
    FROM disciplina d JOIN professor p ON p.id_professor = d.id_professor
    WHERE d.cod_disciplina = 'BD1';
    
    DBMS_OUTPUT.PUT_LINE('CODIGO: ' || v_disciplina.COD_DISCIPLINA);
    DBMS_OUTPUT.PUT_LINE('NOME DISCIPLINA: ' || v_disciplina.NOME_DISCIPLINA);
    DBMS_OUTPUT.PUT_LINE('NOME PROFESSOR: ' || v_disciplina.NOME_PROFESSOR);
END;