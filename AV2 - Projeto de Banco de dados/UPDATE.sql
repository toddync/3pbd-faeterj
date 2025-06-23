UPDATE CLIENTES SET nome = 'João da Silva', credito = credito + 50.00 WHERE id = 1;

UPDATE QUARTOS SET disponivel = FALSE WHERE id = 1;

UPDATE VAGAS SET preco = 120.00 WHERE id = 1;

UPDATE CARACTERISTICAS SET nome = 'Sol da Manhã' WHERE id = 1;

UPDATE VAGA_CARACTERISTICAS SET id_caracteristica = 2 WHERE id = 1;

UPDATE RESERVAS SET status = 'Cancelada' WHERE id = 1;

UPDATE RESERVA_VAGAS SET preco_diaria = 110.00 WHERE id = 1;

UPDATE PAGAMENTOS SET valor = 450.00 WHERE id = 1;