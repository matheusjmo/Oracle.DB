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
