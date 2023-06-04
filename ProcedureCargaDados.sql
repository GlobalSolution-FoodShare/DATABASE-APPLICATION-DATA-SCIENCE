set SERVEROUTPUT on
--APAGA FOODSHARE--

--CRIA FOODSHARE--

--DELETANDO SEQUENCES--
DROP SEQUENCE sq_registros_logs;

DROP SEQUENCE sq_fs_t_cliente;

DROP SEQUENCE sq_fs_t_usuario;

DROP SEQUENCE sq_fs_t_endereco;

DROP SEQUENCE sq_fs_t_doacao;

DROP SEQUENCE sq_fs_t_solicitacao;

DROP SEQUENCE sq_fs_t_produto;

DROP SEQUENCE sq_fs_t_solicitacao_produto;

DROP SEQUENCE sq_fs_t_feedback;


--CRIANDO SEQUENCES--
CREATE SEQUENCE sq_registros_logs
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sq_fs_t_cliente
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sq_fs_t_usuario
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sq_fs_t_endereco
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sq_fs_t_doacao
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sq_fs_t_solicitacao
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sq_fs_t_produto
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sq_fs_t_solicitacao_produto
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sq_fs_t_feedback
START WITH 1
INCREMENT BY 1;

--PROCEDURE DE CARGA INICIAL--
CREATE OR REPLACE PROCEDURE pr_carga_inicial AS
v_cd_erro NUMBER;
v_ds_mensagem VARCHAR2(200);
BEGIN
  --Tabela fs_t_cliente
  BEGIN
    --CLIENTE 1
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '12345678903', 'João da Silva','DOADOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'joao.silva@gmail.com', 'jo9090', TO_DATE(SYSDATE, 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL,sq_fs_t_cliente.CURRVAL, '01531-001', 'Aclimação', 'Avenida da Aclimação', '123', null, 'São Paulo', 'São Paulo', 'SP', 123.456789, 987.654321);

    --CLIENTE 2
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '98765432109', 'Maria Santos','RECEPTOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'maria.santos@yahoo.com', 'maria3992', TO_DATE(SYSDATE, 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, sq_fs_t_cliente.CURRVAL, '06053-900', 'Jaguaribe', 'Avenida Flora', '1177', null, 'Osasco', 'São Paulo', 'SP', 987.654321, 123.456789);

    --CLIENTE 3
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '45678912345', 'Pedro Souza','RECEPTOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'pedro.souza@hotmail.com', 'pedrinho213', TO_DATE(SYSDATE, 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, sq_fs_t_cliente.CURRVAL, '06440-300', 'Aldeia', 'Avenida dos Jesuítas', '789', null, 'São Paulo', 'São Paulo', 'SP', 456.789123, 321.654987);

    --CLIENTE 4
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '78901234567', 'Ana Oliveira','DOADOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'ana.oliveira@gmail.com', 'ana1234', TO_DATE(SYSDATE, 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, sq_fs_t_cliente.CURRVAL, '15825-150', 'Paraíso', 'Rua Amapá', '47', null, 'São Paulo', 'São Paulo', 'SP', 789.013545, 335.179901);

    --CLIENTE 5
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '56789012345', 'Lucas Fernandes','DOADOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'lucas.fernandes@gmail.com', 'slucass23', TO_DATE(SYSDATE, 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, sq_fs_t_cliente.CURRVAL, '06050-300', 'Jaguaribe', 'Avenida José Júlio', '541', 'bl 1 apt 63', 'Osasco', 'São Paulo', 'SP', 177.890123, 901.234567);
       
    --CLIENTE 6
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '151.928.580-97', 'Fernanda Costa', 'RECEPTOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'fernanda.costa@outlook.com', 'fernad231', TO_DATE('19/01/2023', 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, sq_fs_t_cliente.CURRVAL, '04001-000', 'Bela Vista', 'Avenida Paulista', '1000', 'apt 501', 'São Paulo', 'São Paulo', 'SP', -23.565432, -46.652789);

    --CLIENTE 7
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '029.220.760-32', 'Ricardo Oliveira', 'DOADOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'ricardo.oliveira@gmail.com', 's3231a456', TO_DATE('01/06/2023', 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, sq_fs_t_cliente.CURRVAL, '07020-000', 'Centro', 'Praça Tereza Cristina', '10', null, 'Guarulhos', 'São Paulo', 'SP', -23.459876, -46.532187);

    --CLIENTE 8 
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '288.819.510-02', 'Camila Santos', 'RECEPTOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'camila.santos@hotmail.com', 'sen2789', TO_DATE('11/04/2023', 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, sq_fs_t_cliente.CURRVAL, '09015-510', 'Centro', 'Rua Senador Fláquer', '123', 'apt 301', 'Santo André', 'São Paulo', 'SP', -23.660987, -46.541234);

    --CLIENTE 9
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '584.529.720-67', 'Gustavo Souza', 'RECEPTOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, sq_fs_t_cliente.CURRVAL, 'gustavo.souza@yahoo.com', 'gustabc', TO_DATE('01/05/2023', 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, sq_fs_t_cliente.CURRVAL, '06110-260', 'Jardim das Flores', 'Rua Aurora Soares Barbosa', '456', null, 'Osasco', 'São Paulo', 'SP', -23.533217, -46.789012);

    --CLIENTE 10
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (sq_fs_t_cliente.NEXTVAL, '001.931.940-15', 'Juliana Borges', 'DOADOR');
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (sq_fs_t_usuario.NEXTVAL, 10, 'juliana.fernandes@gmail.com', 'sen32def', TO_DATE('01/04/2023', 'DD/MM/YYYY'));
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (sq_fs_t_endereco.NEXTVAL, 10, '09780-300', 'Centro', 'Avenida Getúlio Vargas', '789', null, 'São Bernardo do Campo', 'São Paulo', 'SP', -23.709876, -46.547654);
    
    COMMIT;
    EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            IF SQLCODE = -12899 THEN
                v_ds_mensagem := 'Valor muito grande para a coluna';
            END IF;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
  END;
  
  -- Tabela fs_t_doador
  BEGIN
    
    INSERT INTO fs_t_doador (id_cliente)
    VALUES (1);
    
    INSERT INTO fs_t_doador (id_cliente)
    VALUES (4);
    
    INSERT INTO fs_t_doador (id_cliente)
    VALUES (5);
    
    INSERT INTO fs_t_doador (id_cliente)
    VALUES (7);
    
    INSERT INTO fs_t_doador (id_cliente)
    VALUES (10);
    
    COMMIT;
    EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
  END;
  
  -- Tabela fs_t_receptor
  BEGIN
    
    INSERT INTO fs_t_receptor (id_cliente)
    VALUES (2);
    
    INSERT INTO fs_t_receptor (id_cliente)
    VALUES (3);
    
    INSERT INTO fs_t_receptor (id_cliente)
    VALUES (6);
    
    INSERT INTO fs_t_receptor (id_cliente)
    VALUES (8);
    
    INSERT INTO fs_t_receptor (id_cliente)
    VALUES (9);
    
    COMMIT;
    EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
  END;
  
  BEGIN
    
    INSERT INTO fs_t_solicitacao (id_solicitacao, id_cliente, dt_solicitacao, st_solicitacao)
    VALUES (sq_fs_t_solicitacao.NEXTVAL, 2, SYSDATE, 'CONCLUIDO');

    INSERT INTO fs_t_solicitacao (id_solicitacao, id_cliente, dt_solicitacao, st_solicitacao)
    VALUES (sq_fs_t_solicitacao.NEXTVAL, 3, SYSDATE, 'CONCLUIDO');

    INSERT INTO fs_t_solicitacao (id_solicitacao, id_cliente, dt_solicitacao, st_solicitacao)
    VALUES (sq_fs_t_solicitacao.NEXTVAL, 6, SYSDATE, 'CONCLUIDO');

    INSERT INTO fs_t_solicitacao (id_solicitacao, id_cliente, dt_solicitacao, st_solicitacao)
    VALUES (sq_fs_t_solicitacao.NEXTVAL, 8, SYSDATE, 'CONCLUIDO');

    INSERT INTO fs_t_solicitacao (id_solicitacao, id_cliente, dt_solicitacao, st_solicitacao)
    VALUES (sq_fs_t_solicitacao.NEXTVAL, 9, SYSDATE, 'CONCLUIDO');
    
    COMMIT;
    EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
  END;
  BEGIN
    
    INSERT INTO fs_t_produto (id_produto, nm_produto, nr_peso, ds_produto)
    VALUES (sq_fs_t_produto.NEXTVAL, 'Arroz', 1000, 'Arroz branco, pacote de 1kg');

    INSERT INTO fs_t_produto (id_produto, nm_produto, nr_peso, ds_produto)
    VALUES (sq_fs_t_produto.NEXTVAL, 'Feijão', 1000, 'Feijão carioca, pacote de 1kg');

    INSERT INTO fs_t_produto (id_produto, nm_produto, nr_peso, ds_produto)
    VALUES (sq_fs_t_produto.NEXTVAL, 'Macarrão', 500, 'Macarrão espaguete, pacote de 500g');

    INSERT INTO fs_t_produto (id_produto, nm_produto, nr_peso, ds_produto)
    VALUES (sq_fs_t_produto.NEXTVAL, 'Leite', 1000, 'Leite integral, caixa de 1 litro');

    INSERT INTO fs_t_produto (id_produto, nm_produto, nr_peso, ds_produto)
    VALUES (sq_fs_t_produto.NEXTVAL, 'Óleo de Soja', 900, 'Óleo de soja, garrafa de 900ml');
    
    COMMIT;
     EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            IF SQLCODE = -12899 THEN
                v_ds_mensagem := 'Valor muito grande para a coluna';
            END IF;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
  END;
  
  BEGIN
    
    INSERT INTO fs_t_solicitacao_produto (id_solicitacao_produto, id_solicitacao, id_produto, qtd_produto)
    VALUES (sq_fs_t_solicitacao_produto.NEXTVAL, 1, 1, 10);

    INSERT INTO fs_t_solicitacao_produto (id_solicitacao_produto, id_solicitacao, id_produto, qtd_produto)
    VALUES (sq_fs_t_solicitacao_produto.NEXTVAL, 2, 2, 5);

    INSERT INTO fs_t_solicitacao_produto (id_solicitacao_produto, id_solicitacao, id_produto, qtd_produto)
    VALUES (sq_fs_t_solicitacao_produto.NEXTVAL, 3, 3, 3);

    INSERT INTO fs_t_solicitacao_produto (id_solicitacao_produto, id_solicitacao, id_produto, qtd_produto)
    VALUES (sq_fs_t_solicitacao_produto.NEXTVAL, 4, 1, 8);

    INSERT INTO fs_t_solicitacao_produto (id_solicitacao_produto, id_solicitacao, id_produto, qtd_produto)
    VALUES (sq_fs_t_solicitacao_produto.NEXTVAL, 5, 2, 12);
    
    COMMIT;
    EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
  END;
  
  BEGIN
    INSERT INTO fs_t_doacao (id_doacao, id_solicitacao_produto, id_cliente, dt_doacao, st_doacao)
    VALUES (sq_fs_t_doacao.NEXTVAL, 1, 1, SYSDATE, 'CONCLUIDO');

    INSERT INTO fs_t_doacao (id_doacao, id_solicitacao_produto, id_cliente, dt_doacao, st_doacao)
    VALUES (sq_fs_t_doacao.NEXTVAL, 2, 4, SYSDATE, 'CONCLUIDO');

    INSERT INTO fs_t_doacao (id_doacao, id_solicitacao_produto, id_cliente, dt_doacao, st_doacao)
    VALUES (sq_fs_t_doacao.NEXTVAL, 3, 5, SYSDATE, 'CONCLUIDO');

    INSERT INTO fs_t_doacao (id_doacao, id_solicitacao_produto, id_cliente, dt_doacao, st_doacao)
    VALUES (sq_fs_t_doacao.NEXTVAL, 4, 7, SYSDATE, 'CONCLUIDO');

    INSERT INTO fs_t_doacao (id_doacao, id_solicitacao_produto, id_cliente, dt_doacao, st_doacao)
    VALUES (sq_fs_t_doacao.NEXTVAL, 5, 10, SYSDATE, 'CONCLUIDO');

    COMMIT;
     EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
  END;
  
  BEGIN
    INSERT INTO fs_t_feedback (id_feedback, id_doacao, id_solicitacao, nr_nota, ds_feedback)
    VALUES (sq_fs_t_feedback.NEXTVAL, 1, 1, 5, 'Ótima experiência de doação.');

    INSERT INTO fs_t_feedback (id_feedback, id_doacao, id_solicitacao, nr_nota, ds_feedback)
    VALUES (sq_fs_t_feedback.NEXTVAL, 2, 2, 5, 'Doação bem-sucedida!');

    INSERT INTO fs_t_feedback (id_feedback, id_doacao, id_solicitacao, nr_nota, ds_feedback)
    VALUES (sq_fs_t_feedback.NEXTVAL, 3, 3, 4, 'Atraso na entrega dos produtos.');

    INSERT INTO fs_t_feedback (id_feedback, id_doacao, id_solicitacao, nr_nota, ds_feedback)
    VALUES (sq_fs_t_feedback.NEXTVAL, 4, 4, 5, 'Excelente atendimento e doação.');

    INSERT INTO fs_t_feedback (id_feedback, id_doacao, id_solicitacao, nr_nota, ds_feedback)
    VALUES (sq_fs_t_feedback.NEXTVAL, 5, 5, 3, 'Problemas na embalagem dos produtos.');
    
    COMMIT;
     EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            IF SQLCODE = -12899 THEN
                v_ds_mensagem := 'Valor muito grande para a coluna';
            END IF;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
  END;
  
  EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN VALUE_ERROR THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
        WHEN OTHERS THEN
        ROLLBACK;
            v_cd_erro := SQLCODE;
            v_ds_mensagem := SQLERRM;
            IF SQLCODE = -12899 THEN
                v_ds_mensagem := 'Valor muito grande para a coluna';
            END IF;
            INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
            VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE , v_cd_erro, v_ds_mensagem);
