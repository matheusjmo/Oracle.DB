INSERT INTO TB_PROFESSOR VALUES(
    TP_PROFESSOR(
        '10999999999',
        'Valeria Times',
        TO_DATE('10/03/98', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '996566602'),
            TP_TELEFONE('82', '996566602')
        ),
        TP_ENDERECO(
            'Rua Federal',
            133,
            'recife',
            'PE',
            '52050135'
        ),
        'Professor Exatas',
        5000.00,
        1,
        (
            SELECT REF(P) FROM TB_PROFESSOR P WHERE PROFESSOR_ID =2 
        ),
        TP_NT_AUXILIARES(TP_MONITOR(1, 'Julia', 800.00, 30), TP_MONITOR(2, 'ruy', 800.00, 30))
    )
);
/

INSERT INTO TB_PROFESSOR VALUES(
    TP_PROFESSOR(
        '11999999999',
        'João Luiz',
        TO_DATE('10/03/90', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '986566602'),
            TP_TELEFONE('82', '986566602')
        ),
        TP_ENDERECO(
            'Rua Federal',
            100,
            'recife',
            'PE',
            '52050111'
        ),
        'Professor Exatas',
        5000.00,
        2,
        (
            SELECT REF(P) FROM TB_PROFESSOR P WHERE PROFESSOR_ID =1
        ),
        TP_NT_AUXILIARES(TP_MONITOR(3, 'ruy', 800.00, 30))
    )
);
/

--*********************************************************************************************************************************************************************
INSERT INTO TB_ESTUDANTE VALUES(
    TP_ESTUDANTE(
        '12999999999',
        'Matheus Oliveira',
        TO_DATE('10/03/98', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '996566603')
        ),
        TP_ENDERECO(
            'Rua Gildo Neto',
            135,
            'recife',
            'PE',
            '52050135'
        ),
        300.00,
        200.00
    )
);
/

INSERT INTO TB_ESTUDANTE VALUES(
    TP_ESTUDANTE(
        '13999999999',
        'Carlos Oliveira',
        TO_DATE('10/03/98', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '996566603')
        ),
        TP_ENDERECO(
            'Rua Gildo Neto',
            135,
            'recife',
            'PE',
            '52050135'
        ),
        500.00,
        0
    )
);
/

INSERT INTO TB_ESTUDANTE VALUES(
    TP_ESTUDANTE(
        '14999999999',
        'Antonio Oliveira',
        TO_DATE('10/03/98', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '996566603')
        ),
        TP_ENDERECO(
            'Rua Gildo Neto',
            135,
            'recife',
            'PE',
            '52050135'
        ),
        300.00,
        100.00
    )
);
/

INSERT INTO TB_ESTUDANTE VALUES(
    TP_ESTUDANTE(
        '1599999999',
        'Lucio Maia',
        TO_DATE('10/03/94', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '996566605')
        ),
        TP_ENDERECO(
            'Rua Gildo Neto',
            135,
            'recife',
            'PE',
            '52050135'
        ),
        300.00,
        300.00
    )
);
/

--*********************************************************************************************************************************************************************
INSERT INTO TB_CURSO VALUES(
    1,
    75,
    'Banco de dados'
);
/

INSERT INTO TB_CURSO VALUES(
    2,
    100,
    'Programacao C'
);
/

INSERT INTO TB_CURSO VALUES(
    3,
    150,
    'Programacao Java'
);
/

INSERT INTO TB_CURSO VALUES(
    4,
    200,
    'Programacao Python'
);
/

--*********************************************************************************************************************************************************************
INSERT INTO TB_INSTRUI VALUES(
    TP_INSTRUI(
    (SELECT REF(P) FROM TB_PROFESSOR P WHERE P.CPF = '10999999999'),
    (SELECT REF(E) FROM TB_ESTUDANTE E WHERE E.CPF = '12999999999'),
    (SELECT REF(C) FROM TB_CURSO C WHERE C.CURSO_ID = 1)
    )
);
/

INSERT INTO TB_INSTRUI VALUES(
    TP_INSTRUI(
    (SELECT REF(P) FROM TB_PROFESSOR P WHERE P.CPF = '11999999999'),
    (SELECT REF(E) FROM TB_ESTUDANTE E WHERE E.CPF = '13999999999'),
    (SELECT REF(C) FROM TB_CURSO C WHERE C.CURSO_ID = 2)
    )
);
/

INSERT INTO TB_INSTRUI VALUES(
    TP_INSTRUI(
    (SELECT REF(P) FROM TB_PROFESSOR P WHERE P.CPF = '11999999999'),
    (SELECT REF(E) FROM TB_ESTUDANTE E WHERE E.CPF = '14999999999'),
    (SELECT REF(C) FROM TB_CURSO C WHERE C.CURSO_ID = 3)
    )
);
/
