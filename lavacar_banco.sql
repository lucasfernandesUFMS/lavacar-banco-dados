-- Tabela de clientes
CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(20),
  email VARCHAR(100)
);

-- Tabela de veículos
CREATE TABLE veiculos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  modelo VARCHAR(50),
  placa VARCHAR(10) UNIQUE,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela de serviços
CREATE TABLE servicos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  veiculo_id INT NOT NULL,
  tipo_servico VARCHAR(50) NOT NULL,
  valor DECIMAL(8,2) NOT NULL,
  data_servico DATE NOT NULL,
  FOREIGN KEY (veiculo_id) REFERENCES veiculos(id)
);

-- Inserção de clientes
INSERT INTO clientes (nome, telefone, email) VALUES
('Carlos Silva', '67999990000', 'carlos@example.com'),
('Juliana Rocha', '67988881111', 'juliana@example.com'),
('Marcos Vieira', '67977772222', 'marcos@example.com');

-- Inserção de veículos
INSERT INTO veiculos (cliente_id, modelo, placa) VALUES
(1, 'Fiat Uno', 'ABC1234'),
(2, 'Volkswagen Gol', 'XYZ5678'),
(3, 'Honda Civic', 'JKL4321');

-- Inserção de serviços
INSERT INTO servicos (veiculo_id, tipo_servico, valor, data_servico) VALUES
(1, 'Lavagem Simples', 25.00, '2025-07-01'),
(2, 'Lavagem Completa', 50.00, '2025-07-02'),
(3, 'Polimento', 80.00, '2025-07-03');

-- Atualização: alterar o valor do serviço com ID 3
UPDATE servicos SET valor = 85.00 WHERE id = 3;

-- Exclusão: remover o cliente com id 2 (caso permitido pelas regras de integridade)
DELETE FROM clientes WHERE id = 2;

-- Consulta com JOIN: listar todos os serviços com nome do cliente e placa do veículo
SELECT
  clientes.nome AS cliente,
  veiculos.placa,
  servicos.tipo_servico,
  servicos.valor,
  servicos.data_servico
FROM servicos
JOIN veiculos ON servicos.veiculo_id = veiculos.id
JOIN clientes ON veiculos.cliente_id = clientes.id;