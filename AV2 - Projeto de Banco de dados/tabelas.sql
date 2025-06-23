CREATE TABLE
    IF NOT EXISTS CLIENTES (
        id INT AUTO_INCREMENT,
        nome VARCHAR(50) NOT NULL,
        email VARCHAR(50) NOT NULL,
        data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        credito DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS QUARTOS (
        id INT AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        descricao TEXT,
        possui_banheiro BOOLEAN NOT NULL DEFAULT FALSE,
        disponivel BOOLEAN NOT NULL DEFAULT TRUE,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS VAGAS (
        id INT AUTO_INCREMENT,
        id_quarto INT NOT NULL,
        identificador_vaga VARCHAR(50) NOT NULL,
        preco DECIMAL(10, 2) NOT NULL,
        disponivel BOOLEAN NOT NULL DEFAULT TRUE,
        PRIMARY KEY (id),
        CONSTRAINT fk_vagas_quartos FOREIGN KEY (id_quarto) REFERENCES QUARTOS (id)
    );

CREATE TABLE
    IF NOT EXISTS CARACTERISTICAS (
        id INT AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS VAGA_CARACTERISTICAS (
        id INT AUTO_INCREMENT,
        id_vaga INT NOT NULL,
        id_caracteristica INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_vc_vagas FOREIGN KEY (id_vaga) REFERENCES VAGAS (id),
        CONSTRAINT fk_vc_caracteristicas FOREIGN KEY (id_caracteristica) REFERENCES CARACTERISTICAS (id)
    );

CREATE TABLE
    IF NOT EXISTS RESERVAS (
        id INT AUTO_INCREMENT,
        id_cliente INT NOT NULL,
        data_inicio DATE NOT NULL,
        data_fim DATE NOT NULL,
        valor DECIMAL(10, 2) NOT NULL,
        status ENUM (
            'Pendente',
            'Confirmada',
            'Cancelada',
            'Concluída'
        ) NOT NULL,
        data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id),
        CONSTRAINT fk_reservas_clientes FOREIGN KEY (id_cliente) REFERENCES CLIENTES (id),
        INDEX datas_reserva (data_inicio, data_fim)
    );

CREATE TABLE
    IF NOT EXISTS RESERVA_VAGAS (
        id INT AUTO_INCREMENT,
        id_reserva INT NOT NULL,
        id_vaga INT NOT NULL,
        preco_diaria DECIMAL(10, 2) NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_rv_reservas FOREIGN KEY (id_reserva) REFERENCES RESERVAS (id),
        CONSTRAINT fk_rv_vagas FOREIGN KEY (id_vaga) REFERENCES VAGAS (id)
    );

CREATE TABLE
    IF NOT EXISTS PAGAMENTOS (
        id INT AUTO_INCREMENT,
        id_reserva INT NOT NULL,
        id_transacao_gateway VARCHAR(255) NOT NULL,
        valor DECIMAL(10, 2) NOT NULL,
        data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id),
        CONSTRAINT fk_pagamentos_reservas FOREIGN KEY (id_reserva) REFERENCES RESERVAS (id)
    );