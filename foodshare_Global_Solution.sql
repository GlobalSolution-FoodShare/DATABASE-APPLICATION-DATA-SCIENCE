--------APAGA FOODSHARE--------

DROP TABLE fs_t_cliente CASCADE CONSTRAINTS;

DROP TABLE fs_t_doacao CASCADE CONSTRAINTS;

DROP TABLE fs_t_doador CASCADE CONSTRAINTS;

DROP TABLE fs_t_endereco CASCADE CONSTRAINTS;

DROP TABLE fs_t_feedback CASCADE CONSTRAINTS;

DROP TABLE fs_t_produto CASCADE CONSTRAINTS;

DROP TABLE fs_t_receptor CASCADE CONSTRAINTS;

DROP TABLE fs_t_solicitacao CASCADE CONSTRAINTS;

DROP TABLE fs_t_solicitacao_produto CASCADE CONSTRAINTS;

DROP TABLE fs_t_usuario CASCADE CONSTRAINTS;

--------CRIA REGISTRO DE LOGS--------

DROP TABLE t_registros_logs CASCADE CONSTRAINTS;


CREATE TABLE t_registros_logs (
    id_log_erro  NUMBER(9) NOT NULL,
    nm_usuario VARCHAR(50) NOT NULL,
    dt_ocorrencia    DATE NOT NULL,
    cd_erro   NUMBER(9) NOT NULL,
    ds_mensagem VARCHAR(200) NOT NULL
);

ALTER TABLE t_registros_logs ADD CONSTRAINT t_registros_logs_pk PRIMARY KEY ( id_log_erro );

--------CRIA FOODSHARE--------

CREATE TABLE fs_t_cliente (
    id_cliente   NUMBER(9) NOT NULL,
    nr_cpf       VARCHAR2(14) NOT NULL,
    nm_completo  VARCHAR2(90) NOT NULL
);

COMMENT ON COLUMN fs_t_cliente.id_cliente IS
    'Esse atributo ir� receber a chave prim�ria do cliente , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_cliente.nr_cpf IS
    'Esse atributo ir� receber o CPF do cliente.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_cliente.nm_completo IS
    'Esse atributo ir� receber o nome completo  do cliente.Seu conte�do � obrigat�rio.';

ALTER TABLE fs_t_cliente ADD CONSTRAINT fs_t_cliente_pk PRIMARY KEY ( id_cliente );

ALTER TABLE fs_t_cliente ADD CONSTRAINT fs_t_cliente_nr_cpf_un UNIQUE ( nr_cpf );

CREATE TABLE fs_t_doacao (
    id_doacao               NUMBER(9) NOT NULL,
    id_solicitacao_produto  NUMBER(9) NOT NULL,
    id_cliente              NUMBER(9) NOT NULL,
    dt_doacao               DATE NOT NULL,
    st_doacao               VARCHAR2(50) NOT NULL
);

ALTER TABLE fs_t_doacao
    ADD CHECK ( st_doacao IN (
        'AGUARDANDO',
        'CANCELADO',
        'CONCLUIDO'
    ) );

COMMENT ON COLUMN fs_t_doacao.id_doacao IS
    'Esse atributo ir� receber a chave prim�ria da doa��o, gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_doacao.id_solicitacao_produto IS
    'Esse atributo ir� receber a chave prim�ria da solicita��o do pedido , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_doacao.id_cliente IS
    'Esse atributo ir� receber a chave prim�ria do cliente , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_doacao.dt_doacao IS
    'Esse atributo ir� receber a data da doa��o, gerada autom�ticamente pelo sistema.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_doacao.st_doacao IS
    'Esse atributo ir� receber o status da doa��o.Seu conte�do � obrigat�rio.';

CREATE UNIQUE INDEX fs_t_doacao_sol_prod_idx ON
    fs_t_doacao (
        id_solicitacao_produto
    ASC );

CREATE INDEX fs_t_doacao_cliente_idx ON
    fs_t_doacao (
        id_cliente
    ASC );

ALTER TABLE fs_t_doacao ADD CONSTRAINT fs_t_doacao_pk PRIMARY KEY ( id_doacao );

CREATE TABLE fs_t_doador (
    id_cliente NUMBER(9) NOT NULL
);

COMMENT ON COLUMN fs_t_doador.id_cliente IS
    'Esse atributo ir� receber a chave prim�ria do cliente , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

