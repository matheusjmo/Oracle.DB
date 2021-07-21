-- classifica o salario do professor 
DECLARE 
    salario_prof NUMBER(8,2);
    classificacao_salario VARCHAR2(50);

    CURSOR c_salario IS
        SELECT PR.SALARIO
        FROM PROFESSOR PR;
BEGIN  
    OPEN c_salario;
    FETCH c_salario INTO salario_prof;

    WHILE c_salario%FOUND
    LOOP
      FETCH c_salario INTO salario_prof;
      IF salario_prof <= 1000 THEN
          classificacao_salario := 'Baixo';
      ELSIF salario_prof > 1000 and salario_prof <= 2500 THEN
          classificacao_salario := 'Medio';
      ELSIF salario_prof > 2500 and salario_prof < 4000 THEN
          classificacao_salario := 'Acima da Media';
      ELSE
          classificacao_salario := 'Alto';
      END IF;

      DBMS_OUTPUT.PUT_LINE('Classificação de salario = ' || classificacao_salario);
    END LOOP;

    close c_salario; 

END;