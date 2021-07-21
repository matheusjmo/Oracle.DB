CREATE OR REPLACE FUNCTION AumentarSalarios
	(salario_monitor MONITOR.SALARIO%TYPE)
RETURN NUMBER
IS
    quantia_gasta NUMBER;
   	carga_horaria_monitor NUMBER;

    CURSOR c_monitor IS
        SELECT CARGA_HORARIA
        FROM MONITOR;
BEGIN
    OPEN c_monitor;
    FETCH c_monitor INTO carga_horaria_monitor;
    CLOSE c_monitor;

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