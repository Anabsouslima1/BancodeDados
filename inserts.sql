-- Indústria Farmacêutica
INSERT INTO Industria_Farmaceutica (nome_empresa, ano_fundacao, faturamento_anual_reais)
VALUES 
('ABCTech', 2024, 19000000.00),
('Indústrias Lima', 2010, 10000000.00),
('Corporação Lirio & Barros', 2004, 7000000000.00);

-- Funcionários
INSERT INTO Funcionarios (nome_funcionario, cpf_funcionario, endereco_funcionario, contato_telefone, contato_email, setor, cargo, turno, salario, id_industria)
VALUES 
('Júlia Bastos', '516.164.688-82', 'Rua João Goulart, 74', '11 94263-7964', 'juliabastos@gmail.com', 'Manutenção', 'Zeladora', 'Matutino', 3000.00, 3),
('Ana Beatriz', '677.654.361-50', 'Rua Getúlio Dornelles, 60', '11 985678-7587', 'anabia@gmail.com', 'Pesquisa', 'Pesquisadora', 'Noturno', 5000.00, 2),
('Livia Severi', '996.789.123-40', 'Rua Francesco Severi, 80', '11 98937-6671', 'liviaseveri@gmail.com', 'Administração', 'Recepcionista', 'Vespertino', 2000.00, 3),
('Ana Clara', '728.123.456-03', 'Rua Juscelino Kubitschek, 94', '11 95366-5345', 'anaclara@gmail.com', 'Segurança', 'Segurança', 'Noturno', 7000.00, 1),
('Eliza Kruger', '123.456.789-10', 'Avenida Padre Arlindo Vieira, 256', '11 94455-2627', 'lizakruger10@gmail.com', 'Bioinformática', 'Cientista', 'Matutino', 9000.00, 1);

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
('Vitália Express', '(11) 2234-5678', 'vitaliaexpress@gmail.com', '17 hours', 2100, 1),
('Distribuidora FarmaConnect', '(11) 2876-5432', 'farmaconnect@gmail.com', '5 days', 1500, 3),
('Pharmalink Distribuição', '(11) 2876-5432', 'pharmalink@gmail.com', '3 days', 3600, 2);

-- Licenças e Certificados (Auxiliar de Indústria Farmacêutica)
INSERT INTO Licencas_Certificados (id_industria, descricao)
VALUES 
(1, 'Certificado de Boas Práticas de Fabricação (BPF): Certificação que atesta que a indústria farmacêutica ABCTech segue as normas internacionais de Boas Práticas de Fabricação. Este certificado garante que os medicamentos produzidos são fabricados com segurança, qualidade e eficácia, e que as instalações atendem aos requisitos de controle de qualidade e higiene exigidos pelas autoridades sanitárias.'),
(2, 'Certificado de Qualidade Farmacêutica - ISO 9001: É uma norma internacional que assegura que a empresa tem um sistema de gestão da qualidade eficaz. Este certificado confirma que a indústria farmacêutica Indústrias Lima adota práticas de melhoria contínua, garantindo a excelência na produção e distribuição de medicamentos, além da satisfação do cliente.'),
(2, 'Certificado de Pesquisa e Desenvolvimento (P&D) Aprovado: Certificado que reconhece a capacidade da indústria farmacêutica Indústrias Lima de realizar pesquisas e desenvolver novos medicamentos, com foco na inovação e na segurança dos produtos. Este certificado é concedido por instituições de pesquisa e regulações governamentais, garantindo que a indústria segue protocolos rigorosos em suas atividades de pesquisa.'),
(3, 'Certificado de Autorização de Funcionamento - ANVISA: Certificação emitida pela ANVISA (Agência Nacional de Vigilância Sanitária) que autoriza a indústria farmacêutica Corporação Lirio & Barros a produzir, importar e distribuir medicamentos no Brasil. O certificado garante que a empresa atende aos requisitos de segurança e eficácia dos produtos farmacêuticos, cumprindo com as regulamentações nacionais.');

-- Unidade (Auxiliar de Indústria Farmacêutica)
INSERT INTO Unidade (id_industria, cnpj_unidade, endereco, tipo_local)
VALUES 
(1, '56.745.678/3451-02', 'Avenida Atlântica, 130 - Rio de Janeiro', 'Sede'),
(1, '98.245.678/9322-50', 'Rua Dom Pedro II, 47 - São Paulo', 'Filial'),
(2, '12.345.678/0001-90', 'Avenida das Nações Unidas, 150 - São Paulo', 'Sede'),
(3, '56.165.432/0167-19', 'Rua Joaquim Nabuco, 30 - Curitiba', 'Sede'),
(3, '81.004.896/2125-93', 'Avenida Sete de Setembro, 1220 - Bahia', 'Filial');

