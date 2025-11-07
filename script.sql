-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS recrutaverde
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE recrutaverde;

-- ============================================================
-- Tabela: usuarios (para profissionais)
-- ============================================================
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('profissional') DEFAULT 'profissional',
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    area VARCHAR(100),
    descricao TEXT,
    localizacao VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- Tabela: empresa
-- ============================================================
CREATE TABLE empresa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('empresa') DEFAULT 'empresa',
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    area VARCHAR(100),
    descricao TEXT,
    site VARCHAR(255),
    imagem VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- Tabela: contatos (formulário de contato)
-- ============================================================
CREATE TABLE contatos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    assunto VARCHAR(150) NOT NULL,
    mensagem TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- Tabela: doacoes (usada em doacao.php)
-- ============================================================
CREATE TABLE doacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empresa VARCHAR(150) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_doacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- Tabela: vagas (usada em vagas.php)
-- ============================================================
CREATE TABLE vagas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    empresa VARCHAR(150) NOT NULL,
    area VARCHAR(100),
    descricao TEXT,
    imagem VARCHAR(255),
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- Dados iniciais de exemplo
-- ============================================================

-- Empresas fictícias
INSERT INTO empresa (nome, email, senha, telefone, area, descricao, site, imagem) VALUES
('EcoPower Brasil', 'contato@ecopower.com', '$2y$10$wD.yJ8VvVZxE8XyA9A1qUu3VgPbzRLX8v4Y8Up4lt7D5JgRZhdX6q', '11999990001', 'Energias Renováveis', 'Empresa especializada em energia solar e eólica.', 'https://ecopower.com', 'ecopower.webp'),
('VerdeTech', 'rh@verdetech.org', '$2y$10$wD.yJ8VvVZxE8XyA9A1qUu3VgPbzRLX8v4Y8Up4lt7D5JgRZhdX6q', '11999990002', 'TI Sustentável', 'Startup focada em tecnologia verde e automação ambiental.', 'https://verdetech.org', 'verdetech.jpeg'),
('PlanetaLimpo', 'contato@planetalimpo.com', '$2y$10$wD.yJ8VvVZxE8XyA9A1qUu3VgPbzRLX8v4Y8Up4lt7D5JgRZhdX6q', '11999990003', 'Reciclagem', 'Organização dedicada à coleta e reciclagem de materiais.', 'https://planetalimpo.com', 'planetalimpo.webp');

-- Usuários (profissionais)
INSERT INTO usuarios (nome, email, senha, telefone, area, descricao, localizacao) VALUES
('Ana Souza', 'ana.souza@gmail.com', '$2y$10$wD.yJ8VvVZxE8XyA9A1qUu3VgPbzRLX8v4Y8Up4lt7D5JgRZhdX6q', '11981234567', 'Engenharia Ambiental', 'Engenheira com experiência em gestão de resíduos.', 'São Paulo - SP'),
('Bruno Lima', 'bruno.lima@yahoo.com', '$2y$10$wD.yJ8VvVZxE8XyA9A1qUu3VgPbzRLX8v4Y8Up4lt7D5JgRZhdX6q', '21988887777', 'TI Verde', 'Desenvolvedor com foco em sistemas sustentáveis.', 'Rio de Janeiro - RJ'),
('Carla Mendes', 'carla.mendes@hotmail.com', '$2y$10$wD.yJ8VvVZxE8XyA9A1qUu3VgPbzRLX8v4Y8Up4lt7D5JgRZhdX6q', '31999995555', 'Educação Ambiental', 'Educadora ambiental com 10 anos de experiência.', 'Belo Horizonte - MG');

-- Vagas de exemplo
INSERT INTO vagas (titulo, empresa, area, descricao, imagem) VALUES
('Engenheiro Ambiental Júnior', 'EcoPower Brasil', 'Engenharia Ambiental', 'Atuar em projetos de energia solar e eólica. Necessário conhecimento básico em sustentabilidade.', 'ecopower.webp'),
('Desenvolvedor Backend Sustentável', 'VerdeTech', 'TI Verde', 'Responsável por sistemas que monitoram consumo energético de data centers.', 'verdetech.jpeg'),
('Analista de Reciclagem', 'PlanetaLimpo', 'Gestão de Resíduos', 'Gerenciar centros de coleta e campanhas educativas.', 'Recicla.webp'),
('Designer de Produtos Ecológicos', 'VerdeTech', 'Design Sustentável', 'Criar interfaces e produtos digitais com foco em impacto ambiental positivo.', 'ambiental.jpeg'),
('Coordenador de Projetos Verdes', 'EcoPower Brasil', 'Gestão Ambiental', 'Liderar equipes em projetos de energia limpa e inovação ecológica.', 'casa-sus.jpg');

-- Doações de exemplo
INSERT INTO doacoes (empresa, valor) VALUES
('Instituto Verde Esperança', 1500.00),
('Projeto Água Limpa', 800.00),
('Associação Mar Azul', 2300.00),
('Rede Sustenta Brasil', 950.00),
('Movimento Terra Viva', 1750.00);
