INSERT INTO TB_PROFESSOR VALUES(
    TP_PROFESSOR(
        '10999999999',
        'Veronica Lemos',
        TO_DATE('10/03/98', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '996566605'),
            TP_TELEFONE('82', '996566605')
        ),
        TP_ENDERECO(
            'Rua Federal',
            100,
            'recife',
            'PE',
            '52050135'
        ),
        'Professor Exatas',
        8000.00,
        1,
        (
            SELECT REF(P) FROM TB_PROFESSOR P WHERE PROFESSOR_ID =1 
        ),
        TP_NT_AUXILIARES(TP_MONITOR(1, 'Julia', 800.00, 30), TP_MONITOR(2, 'ruy', 600.00, 20))
    )
);
/

INSERT INTO TB_PROFESSOR VALUES(
    TP_PROFESSOR(
        '11999999999',
        'Jose Antonio',
        TO_DATE('10/03/85', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '986566601'),
            TP_TELEFONE('82', '986566601')
        ),
        TP_ENDERECO(
            'Rua Federal',
            101,
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
        TP_NT_AUXILIARES(TP_MONITOR(3, 'lucas', 1000.00, 30))
    )
);
/

INSERT INTO TB_PROFESSOR VALUES(
    TP_PROFESSOR(
        '12999999999',
        'Patricia Lemos',
        TO_DATE('10/03/95', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '986566602')
        ),
        TP_ENDERECO(
            'Rua Federal',
            102,
            'recife',
            'PE',
            '52050111'
        ),
        'Professor de Programacao',
        5000.00,
        3,
        (
            SELECT REF(P) FROM TB_PROFESSOR P WHERE PROFESSOR_ID =2
        ),
        NULL
    )
);
/

INSERT INTO TB_PROFESSOR VALUES(
    TP_PROFESSOR(
        '13999999999',
        'Francisco Neto',
        TO_DATE('10/03/90', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('81', '986566605')
        ),
        TP_ENDERECO(
            'Rua Federal',
            103,
            'recife',
            'PE',
            '52050111'
        ),
        'Professor de Programacao',
        3000.00,
        4,
        (
            SELECT REF(P) FROM TB_PROFESSOR P WHERE PROFESSOR_ID =3
        ),
        NULL
    )
);
/
/*UPDATE TB_PROFESSOR
SET SUPERVISOR = (SELECT REF(P) FROM TB_PROFESSOR P WHERE PROFESSOR_ID =4)
WHERE SUPERVISOR IS NULL;
/
*/

--*********************************************************************************************************************************************************************
INSERT INTO TB_ESTUDANTE VALUES(
    TP_ESTUDANTE(
        '14999999999',
        'Matheus',
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
        '15999999999',
        'Alexandre',
        TO_DATE('10/12/98', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('91', '996566603')
        ),
        TP_ENDERECO(
            'Rua do Teste',
            140,
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
        '16999999999',
        'Antonio',
        TO_DATE('25/03/98', 'DD/MM/YY'),
        VA_FONES(
            TP_TELEFONE('91', '996566604')
        ),
        TP_ENDERECO(
            'Rua do Teste',
            140,
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
        '1799999999',
        'Lucio',
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
    (SELECT REF(E) FROM TB_ESTUDANTE E WHERE E.CPF = '14999999999'),
    (SELECT REF(C) FROM TB_CURSO C WHERE C.CURSO_ID = 1)
    )
);
/

INSERT INTO TB_INSTRUI VALUES(
    TP_INSTRUI(
    (SELECT REF(P) FROM TB_PROFESSOR P WHERE P.CPF = '11999999999'),
    (SELECT REF(E) FROM TB_ESTUDANTE E WHERE E.CPF = '15999999999'),
    (SELECT REF(C) FROM TB_CURSO C WHERE C.CURSO_ID = 2)
    )
);
/

INSERT INTO TB_INSTRUI VALUES(
    TP_INSTRUI(
    (SELECT REF(P) FROM TB_PROFESSOR P WHERE P.CPF = '12999999999'),
    (SELECT REF(E) FROM TB_ESTUDANTE E WHERE E.CPF = '16999999999'),
    (SELECT REF(C) FROM TB_CURSO C WHERE C.CURSO_ID = 3)
    )
);
/

INSERT INTO TB_INSTRUI VALUES(
    TP_INSTRUI(
    (SELECT REF(P) FROM TB_PROFESSOR P WHERE P.CPF = '12999999999'),
    (SELECT REF(E) FROM TB_ESTUDANTE E WHERE E.CPF = '17999999999'),
    (SELECT REF(C) FROM TB_CURSO C WHERE C.CURSO_ID = 3)
    )
);
/
