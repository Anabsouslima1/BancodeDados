-- Entidade: Indústria Farmacêutica 
CREATE TABLE Industria_Farmaceutica (
    id_industria SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    ano_fundacao INT,
    faturamento_anual_reais NUMERIC(15, 2)
);

-- Tabela auxiliar para 'Licenças e Certificados' (normalização)
CREATE TABLE Licencas_Certificados (
    id_licenca SERIAL PRIMARY KEY,
    id_industria INT,
    descricao VARCHAR(500) NOT NULL,
    FOREIGN KEY (id_industria) REFERENCES Industria_Farmaceutica(id_industria) ON DELETE CASCADE
);

-- Tabela auxiliar para 'Unidade' (normalização)
CREATE TABLE Unidade (
    id_unidade SERIAL PRIMARY KEY,
    id_industria INT,
    cnpj_unidade CHAR(19) UNIQUE,
    endereco VARCHAR(200) NOT NULL,
    tipo_local VARCHAR(10) CHECK (tipo_local IN ('Sede', 'Filial')),
    FOREIGN KEY (id_industria) REFERENCES Industria_Farmaceutica(id_industria) ON DELETE CASCADE
);

-- Entidade: Distribuidora
CREATE TABLE Distribuidora (
    id_industria INT REFERENCES Industria_Farmaceutica(id_industria) ON DELETE CASCADE,
    id_distribuidora SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    contato_telefone VARCHAR(50),
    contato_email VARCHAR(200),
    tempo_medio_entrega INTERVAL, -- 3 dias ou 5 horas
    capacidade_armazenamento INT -- Em unidades
);

-- Entidade: Farmacia/Ponto de Venda
CREATE TABLE Farmacia_Ponto_Venda (
    id_distribuidora INT REFERENCES Distribuidora(id_distribuidora) ON DELETE CASCADE,
    id_farmacia SERIAL PRIMARY KEY,
    cnpj_farmacia CHAR(19) UNIQUE, 
    nome VARCHAR(50),          
    endereco VARCHAR(200),      
    horario_funcionamento VARCHAR(100) 
);

-- Entidade: Matéria Prima
CREATE TABLE Materia_Prima (
    id_materia_prima SERIAL PRIMARY KEY,
    id_industria INT REFERENCES Industria_Farmaceutica(id_industria) ON DELETE CASCADE,
    biomateriais VARCHAR(200),
    micro_organismos VARCHAR(200),
    substancias_minerais VARCHAR(200),
    extrato_plantas VARCHAR(200)
);

-- Entidade: Medicamento Testado
CREATE TABLE Medicamento_Testado (
    id_farmacia INT REFERENCES Farmacia_Ponto_Venda(id_farmacia) ON DELETE CASCADE,
    id_materia_prima INT REFERENCES Materia_Prima(id_materia_prima) ON DELETE CASCADE,
    id_industria INT REFERENCES Industria_Farmaceutica(id_industria) ON DELETE CASCADE,
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao VARCHAR(700),
    numero_lote VARCHAR(50) UNIQUE,
    data_validade DATE,
    data_fabricacao DATE,
    CHECK (data_validade > data_fabricacao) -- Restrição
);

-- Entidade: Cliente
CREATE TABLE Cliente (
    id_produto INT REFERENCES Medicamento_Testado(id_produto) ON DELETE CASCADE, 
    id_cliente SERIAL PRIMARY KEY, 
    cpf_cliente CHAR(15) NOT NULL UNIQUE,
    nome_cliente VARCHAR(100),
    endereco_cliente VARCHAR(200)
);

-- Entidade: Fornecedora de Animais
CREATE TABLE Fornecedora_Animais (
    id_industria INT REFERENCES Industria_Farmaceutica(id_industria) ON DELETE CASCADE,
    id_fornecedora SERIAL PRIMARY KEY,
    nome_fornecedora VARCHAR(100) NOT NULL,
    endereco_fornecedora VARCHAR(200),
    proprietario_fornecedora VARCHAR(100) NOT NULL
);

-- Tabela auxiliar para 'Animal' da Fornecedora (multivalorado)
CREATE TABLE Animais (
    id_animal SERIAL PRIMARY KEY,
    id_fornecedora INT REFERENCES Fornecedora_Animais(id_fornecedora) ON DELETE CASCADE,
    tipo_animal VARCHAR(100) NOT NULL,
    quantidade_populacao INT NOT NULL
);

-- Entidade: Funcionários
CREATE TABLE Funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    cpf_funcionario CHAR(15) UNIQUE NOT NULL,
    endereco_funcionario VARCHAR(200),
    contato_telefone VARCHAR(100),
    contato_email VARCHAR (100),
    setor VARCHAR(100),
    cargo VARCHAR(100),
    turno VARCHAR(30),
    salario NUMERIC(10,2),
    id_industria INT,
    FOREIGN KEY (id_industria) REFERENCES Industria_Farmaceutica(id_industria) ON DELETE CASCADE
);

-- Entidade: Zelador (especialização)
CREATE TABLE Zelador (
    id_zelador SERIAL PRIMARY KEY,
    id_funcionario INT,
    area_responsabilidade VARCHAR(255),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario) ON DELETE CASCADE
);

-- Entidade: Segurança (especialização)
CREATE TABLE Seguranca (
    id_seguranca SERIAL PRIMARY KEY,  
    id_funcionario INT,
    licenca_seguranca VARCHAR(600),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario) ON DELETE CASCADE
);

-- Entidade: Recepcionista (especialização)
CREATE TABLE Recepcionista (
    id_funcionario INT PRIMARY KEY,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario) ON DELETE CASCADE
);

-- Entidade: Cientista/Pesquisador (especialização)
CREATE TABLE Cientista_Pesquisador (
    id_cientista SERIAL PRIMARY KEY,
    id_funcionario INT,
    area_especializacao VARCHAR(100),
    diploma VARCHAR(100),
    tempo_atuacao INTERVAL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario) ON DELETE CASCADE
);
