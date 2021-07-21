CREATE OR REPLACE PACKAGE monitores AS 

PROCEDURE insere_monitor
(
    cpf IN monitores.cpf_professor%TYPE,
    id IN monitores.monitor_id%TYPE,
    nome IN monitores.nome%TYPE,
    salario IN monitores.salario%TYPE,
    carga IN monitores.carga_horaria%TYPE
);

FUNCTION nome_monitor (nome IN VARCHAR2) RETURN VARCHAR2;

END monitores;