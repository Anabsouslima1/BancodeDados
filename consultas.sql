-- Enunciados e Consultas
-- 1. Consultar os nomes dos medicamentos desenvolvidos por cada empresa

SELECT m.nome_produto AS Medicamento, i.nome_empresa AS Empresa
FROM Industria_Farmaceutica i
JOIN Medicamento_Testado m ON i.id_industria = m.id_industria
ORDER BY i.nome_empresa;

-- 2. Contar quantos funcionários estão registrados nas indústrias

SELECT i.nome_empresa, COUNT(f.nome_funcionario) AS funcionarios
FROM Industria_Farmaceutica i
JOIN funcionarios f ON i.id_industria = f.id_industria
GROUP BY i.nome_empresa

-- 3. Listar nome da empresa, contatos e capacidade de armazenamento da distribuidora que realiza a entrega de medicamentos à farmácia / ponto de venda que fica em São Paulo

SELECT d.nome_empresa, d.contato_email, d.contato_telefone, d.capacidade_armazenamento
FROM Distribuidora d
JOIN Farmacia_ponto_venda f ON d.id_distribuidora = f.id_distribuidora
WHERE f.endereco LIKE '%São Paulo';

-- 4. Listar cientista responsável pelos testes do medicamento 'FlexiVital'

SELECT f.nome_funcionario AS Cientista, M.nome_produto AS Medicamento 
FROM cientista_pesquisador C
JOIN funcionarios F ON F.id_funcionario = C.id_funcionario
JOIN industria_farmaceutica I ON I.id_industria = F.id_industria
JOIN Medicamento_Testado M ON M.id_industria = I.id_industria
WHERE M.nome_produto = 'FlexiVital';

-- 5. Indique a média de salários dos funcionários da empresa com id_industria = 3, com 2 casas decimais

SELECT ROUND(AVG(f.salario), 2) AS media_salarios
FROM funcionarios f
JOIN industria_farmaceutica i ON f.id_industria = i.id_industria
WHERE i.id_industria = 3;

-- 6. Mostrar quais animais são fornecidos para teste à Indústria 'ABCTech' e suas respectivas quantidades de quantidade_populacao, em ordem decrescente

SELECT a.tipo_animal, a.quantidade_populacao
FROM Animais a
JOIN fornecedora_animais f ON a.id_fornecedora = f.id_fornecedora
JOIN industria_farmaceutica i ON i.id_industria = f.id_industria
WHERE i.nome_empresa = 'ABCTech'
ORDER BY a.quantidade_populacao DESC;

-- 7. Exiba o endereço da farmácia/ponto de venda que vende o medicamento contendo 'Hortelã-pimenta' em sua composição, junto com o nome do medicamento

SELECT f.endereco, m.nome_produto AS Medicamento
FROM Farmacia_Ponto_Venda f
JOIN Medicamento_Testado m ON f.id_farmacia = m.id_farmacia
JOIN Materia_Prima mp ON m.id_materia_prima = mp.id_materia_prima
WHERE mp.extrato_plantas = 'Hortelã-pimenta';

-- 8. Nomear clientes e exibir nome da farmácia / ponto de venda que frequentaram ao comprar o medicamento desenvolvido pela empresas de id 1 e 2, em ordem crescente pelo nome da farmácia / ponto de venda

SELECT c.nome_cliente AS Clientes, f.nome AS Fármacia
FROM Cliente c
JOIN Medicamento_testado m on c.id_produto = m.id_produto
JOIN Industria_farmaceutica i on m.id_industria = i.id_industria
JOIN Distribuidora d on d.id_industria = i.id_industria
JOIN Farmacia_ponto_venda f on d.id_distribuidora = f.id_distribuidora
WHERE i.id_industria IN (1,2)
ORDER BY f.nome;

-- 9. Exiba o nome do produto, número do lote, data de fabricação, data de validade, e a farmácia responsável pela distribuição de todos os medicamentos testados. Calcule também a duração dos medicamentos e a quantidade de dias restantes para o vencimento de cada medicamento e classifique-os em 'Válido' ou 'Vencido'. A lista deve ser ordenada pelo status de validade e pelo número de dias restantes até o vencimento, de forma decrescente."


SELECT m.nome_produto, m.numero_lote, m.data_fabricacao, m.data_validade, f.nome AS Farmacia, (m.data_validade - m.data_fabricacao) AS  Duracao_Medicamento, (m.data_validade - CURRENT_DATE) AS Dias_Para_Vencer,
    CASE 
        WHEN m.data_validade < CURRENT_DATE THEN 'Vencido'
        ELSE 'Válido'
    END AS Status_Validade
FROM medicamento_testado m
JOIN farmacia_ponto_venda f ON m.id_farmacia = f.id_farmacia
ORDER BY Status_Validade ASC, Dias_Para_Vencer DESC;


-- 10. Nomear cientistas de cada empresa e determinar o tempo de atuação total em suas determinadas áreas. Mostrar, também, o faturamento de cada empresa em formatação para R$. Ordenar pelo total de diplomas em ordem decrescente e faturamento anual em ordem crescente.

SELECT f.nome_funcionario, i.nome_empresa AS Empresa, MAX(EXTRACT(YEAR FROM cp.tempo_atuacao)) AS Tempo_Atuacao_Total, COUNT(cp.id_cientista) AS Total_Diplomas, TO_CHAR(i.faturamento_anual_reais, 'RL 99G999G999G999D99') AS faturamento_anual
FROM Funcionarios f
JOIN Cientista_pesquisador cp ON f.id_funcionario = cp.id_funcionario
JOIN Industria_farmaceutica i ON f.id_industria = i.id_industria
GROUP BY f.nome_funcionario, i.nome_empresa, i.faturamento_anual_reais
ORDER BY faturamento_anual ASC, Tempo_Atuacao_Total DESC;
