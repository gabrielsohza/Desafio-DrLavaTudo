-- Uma alternativa seria fazer outra table para os servicos que cada ordem contem. 
-- A table das ordens conteria apenas o ID do cliente, as datas, e a quantidade de servicos. Assim:

CREATE TABLE clientes (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  email VARCHAR(255),
  data_nascimento DATE,
  tel_cel INTEGER,
  tel_res INTEGER);
  
CREATE TABLE servicos (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  valor_final REAL);

CREATE TABLE ordens_de_servico (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  cliente_id INTEGER,
  quantidade_servicos INTEGER DEFAULT 0,
  data_contrato DATETIME,
  data_execucao DATETIME,
  FOREIGN KEY(cliente_id) REFERENCES clientes(id));
  
CREATE TABLE ordens_de_servico_servicos (
  servico_id INTEGER,
  ordens_de_servico_id INTEGER,
  FOREIGN KEY(servico_id) REFERENCES servicos(id),
  FOREIGN KEY(ordens_de_servico_id) REFERENCES ordens_de_servico(id));

INSERT INTO clientes (nome) VALUES ("Ana");
INSERT INTO clientes (nome) VALUES ("Bruna");
INSERT INTO clientes (nome) VALUES ("Carlos");
INSERT INTO clientes (nome) VALUES ("Diego");

INSERT INTO servicos (nome) VALUES ("Servico1");
INSERT INTO servicos (nome) VALUES ("Servico2");
INSERT INTO servicos (nome) VALUES ("Servico3");

INSERT INTO ordens_de_servico (cliente_id, quantidade_servicos) VALUES (1, 1);
INSERT INTO ordens_de_servico (cliente_id, quantidade_servicos) VALUES (2, 2);
INSERT INTO ordens_de_servico (cliente_id, quantidade_servicos) VALUES (4, 3);

INSERT INTO ordens_de_servico_servicos (ordens_de_servico_id, servico_id) VALUES (1, 1);

INSERT INTO ordens_de_servico_servicos (ordens_de_servico_id, servico_id) VALUES (2, 1);
INSERT INTO ordens_de_servico_servicos (ordens_de_servico_id, servico_id) VALUES (2, 2);

INSERT INTO ordens_de_servico_servicos (ordens_de_servico_id, servico_id) VALUES (3, 1);
INSERT INTO ordens_de_servico_servicos (ordens_de_servico_id, servico_id) VALUES (3, 2);
INSERT INTO ordens_de_servico_servicos (ordens_de_servico_id, servico_id) VALUES (3, 3);

--Para realizar as queries ou alteracoes pedidas, basta remover os comentarios. Os comandos aparecem na ordem em que foram pedidos no teste

-- SELECT * FROM clientes , ordens_de_servico WHERE clientes.id = cliente_id;
-- SELECT * FROM ordens_de_servico WHERE quantidade_servicos > 1;
-- SELECT servico_id, COUNT(*) FROM ordens_de_servico_servicos GROUP BY servico_id;
-- UPDATE servicos SET valor_final = 1.12 * valor_final;
-- DELETE FROM ordens_de_servico ORDER BY id DESC LIMIT 1;
-- INSERT INTO clientes (nome, email, data_nascimento, tel_cel, tel_res) VALUES ("Sir Blokechap", "sirbloke@mail.com", '1994-01-01', 31987654321, 3139876543);