CREATE INDEX fs_t_doador__idx ON
    fs_t_doador (
        id_cliente
    ASC );

ALTER TABLE fs_t_doador ADD CONSTRAINT fs_t_doador_pk PRIMARY KEY ( id_cliente );

CREATE TABLE fs_t_endereco (
    id_endereco     NUMBER(9) NOT NULL,
    id_cliente      NUMBER(9) NOT NULL,
    nr_cep          VARCHAR2(14),
    ds_bairro       VARCHAR2(60) NOT NULL,
    ds_logradouro   VARCHAR2(90) NOT NULL,
    nr_logradouro   VARCHAR2(5) NOT NULL,
    ds_complemento  VARCHAR2(30),
    nm_cidade       VARCHAR2(30) NOT NULL,
    ds_estado       VARCHAR2(60) NOT NULL,
    sg_estado       CHAR(2) NOT NULL,
    nr_latitude     VARCHAR2(50) NOT NULL,
    nr_longitude    VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN fs_t_endereco.id_endereco IS
    'Esse atributo ir� receber a chave prim�ria do endere�o do cliente, gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.id_cliente IS
    'Esse atributo ir� receber a chave prim�ria do cliente , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.nr_cep IS
    'Esse atributo ir� receber o CEP do endere�o do cliente.Seu conte�do � opcional.';

COMMENT ON COLUMN fs_t_endereco.ds_bairro IS
    'Esse atributo ir� receber o bairro do endere�o do cliente.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.ds_logradouro IS
    'Esse atributo ir� receber o logradouro do endere�o do cliente.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.nr_logradouro IS
    'Esse atributo ir� receber o n�mero do logradourodo  endere�o do cliente.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.ds_complemento IS
    'Esse atributo ir� receber o complemento  do endere�o do cliente.Seu conte�do � opcional.';

COMMENT ON COLUMN fs_t_endereco.nm_cidade IS
    'Esse atributo ir� receber a cidade do endere�o do cliente.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.ds_estado IS
    'Esse atributo ir� receber o estado do endere�o do cliente.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.sg_estado IS
    'Esse atributo ir� receber a sigla do estado do endere�o do cliente.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.nr_latitude IS
    'Esse atributo ir� receber o n�mero da latitude  do endere�o do cliente.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_endereco.nr_longitude IS
    'Esse atributo ir� receber o n�mero da longitute do endere�o do cliente.Seu conte�do � obrigat�rio.';

CREATE UNIQUE INDEX fs_t_endereco__idx ON
    fs_t_endereco (
        id_cliente
    ASC );

ALTER TABLE fs_t_endereco ADD CONSTRAINT fs_t_endereco_pk PRIMARY KEY ( id_endereco );

CREATE TABLE fs_t_feedback (
    id_feedback     NUMBER(9) NOT NULL,
    id_doacao       NUMBER(9) NOT NULL,
    id_solicitacao  NUMBER(9) NOT NULL,
    nr_nota         NUMBER(1) NOT NULL,
    ds_feedback     VARCHAR2(255)
);

COMMENT ON COLUMN fs_t_feedback.id_feedback IS
    'Esse atributo ir� receber a chave prim�ria do feedback, gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_feedback.id_doacao IS
    'Esse atributo ir� receber a chave prim�ria da doa��o, gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_feedback.id_solicitacao IS
    'Esse atributo ir� receber a chave prim�ria da solicita��o , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_feedback.nr_nota IS
    'Esse atributo ir� receber a nota da doa��o.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_feedback.ds_feedback IS
    'Esse atributo ir� receber a descri��o do feedback.Seu conte�do � opcional.';

CREATE UNIQUE INDEX fs_t_feedback_doacao_idx ON
    fs_t_feedback (
        id_doacao
    ASC );

CREATE UNIQUE INDEX fs_t_feedback_solicitacao_idx ON
    fs_t_feedback (
        id_solicitacao
    ASC );

ALTER TABLE fs_t_feedback ADD CONSTRAINT fs_t_feedback_pk PRIMARY KEY ( id_feedback );

CREATE TABLE fs_t_produto (
    id_produto  NUMBER(9) NOT NULL,
    nm_produto  VARCHAR2(60) NOT NULL,
    nr_peso     NUMBER(4) NOT NULL,
    ds_produto  VARCHAR2(90)
);

COMMENT ON COLUMN fs_t_produto.id_produto IS
    'Esse atributo ir� receber a chave prim�ria do produto , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_produto.nm_produto IS
    'Esse atributo ir� receber o nome do produto.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_produto.nr_peso IS
    'Esse atributo ir� receber o peso do produto.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_produto.ds_produto IS
    'Esse atributo ir� receber a descri��o  do produto.Seu conte�do � opcional.';

ALTER TABLE fs_t_produto ADD CONSTRAINT fs_t_produto_pk PRIMARY KEY ( id_produto );

CREATE TABLE fs_t_receptor (
    id_cliente NUMBER(9) NOT NULL
);

COMMENT ON COLUMN fs_t_receptor.id_cliente IS
    'Esse atributo ir� receber a chave prim�ria do cliente , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

CREATE INDEX fs_t_receptor__idx ON
    fs_t_receptor (
        id_cliente
    ASC );

ALTER TABLE fs_t_receptor ADD CONSTRAINT fs_t_receptor_pk PRIMARY KEY ( id_cliente );

CREATE TABLE fs_t_solicitacao (
    id_solicitacao  NUMBER(9) NOT NULL,
    id_cliente      NUMBER(9) NOT NULL,
    dt_solicitacao  DATE NOT NULL,
    st_solicitacao  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN fs_t_solicitacao.id_solicitacao IS
    'Esse atributo ir� receber a chave prim�ria da solicita��o , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_solicitacao.id_cliente IS
    'Esse atributo ir� receber a chave prim�ria do cliente , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_solicitacao.dt_solicitacao IS
    'Esse atributo ir� receber a data da solicita��o, gerada autom�ticamente pelo sistema.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_solicitacao.st_solicitacao IS
    'Esse atributo ir� receber o status da solicita��o.Seu conte�do � obrigat�rio.';

CREATE INDEX fs_t_solicitacao_cliente_idx ON
    fs_t_solicitacao (
        id_cliente
    ASC );

ALTER TABLE fs_t_solicitacao ADD CONSTRAINT fs_t_solicitacao_pk PRIMARY KEY ( id_solicitacao );

CREATE TABLE fs_t_solicitacao_produto (
    id_solicitacao_produto  NUMBER(9) NOT NULL,
    id_solicitacao          NUMBER(9) NOT NULL,
    id_produto              NUMBER(9) NOT NULL,
    qtd_produto             NUMBER NOT NULL
);

COMMENT ON COLUMN fs_t_solicitacao_produto.id_solicitacao_produto IS
    'Esse atributo ir� receber a chave prim�ria da solicita��o do pedido , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_solicitacao_produto.id_solicitacao IS
    'Esse atributo ir� receber a chave prim�ria da solicita��o , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_solicitacao_produto.id_produto IS
    'Esse atributo ir� receber a chave prim�ria do produto , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_solicitacao_produto.qtd_produto IS
    'Esse atributo ir� receber a quantidade  de produtos.Seu conte�do � obrigat�rio.';

CREATE INDEX fs_t_solic_prod_sol_idx ON
    fs_t_solicitacao_produto (
        id_solicitacao
    ASC );

CREATE INDEX fs_t_solic_prod_prod_idx ON
    fs_t_solicitacao_produto (
        id_produto
    ASC );

ALTER TABLE fs_t_solicitacao_produto ADD CONSTRAINT fs_t_solicitacao_produto_pk PRIMARY KEY ( id_solicitacao_produto );

CREATE TABLE fs_t_usuario (
    id_usuario  NUMBER(9) NOT NULL,
    id_cliente  NUMBER(9) NOT NULL,
    ds_email    VARCHAR2(30) NOT NULL,
    ds_senha    VARCHAR2(50) NOT NULL,
    dt_acesso   DATE NOT NULL
);

COMMENT ON COLUMN fs_t_usuario.id_usuario IS
    'Esse atributo ir� receber a chave prim�ria do usuario , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_usuario.id_cliente IS
    'Esse atributo ir� receber a chave prim�ria do cliente , gerada autom�ticamente. Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_usuario.ds_email IS
    'Esse atributo ir� receber o e-mail do usu�rio.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_usuario.ds_senha IS
    'Esse atributo ir� receber a senha do usu�rio.Seu conte�do � obrigat�rio.';

COMMENT ON COLUMN fs_t_usuario.dt_acesso IS
    'Esse atributo ir� receber a data de acesso so usu�rio, gerada autom�ticamente pelo sistema.Seu conte�do � obrigat�rio.';

CREATE UNIQUE INDEX fs_t_usuario__idx ON
    fs_t_usuario (
        id_cliente
    ASC );

ALTER TABLE fs_t_usuario ADD CONSTRAINT fs_t_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE fs_t_usuario ADD CONSTRAINT fs_t_usuario_ds_email_un UNIQUE ( ds_email );

ALTER TABLE fs_t_doacao
    ADD CONSTRAINT fs_t_doacao_doador_fk FOREIGN KEY ( id_cliente )
        REFERENCES fs_t_doador ( id_cliente );

ALTER TABLE fs_t_doacao
    ADD CONSTRAINT fs_t_doacao_sol_prod_fk FOREIGN KEY ( id_solicitacao_produto )
        REFERENCES fs_t_solicitacao_produto ( id_solicitacao_produto );

ALTER TABLE fs_t_doador
    ADD CONSTRAINT fs_t_doador_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES fs_t_cliente ( id_cliente );

ALTER TABLE fs_t_endereco
    ADD CONSTRAINT fs_t_endereco_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES fs_t_cliente ( id_cliente );

ALTER TABLE fs_t_feedback
    ADD CONSTRAINT fs_t_feedback_doacao_fk FOREIGN KEY ( id_doacao )
        REFERENCES fs_t_doacao ( id_doacao );

ALTER TABLE fs_t_feedback
    ADD CONSTRAINT fs_t_feedback_solicitacao_fk FOREIGN KEY ( id_solicitacao )
        REFERENCES fs_t_solicitacao ( id_solicitacao );

ALTER TABLE fs_t_receptor
    ADD CONSTRAINT fs_t_receptor_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES fs_t_cliente ( id_cliente );

ALTER TABLE fs_t_solicitacao_produto
    ADD CONSTRAINT fs_t_sol_prod_produto_fk FOREIGN KEY ( id_produto )
        REFERENCES fs_t_produto ( id_produto );

ALTER TABLE fs_t_solicitacao_produto
    ADD CONSTRAINT fs_t_sol_prod_solicitacao_fk FOREIGN KEY ( id_solicitacao )
        REFERENCES fs_t_solicitacao ( id_solicitacao );

ALTER TABLE fs_t_solicitacao
    ADD CONSTRAINT fs_t_solicitacao_receptor_fk FOREIGN KEY ( id_cliente )
        REFERENCES fs_t_receptor ( id_cliente );

ALTER TABLE fs_t_usuario
    ADD CONSTRAINT fs_t_usuario_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES fs_t_cliente ( id_cliente );

CREATE OR REPLACE TRIGGER arc_hr_cliente_fs_t_receptor BEFORE
    INSERT OR UPDATE OF id_cliente ON fs_t_receptor
    FOR EACH ROW
DECLARE
    d NUMBER(9);
BEGIN
    SELECT
        a.id_cliente
    INTO d
    FROM
        fs_t_cliente a
    WHERE
        a.id_cliente = :new.id_cliente;

    IF ( d IS NULL OR d <> 'RECEPTOR' ) THEN
        raise_application_error(-20223, 'FK FS_T_RECEPTOR_CLIENTE_FK in Table FS_T_RECEPTOR violates Arc constraint on Table FS_T_CLIENTE - discriminator column ID_CLIENTE doesn''t have value RECEPTOR');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_hr_cliente_fs_t_doador BEFORE
    INSERT OR UPDATE OF id_cliente ON fs_t_doador
    FOR EACH ROW
DECLARE
    d NUMBER(9);
BEGIN
    SELECT
        a.id_cliente
    INTO d
    FROM
        fs_t_cliente a
    WHERE
        a.id_cliente = :new.id_cliente;

    IF ( d IS NULL OR d <> 'DOADOR' ) THEN
        raise_application_error(-20223, 'FK FS_T_DOADOR_CLIENTE_FK in Table FS_T_DOADOR violates Arc constraint on Table FS_T_CLIENTE - discriminator column ID_CLIENTE doesn''t have value DOADOR');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



-- Relat�rio do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                            11
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
