DECLARE
    V_CPF VARCHAR2(11);

BEGIN
    SELECT CPF INTO V_CPF
    FROM PESSOA
    WHERE NOME = 'Matheus Oliveira';

    DBMS_OUTPUT.PUT_LINE('CPF escolido: ' || V_CPF);
END;