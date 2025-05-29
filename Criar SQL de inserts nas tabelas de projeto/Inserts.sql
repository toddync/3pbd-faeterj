-- Clientes
INSERT INTO Cliente (nome, email, telefone, saldoCredito) VALUES
    ('Alice Silva',   'alice.silva@email.com',   '+55 11 91234-0001', 200),
    ('Bob Costa',     'bob.costa@email.com',     '+55 21 98876-5432', 150),
    ('Carla Sousa',   'carla.sousa@email.com',   '+55 31 93456-7890', 300);

-- Profissionais
INSERT INTO Profissional (nome, telefone, email) VALUES
    ('Dr. João Lima',      '+55 11 99876-1234', 'joao.lima@spa.com'),
    ('Dra. Maria Fernanda','+55 21 97654-3210', 'maria.fernanda@spa.com');

-- Especialidades
INSERT INTO Especialidade (nome) VALUES
    ('Cortes de Cabelo'),
    ('Massagem Relaxante'),
    ('Manicure Básica');

-- Profissional ↔ Especialidade
INSERT INTO Profissional_Especialidade (id_Profissional, id_Especialidade) VALUES
    (1, 1),  -- João → Cortes de Cabelo
    (1, 3),  -- João → Manicure Básica
    (2, 2),  -- Maria → Massagem Relaxante
    (2, 3);  -- Maria → Manicure Básica

-- Serviços
INSERT INTO Servico (nome, duracao, preco) VALUES
    ('Corte Simples',      30,  50),
    ('Corte VIP',          60, 120),
    ('Massagem Relaxante', 45, 100),
    ('Manicure Básica',    30,  70);

-- Pacotes
INSERT INTO Pacote (nome, preco) VALUES
    ('Pacote Bem-Estar',         150),
    ('Pacote Beleza Completa',   180);

-- Pacote ↔ Serviço
INSERT INTO Pacote_Servico (id_Pacote, id_Servico) VALUES
    (1, 3),  -- Bem-Estar → Massagem Relaxante
    (1, 4),  -- Bem-Estar → Manicure Básica
    (2, 2),  -- Beleza Completa → Corte VIP
    (2, 3),  -- Beleza Completa → Massagem Relaxante
    (2, 4);  -- Beleza Completa → Manicure Básica

-- Agendamentos
INSERT INTO Agendamento (horario, status, id_Cliente, id_Profissional) VALUES
    ('2025-06-01 10:00:00', 1, 1, 1),  -- Confirmado: Alice com João
    ('2025-06-01 11:00:00', 0, 2, 2);  -- Pendente: Bob com Maria

-- Agendamento ↔ Serviço
INSERT INTO Agendamento_Servico (preco, id_Agendamento, id_Servico) VALUES
    ( 50, 1, 1),  -- Corte Simples no agendamento 1
    ( 70, 1, 4),  -- Manicure Básica no agendamento 1
    (100, 2, 3);  -- Massagem Relaxante no agendamento 2

-- Lista de Espera
INSERT INTO Espera (posicao, id_Cliente, id_Profissional, id_Servico) VALUES
    (1, 3, 1, 1),  -- Carla na espera para Corte Simples com João
    (2, 2, 2, 4);  -- Bob na espera para Manicure Básica com Maria

-- Pagamentos
INSERT INTO Pagamento (valor, metodo, id_Agendamento) VALUES
    (120,  2, 1),  -- Alice pagou R$120 (metodo=2, dinheiro) pelo agendamento 1
    (100,  1, 2);  -- Bob pagou R$100 (metodo=1, cartão) pelo agendamento 2