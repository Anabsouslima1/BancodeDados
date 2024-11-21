-- Indústria Farmacêutica
INSERT INTO Industria_Farmaceutica (nome_empresa, ano_fundacao, faturamento_anual_reais)
VALUES 
('ABCTech', 2024, 19000000.00),
('Indústrias Lima', 2010, 10000000.00);
('Corporação Lirio & Barros', 2004, 7000000000.00);

-- Funcionários
INSERT INTO Funcionarios (nome_funcionario, cpf_funcionario, endereco_funcionario, contato_telefone, contato_email, setor, cargo, turno, salario, id_industria)
VALUES 
('Júlia Bastos', '51616468882', 'Rua João Goulart, 74', '11 94263-7964', 'juliabastos@gmail.com', 'Manutenção', 'Zeladora', 'Matutino', 3000.00, 1),
('Ana Beatriz', '67765436150', 'Rua Getúlio Dornelles, 60', '11 985678-7587', 'anabia@gmail.com', 'Pesquisa', 'Pesquisadora', 'Noturno', 5000.00, 1),
('Livia Severi', '99678912340', 'Rua Francesco Severi, 80', '11 98937-6671', 'liviaseveri@gmail.com', 'Administração', 'Recepcionista', 'Vespertino', 2000.00, 1),
('Ana Clara', '72812345603', 'Rua Juscelino Kubitschek, 94', '11 95366-5345', 'anaclara@gmail.com', 'Segurança', 'Segurança', 'Noturno', 7000.00, 1),
('Eliza Kruger', '12345678910', 'Avenida Padre Arlindo Vieira, 256', '11 94455-2627', 'lizakruger10@gmail.com', 'Bioinformática', 'Cientista', 'Matutino', 9000.00, 1);

-- Matéria-Prima
INSERT INTO Materia_Prima (id_industria, biomateriais, micro_organismos, substancias_minerais, extrato_plantas)
VALUES
(3, 'Colágeno', 'Lactobacillus acidophilus', 'Óxido de magnésio', 'Ginseng'),
(2, 'Fibra de carbono', 'Escherichia coli (E. coli)', 'Sulfato de Ferro', 'Camomila'),
(1, 'Quitosana', 'Streptomyces', 'Carbonato de Cálcio', 'Hortelã-pimenta');

-- Fornecedora de Animais
INSERT INTO Fornecedora_Animais (id_industria, nome_fornecedora, endereco_fornecedora, proprietario_fornecedora)
VALUES 
(2, 'BioAnimais Ltda.', 'Rua Anita Garibaldi, 202 - São Paulo', 'Rodrigo Castanho'),
(1, 'VetBio Supplies', 'Rua Maria Quitéria, 340 - Rio de Janeiro', 'Júlio de Souza'),
(3, 'Laboratório Fauna & Research', 'Rua das Palmeiras, 88 - Santa Catarina', 'André Marques');

-- Distribuidora 
INSERT INTO Distribuidora (nome_empresa, contato_telefone, contato_email, tempo_medio_entrega, capacidade_armazenamento, id_industria)
VALUES 
('Vitália Express', '(11) 2234-5678', 'vitaliaexpress@gmail.com', '3 days', 2100, 1),
('Distribuidora FarmaConnect', '(11) 2876-5432', 'farmaconnect@gmail.com', '5 days', 1500, 3),
('Pharmalink Distribuição', '(11) 2876-5432', 'pharmalink@gmail.com', '17 hours', 3600, 2);

-- PAREI AQUI

-- Licenças (Auxiliar de Indústria Farmacêutica)

INSERT INTO Licencas_Certificados (id_industria, descricao)
VALUES 
(1, 'Licença de Produção de Medicamentos'),
(1, 'Certificado de Boas Práticas de Fabricação'),
(2, 'Licença Ambiental'),
(2, 'Certificado de Qualidade ISO 9001');

-- Insert  Unidades

INSERT INTO Unidade (id_industria, cnpj_unidade, endereco, tipo_local)
VALUES 
(1, '56745678345102', 'Rua Dom Pedro I, 130 - São Paulo', 'Sede'),
(1, '98245678932250', 'Rua Dom Pedro II, 47 - Campinas', 'Filial'),
(2, '56165432016719', 'Rua Joaquim Nabuco, 30 - São Carlos', 'Sede');

-- Insert Pontos 

INSERT INTO Farmacia_Ponto_Venda (cnpj_farmacia, sede, endereco, horario_funcionamento)
VALUES 
('82345678340190', 'Farmácia Central', 'Rua Machado de Assis, 150 - São Paulo', '08:00 às 18:00'),
('98765432452214', 'Farmácia SP', 'Rua Zumbi dos Palmares, 500 - São Paulo', '09:00 às 20:00');



-- Medicamentos Testados 

INSERT INTO Medicamento_Testado (composicao_medicamento, nome_produto, numero_lote, data_validade, data_fabricacao)
VALUES 
('Paracetamol, Ácido Acetilsalicílico', 'Alivia já', '19945', '2025-12-31', '2020-01-10'),
('Ibuprofeno', 'Bemzilax', '67890', '2024-06-30', '2018-02-15');

-- Insert Animais

INSERT INTO Animais (id_fornecedora, tipo_animal, quantidade_populacao)
VALUES 
(1, 'Camundongo', 50),
(1, 'Rato', 3000),
(2, 'Coelho', 2000),
(2, 'Hamster', 1500);



-- Insert Zelador
INSERT INTO Zelador (id_funcionario, area_responsabilidade)
VALUES 
(1, 'Manutenção, organização e limpeza de instalações');

-- Insert Segurança
INSERT INTO Seguranca (id_funcionario, licenca_seguranca)
VALUES 
(2, 'Licença de segurança profissional');


-- Insert Recepcionista
INSERT INTO Recepcionista (id_funcionario)
VALUES 
(3);

-- Insert Cientista/Pesquisador
INSERT INTO Cientista_Pesquisador (id_funcionario, area_especializacao, diploma, tempo_atuacao)
VALUES 
(4, 'Biotecnologia', 'Doutorado em Biotecnologia', 15);
