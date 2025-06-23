INSERT INTO CLIENTES (nome, email) VALUES ('João Silva', 'joao@example.com');

INSERT INTO QUARTOS (nome, descricao, possui_banheiro)
    VALUES ( 'Quarto 101', 'Quarto com 4 camas e banheiro', TRUE );

INSERT INTO VAGAS (id_quarto, identificador_vaga, preco) VALUES (1, 'Cama 1A', 100.00);

INSERT INTO CARACTERISTICAS (nome) VALUES ('Perto da Janela'), ('sol da tarde');

INSERT INTO VAGA_CARACTERISTICAS (id_vaga, id_caracteristica) VALUES (1, 1);

INSERT INTO RESERVAS (id_cliente, data_inicio, data_fim, valor, status)
    VALUES ( 1, '2025-07-10', '2025-07-15', 500.00, 'Confirmada' );

INSERT INTO RESERVA_VAGAS (id_reserva, id_vaga, preco_diaria) VALUES (1, 1, 100.00);

INSERT INTO PAGAMENTOS (id_reserva, id_transacao_gateway, valor) VALUES (1, 'GTW123456', 500.00);