END;
/

exec pr_carga_inicial;

--LISTA PARA VALIDAR ENTRA DE DADOS
select * from t_registros_logs ORDER BY ID_LOG_ERRO DESC;
select * from fs_t_usuario;
select * from fs_t_cliente;
select * from fs_t_endereco;
select * from fs_t_doador;
select * from fs_t_receptor;
select * from fs_t_solicitacao;
select * from fs_t_produto;
select * from fs_t_solicitacao_produto;
select * from fs_t_doacao;
select * from fs_t_feedback;

--ZERANDO DADOS TABELAS--
TRUNCATE TABLE fs_t_doador;
TRUNCATE TABLE fs_t_receptor;
TRUNCATE TABLE fs_t_usuario;
TRUNCATE TABLE fs_t_endereco;
TRUNCATE TABLE fs_t_cliente;
TRUNCATE TABLE t_registros_logs;

--PROCEDURES DE IMPLMENTAÇÃO--
CREATE OR REPLACE PROCEDURE pr_insere_cliente_doador_receptor(pr_id_cliente in fs_t_cliente.id_cliente%type) AS
begin
    declare  
        cursor c_cliente_encontrado is
        select id_cliente, tp_cliente into v_id_cliente,v_id_tp_cliente 
        from fs_t_cliente where id_cliente = pr_id_cliente;
        v_id_cliente fs_t_cliente.id_cliente%TYPE;
        v_id_tp_cliente fs_t_cliente.tp_cliente%TYPE;
    begin
        open c_cliente_encontrado;
        
        fetch c_cliente_encontrado into v_id_cliente, v_id_tp_cliente;
        
        if v_id_tp_cliente = 'RECEPTOR' and v_id_cliente is not null then
            update fs_t_receptor set id_cliente = v_id_cliente;
        elsif v_id_tp_cliente = 'DOADOR' and v_id_cliente is not null then
            update fs_t_doador set id_cliente = v_id_cliente;
        else
            raise_application_error(-20005, 'Cliente não encontrado ou tipo de cliente inválido.');
        end if;
        
        if sql%rowcount > 0 then
            DBMS_OUTPUT.PUT_LINE('Cliente inserido com sucesso.');
        else
           DBMS_OUTPUT.PUT_LINE('Nenhuma alteração realizada'); 
        end if;
        
        close c_cliente_encontrado;
    end;
    exception 
        when NO_DATA_FOUND then 
            DBMS_OUTPUT.PUT_LINE('Nenhum cliente encontrado.');
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir o cliente: ' || SQLERRM);
end;
/

