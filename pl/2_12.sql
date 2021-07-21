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
