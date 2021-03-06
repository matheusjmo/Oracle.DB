-- DEREF
SELECT DEREF(P.SUPERVISOR) FROM TB_PROFESSOR P;

SELECT DEREF(P.SUPERVISOR).nome AS PROFESSOR_SUPERVISOR FROM TB_PROFESSOR P
WHERE P.SUPERVISOR IS NOT DANGLING;

SELECT DEREF(I.PROFESSOR).nome AS PROFESSOR_INSTRUTOR FROM TB_INSTRUI I;

SELECT DEREF(P.SUPERVISOR).nome AS GERENTE, P.NOME AS GERENCIADO 
FROM TB_PROFESSOR P;

--VALUE
SELECT VALUE(P) AS LISTA_PROFESSORES FROM TB_PROFESSOR P;
/

DECLARE
ESTUDANTE TP_ESTUDANTE;
INVESTIMENTO NUMBER;
BEGIN
    SELECT VALUE(E) INTO ESTUDANTE FROM TB_ESTUDANTE E WHERE E.MENSALIDADE = 500.00;
    INVESTIMENTO := ESTUDANTE.INVESTIMENTO();
    dbms_output.put_line(INVESTIMENTO);
END;
/

-- Consulta Varray
SELECT * FROM TABLE
(SELECT P.TELEFONES FROM TB_PROFESSOR P WHERE CPF = '11999999999');

-- Consulta Nested
SELECT * FROM TABLE
(SELECT P.MONITOR FROM TB_PROFESSOR P WHERE CPF = '10999999999');


-- retornar nome do professor, nome do curso e conjunto de monitores do professor
SELECT DEREF(I.CURSO).NOME AS CURSO_DO_PROFESSOR, 
/

SELECT DEREF(I.CURSO).NOME AS CURSO_DO_PROFESSOR, 
DEREF(I.PROFESSOR).nome AS PROFESSOR_INSTRUTOR,
DEREF(I.PROFESSOR).monitor AS MONITOR_AUXILIAR FROM TB_INSTRUI I;
/