CREATE OR REPLACE PROCEDURE pr_buscar_clientes_proximos(
    pr_latitude IN FS_T_ENDERECO.NR_LATITUDE%TYPE,
    pr_longitude IN FS_T_ENDERECO.NR_LONGITUDE%TYPE,
    pr_raio IN NUMBER
)
IS
    v_cd_erro NUMBER;
    v_ds_mensagem VARCHAR2(200);
    BEGIN
    
    SELECT c.*
    FROM fs_t_cliente c
    INNER JOIN fs_t_endereco e ON c.id_cliente = e.id_cliente
    WHERE 6371 * 2 * ACOS(
        SIN((pr_latitude * 3.141592653589793) / 180) * SIN((e.nr_latitude * 3.141592653589793) / 180) +
        COS((pr_latitude * 3.141592653589793) / 180) * COS((e.nr_latitude * 3.141592653589793) / 180) *
        COS(((pr_longitude - e.nr_longitude) * 3.141592653589793) / 180)
    ) <= pr_raio;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_cd_erro := SQLCODE;
        v_ds_mensagem := SQLERRM;
        INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
        VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
    WHEN OTHERS THEN
        v_cd_erro := SQLCODE;
        v_ds_mensagem := SQLERRM;
        INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
        VALUES (sq_registros_logs.NEXTVAL, USER, SYSDATE, v_cd_erro, v_ds_mensagem);
END;
/