-- Farmácia / Pontos de Venda
INSERT INTO Farmacia_Ponto_Venda (cnpj_farmacia, nome, endereco, horario_funcionamento, id_distribuidora)
VALUES 
('82.345.678/3401-90', 'Farmácia Viva Saúde', 'Rua Machado de Assis, 150 - São Paulo', 'Segunda a Sexta: 08:00 às 20:00, Sábado: 08:00 às 18:00, Domingo: Fechada', 2),
('98.765.432/4522-14', 'Drogaria São João', 'Rua Zumbi dos Palmares, 50 - Minas Gerais', 'Segunda a Sexta: 08:00 às 21:00, Sábado: 08:00 às 18:00, Domingo: 09:00 às 14:00', 3),
('13.457.699/2334-21', 'Centro de Terapias', 'Rua dos Três Rios, 800 - Fortaleza', 'Segunda a Sexta: 08:00 às 22:00, Sábado: 08:00 às 20:00, Domingo: 09:00 às 17:00', 1);

-- Animais
INSERT INTO Animais (id_fornecedora, tipo_animal, quantidade_populacao)
VALUES 
(1, 'Camundongos', 250),
(1, 'Ratos', 300),
(2, 'Coelhos', 200),
(2, 'Hamsters', 150),
(3, 'Cães', 100),
(3, 'Porcos', 50);

-- Zelador (Especificação)
INSERT INTO Zelador (id_funcionario, area_responsabilidade)
VALUES 
(1, 'Manutenção, organização e limpeza de instalações'),
(1, 'Vigilância das instalações');

-- Recepcionista (Especialização)
INSERT INTO Recepcionista (id_funcionario)
VALUES 
(3);

-- Medicamento Testado 
INSERT INTO Medicamento_Testado (nome_produto, descricao, numero_lote, data_validade, data_fabricacao, id_farmacia, id_materia_prima)
VALUES 
('FlexiVital', 'Suplemento alimentar indicado para melhorar a saúde das articulações, promover a saúde intestinal, aumentar a energia e melhorar a saúde geral da pele. Seu efeito sinérgico combina o poder do colágeno para articulações saudáveis, probióticos para digestão equilibrada, magnésio para uma musculatura forte, e ginseng para mais energia e resistência ao estresse diário. Ideal para quem busca uma abordagem natural para manter a saúde física e mental.', '19945', '2025-12-31', '2020-01-10', 2, 1),
('Bemzilax', 'Suplemento nutricional indicado para auxiliar no equilíbrio intestinal, melhorar a absorção de ferro e promover o bem-estar digestivo. Sua fórmula combina fibra de carbono para promover a saúde intestinal, Escherichia coli (em uma cepa benéfica) para reequilibrar a flora intestinal e combater a disbiose, sulfato de ferro para prevenir a anemia e camomila para aliviar o desconforto gástrico. Ideal para quem busca melhorar a digestão, fortalecer o sistema imunológico e manter níveis saudáveis de ferro no organismo.', '67890', '2024-06-30', '2018-02-15', 1, 2),
('DigestCare', 'Antibiótico para tratamento de infecções gastrointestinais e alívio de distúrbios digestivos como azia, refluxo e gastrite. A combinação de Streptomyces ajuda no combate de infecções bacterianas no trato gastrointestinal, enquanto o Carbonato de Cálcio e a Hortelã-pimenta promovem alívio para sintomas de azia, refluxo e cólicas. A Quitosana auxilia na redução do inchaço e proteção da mucosa gástrica, proporcionando alívio imediato e promovendo a recuperação digestiva.', '84465', '2026-03-31', '2023-12-10', 3, 3);

-- Segurança (Especialização)
INSERT INTO Seguranca (id_funcionario, licenca_seguranca)
VALUES 
(4, 'Certificação de Vigilante: Ana Clara completou com sucesso o Curso de Vigilante, certificado pela Polícia Federal. Este curso proporciona treinamento em vigilância patrimonial, legislação sobre segurança privada e procedimentos de segurança em diversas situações, como controle de acesso, prevenção de furtos e abordagem de indivíduos suspeitos.'),
(4, 'Autorização para o Uso de Arma de Fogo (Porte de Arma): Ana Clara obteve autorização da Polícia Federal para o porte de arma de fogo, após passar por exames psicológicos rigorosos, cursos de manuseio seguro de armas e avaliação prática.');

-- Cientista/Pesquisador (Especialização)
INSERT INTO Cientista_Pesquisador (id_funcionario, area_especializacao, diploma, tempo_atuacao)
VALUES 
(2, 'Biotecnologia, Genômica', 'Doutorado em Biotecnologia e Genômica', '10 years'),
(5, 'Bioinformática, Genômica', 'Doutorado em Bioinformática com especialização em Genômica', '15 years');

-- Cliente 
INSERT INTO Cliente (id_produto, cpf_cliente, nome_cliente, endereco_cliente)
VALUES
(1, '378.479.010-05', 'Breno Fausto', 'Avenida Mário Tourinho, 300 - PR'),
(2, '628.233.310-50', 'Gabriel Carvalho', 'Avenida Rio Branco, 1800 - RJ'),
(3, '510.870.580-82', 'Luna Alves', 'Rua do Sol, 56 - BA'),
(2, '978.740.010-44', 'Olivia Vieira', 'Rua dos Três Poderes - DF'),
(1, '810.827.400-12', 'Max de Melo', 'Rua das Palmeiras, 25 - SP');