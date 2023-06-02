CREATE SEQUENCE sq_registros_logs
START WITH 1
INCREMENT BY 1
NOCYCLE;

CREATE OR REPLACE PROCEDURE pr_carga_inicial AS
v_cd_erro NUMBER;
v_ds_mensagem VARCHAR2(200);
BEGIN
  --Tabela fs_t_cliente
  BEGIN
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (1, '12345678901', 'João da Silva','DOADOR');

    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (2, '98765432109', 'Maria Santos','RECEPTOR');

    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (3, '45678912345', 'Pedro Souza','RECEPTOR');

    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (4, '78901234567', 'Ana Oliveira','DOADOR');

    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo,tp_cliente) 
    VALUES (5, '56789012345', 'Lucas Fernandes','DOADOR');
       
    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (6, '151.928.580-97', 'Fernanda Costa', 'RECEPTOR');

    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (7, '029.220.760-32', 'Ricardo Oliveira', 'DOADOR');

    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (8, '288.819.510-02', 'Camila Santos', 'RECEPTOR');

    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (9, '584.529.720-67', 'Gustavo Souza', 'RECEPTOR');

    INSERT INTO fs_t_cliente (id_cliente, nr_cpf, nm_completo, tp_cliente) 
    VALUES (10, '001.931.940-15', 'Juliana Borges', 'DOADOR');   
       
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      v_cd_erro := SQLCODE;
      v_ds_mensagem := SQLERRM;
    
    IF SQLCODE = -12899 THEN
      v_ds_mensagem := 'Valor muito grande para a coluna NR_CPF';
    END IF;
    
    INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
    VALUES (sq_registros_logs.NEXTVAL, USER, TO_CHAR(SYSTIMESTAMP, 'DD/MM/YYYY HH24:MI:SS'), v_cd_erro, v_ds_mensagem);
    

      -- Outro tratamento de exceção (2)
      WHEN DUP_VAL_ON_INDEX THEN
        v_cd_erro := SQLCODE;
        v_ds_mensagem := SQLERRM;
        INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
        VALUES (sq_registros_logs.NEXTVAL, USER, TO_CHAR(SYSTIMESTAMP, 'DD/MM/YYYY HH24:MI:SS'), v_cd_erro, v_ds_mensagem);
        
      ROLLBACK;
  END;
  
  -- Tabela fs_t_usuario
  BEGIN
    
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (1, 1, 'joao.silva@gmail.com', 'jo9090', TO_DATE(SYSDATE, 'DD/MM/YYYY'));

    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (2, 2, 'maria.santos@yahoo.com', 'maria3992', TO_DATE(SYSDATE, 'DD/MM/YYYY'));

    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (3, 3, 'pedro.souza@hotmail.com', 'pedrinho213', TO_DATE(SYSDATE, 'DD/MM/YYYY'));

    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (4, 4, 'ana.oliveira@gmail.com', 'ana1234', TO_DATE(SYSDATE, 'DD/MM/YYYY'));

    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (5, 5, 'lucas.fernandes@gmail.com', 'slucass23', TO_DATE(SYSDATE, 'DD/MM/YYYY'));
    
    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (6, 6, 'fernanda.costa@outlook.com', 'fernad231', TO_DATE('19/01/2023', 'DD/MM/YYYY'));

    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (7, 7, 'ricardo.oliveira@gmail.com', 's3231a456', TO_DATE('01/06/2023', 'DD/MM/YYYY'));

    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (8, 8, 'camila.santos@hotmail.com', 'sen2789', TO_DATE('11/04/2023', 'DD/MM/YYYY'));

    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (9, 9, 'gustavo.souza@yahoo.com', 'gustabc', TO_DATE('01/05/2023', 'DD/MM/YYYY'));

    INSERT INTO fs_t_usuario (id_usuario, id_cliente, ds_email, ds_senha, dt_acesso)
    VALUES (10, 10, 'juliana.fernandes@gmail.com', 'sen32def', TO_DATE('01/04/2023', 'DD/MM/YYYY'));

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      v_cd_erro := SQLCODE;
      v_ds_mensagem := SQLERRM;

      INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
      VALUES (sq_registros_logs.NEXTVAL, USER, TO_CHAR(SYSTIMESTAMP, 'DD/MM/YYYY HH24:MI:SS') , v_cd_erro, v_ds_mensagem);
      
      -- Outro tratamento de exceção (1)

      
      -- Outro tratamento de exceção (2)
      ROLLBACK;
  END;

  -- Tabela fs_t_endereco
  BEGIN
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (1, 1, '01531-001', 'Aclimação', 'Avenida da Aclimação', '123', null, 'São Paulo', 'São Paulo', 'SP', '123.456789', '987.654321');

    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (2, 2, '06053-900', 'Jaguaribe', 'Avenida Flora', '1177', null, 'Osasco', 'São Paulo', 'SP', '987.654321', '123.456789');

    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (3, 3, '06440-300', 'Aldeia', 'Avenida dos Jesuítas', '789', null, 'São Paulo', 'São Paulo', 'SP', '456.789123', '321.654987');

    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (4, 4, '15825-150', 'Paraíso', 'Rua Amapá', '47', null, 'São Paulo', 'São Paulo', 'SP', '789.013545', '335.179901');

    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (5, 5, '06050-300', 'Jaguaribe', 'Avenida José Júlio', '541', 'bl 1 apt 63', 'Osasco', 'São Paulo', 'SP', '177.890123', '901.234567');
    
    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (6, 6, '04001-000', 'Bela Vista', 'Avenida Paulista', '1000', 'apt 501', 'São Paulo', 'São Paulo', 'SP', '-23.565432', '-46.652789');

    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (7, 7, '07020-000', 'Centro', 'Praça Tereza Cristina', '10', null, 'Guarulhos', 'São Paulo', 'SP', '-23.459876', '-46.532187');

    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (8, 8, '09015-510', 'Centro', 'Rua Senador Fláquer', '123', 'apt 301', 'Santo André', 'São Paulo', 'SP', '-23.660987', '-46.541234');

    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (9, 9, '06110-260', 'Jardim das Flores', 'Rua Aurora Soares Barbosa', '456', null, 'Osasco', 'São Paulo', 'SP', '-23.533217', '-46.789012');

    INSERT INTO fs_t_endereco (id_endereco, id_cliente, nr_cep, ds_bairro, ds_logradouro, nr_logradouro, ds_complemento, nm_cidade, ds_estado, sg_estado, nr_latitude, nr_longitude)
    VALUES (10, 10, '09780-300', 'Centro', 'Avenida Getúlio Vargas', '789', null, 'São Bernardo do Campo', 'São Paulo', 'SP', '-23.709876', '-46.547654');
    
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      v_cd_erro := SQLCODE;
      v_ds_mensagem := SQLERRM;

      INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
      VALUES (sq_registros_logs.NEXTVAL, USER, TO_CHAR(SYSTIMESTAMP, 'DD/MM/YYYY HH24:MI:SS') , v_cd_erro, v_ds_mensagem);
      
      -- Outro tratamento de exceção (1)
      
      -- Outro tratamento de exceção (2)
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
    WHEN OTHERS THEN
      v_cd_erro := SQLCODE;
      v_ds_mensagem := SQLERRM;

      INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
      VALUES (sq_registros_logs.NEXTVAL, USER, TO_CHAR(SYSTIMESTAMP, 'DD/MM/YYYY HH24:MI:SS'), v_cd_erro, v_ds_mensagem);
      
      -- Outro tratamento de exceção (1)
      
      -- Outro tratamento de exceção (2)
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
    WHEN OTHERS THEN
      v_cd_erro := SQLCODE;
      v_ds_mensagem := SQLERRM;

      INSERT INTO t_registros_logs (id_log_erro, nm_usuario, dt_ocorrencia, cd_erro, ds_mensagem)
      VALUES (sq_registros_logs.NEXTVAL, USER, TO_CHAR(SYSTIMESTAMP, 'DD/MM/YYYY HH24:MI:SS') , v_cd_erro, v_ds_mensagem);
      
      -- Outro tratamento de exceção (1)
      
      -- Outro tratamento de exceção (2)
  END;
  
END;
/

set SERVEROUTPUT on

exec pr_carga_inicial;

select * from t_registros_logs;
select * from fs_t_usuario;
select * from fs_t_cliente;

select * from fs_t_doador;
select * from fs_t_receptor

TRUNCATE TABLE t_registros_logs;



