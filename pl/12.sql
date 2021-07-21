
-- imprime o cpf e o salario dos 10 primeiros professores cadastrados, caso existam.
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