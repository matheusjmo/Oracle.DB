-- 1: RECORD
DECLARE
TYPE PESSOA IS RECORD
(
CPF VARCHAR2(11),
NOME VARCHAR2(50),
DATA_NASCIMENTO DATE
);

PESSOA_1 PESSOA;
PESSOA_2 PESSOA;

BEGIN
PESSOA_1.CPF := '11999999999';
PESSOA_1.NOME := 'Matheus Oliveira';
PESSOA_1.DATA_NASCIMENTO := TO_DATE ('10-MAR-1998');

PESSOA_2.CPF := '22999999999';
PESSOA_2.NOME := 'Andre luna';
PESSOA_2.DATA_NASCIMENTO := TO_DATE ('10-FEB-2000');

dbms_output.put_line('PESSOA 1 cpf : '|| PESSOA_1.CPF);
dbms_output.put_line('PESSOA 1 nome : '|| PESSOA_1.NOME);
dbms_output.put_line('PESSOA 1 nascimento : '|| PESSOA_1.DATA_NASCIMENTO);

dbms_output.put_line('PESSOA 2 cpf : '|| PESSOA_2.CPF);
dbms_output.put_line('PESSOA 2 nome : '|| PESSOA_2.NOME);
dbms_output.put_line('PESSOA 2 nascimento : '|| PESSOA_2.DATA_NASCIMENTO);
END;


-- 2, 12: Tipo Table e ForLoop
DECLARE
    cur professor%ROWTYPE;
    CURSOR c_prf is SELECT * FROM professor;
    TYPE tabela IS TABLE OF VARCHAR(20);
    ta tabela := tabela('a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e');
    limite NUMBER := 10;
BEGIN
    OPEN c_prf;
    
    for m in 1..limite LOOP
        
        FETCH c_prf into cur;
        
        ta(m) := cur.cpf_professor;
        exit when c_prf%NOTFOUND;
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('1 - cpf: '|| ta(1));
    DBMS_OUTPUT.PUT_LINE('2 - cpf: '|| ta(2));
    DBMS_OUTPUT.PUT_LINE('3 - cpf: '|| ta(3));
    DBMS_OUTPUT.PUT_LINE('4 - cpf: '|| ta(4));
    DBMS_OUTPUT.PUT_LINE('5 - cpf: '|| ta(5));

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: acesso a memoria negado.');
END;


-- 3: Bloco anonimo
DECLARE
    V_CPF VARCHAR2(11);

BEGIN
    SELECT CPF INTO V_CPF
    FROM PESSOA
    WHERE NOME = 'Matheus Oliveira';

    DBMS_OUTPUT.PUT_LINE('CPF escolido: ' || V_CPF);
END;


-- 4: Create Procedure
CREATE OR REPLACE PROCEDURE AumentarSalario(prof_cargo IN VARCHAR2, prof_salario IN OUT NUMBER)
IS
BEGIN
    IF prof_cargo = 'Titular Exatas' THEN
        prof_salario := prof_salario + 1000;
    ELSIF prof_cargo = 'Titular Humanas' THEN
        prof_salario := prof_salario + 900;
    ELSE
        prof_salario := prof_salario + 750;
    END IF;

    COMMIT;
END AumentarSalario;


-- 5, 9, 14: Crate Function, Case When, Cursor
CREATE OR REPLACE FUNCTION AumentarSalarios
	(v_monitor monitor%ROWTYPE;)
RETURN NUMBER;
IS
    quantia_gasta NUMBER;
   	carga_horaria_monitor NUMBER;

    CURSOR c_monitor IS SELECT CARGA_HORARIA FROM MONITOR;
BEGIN
    OPEN c_monitor;
    for n in 1..5 LOOP
   
    	FETCH c_monitor INTO carga_horaria_monitor;
    
		exit when c_monitor%NOTFOUND;
	
	    CASE carga_horaria_monitor
	        WHEN '20' THEN
	            quantia_gasta := 100;
	        WHEN '30' THEN
	            quantia_gasta := 150;
	        ELSE
	        	quantia_gasta := 200;
	    END CASE;

    RETURN quantia_gasta;
END;


-- 6, 8, 13: Type, If Elsif, Select Into
DECLARE 
	V_PROFESSOR		PROFESSOR.CARGO%TYPE;
BEGIN
	SELECT SALARIO
	INTO V_PROFESSOR
	FROM PROFESSOR
	WHERE CODIGO_ID = 4;
	
	IF V_PROFESSOR < 5000 THEN 
	DBMS_OUTPUT.PUT_LINE('Auxiliar');
	ELSIF V_PROFESSOR = 5000 THEN
	DBMS_OUTPUT.PUT_LINE('Titular');
	ELSE
	DBMS_OUTPUT.PUT_LINE('Coordenador');
	END IF;
	
END;

-- 7, 15: Rowtype, Exception When
DECLARE 
	V_MONITOR		MONITOR%ROWTYPE;
BEGIN
	SELECT *
	INTO V_MONITOR
	FROM MONITOR
	WHERE MONITOR_ID = 4;
	
	DBMS_OUTPUT.PUT_LINE('Monitor ID: ' || V_MONITOR.MONITOR_ID);
	DBMS_OUTPUT.PUT_LINE('Nome: ' || V_MONITOR.NOME);
	DBMS_OUTPUT.PUT_LINE('Salario: ' || V_MONITOR.SALARIO);
	DBMS_OUTPUT.PUT_LINE('Cpf Professor Chefe: ' || V_MONITOR.CPF_PROFESSOR);
	
	EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('!!!Não há monitor com esse ID!!!');
END;

-- 10 Loop Exit When:
DECLARE 
	V_PROFESSOR	PROFESSOR%ROWTYPE;
BEGIN 	
  	WHILE V_PROFESSOR.CODIGO_ID < 10 LOOP
	  	SELECT *
		INTO V_PROFESSOR
		FROM PROFESSOR;
  		
		dbms_output.put_line('value of a: ' || V_PROFESSOR.CODIGO_ID);  
     	V_PROFESSOR.CODIGO_ID := V_PROFESSOR.CODIGO_ID + 1; 
     
   EXIT WHEN V_PROFESSOR.CODIGO_ID = 5; 
   END LOOP; 
END; 


-- 11: While Loop
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


-- 12: For Loop
DECLARE  
    cur professor%ROWTYPE;
    CURSOR c is SELECT * FROM professor;
    i number := 1;
    final number := 5;
BEGIN   

    OPEN c;
    for n in 1..final LOOP
        
        FETCH c into cur;
        
        exit when c%NOTFOUND;
        
        dbms_output.put_line(n || ' - cpf: '|| cur.CPF_PROFESSOR);
        dbms_output.put_line('    salário: '|| cur.SALARIO);
        
    END LOOP;
    
END;