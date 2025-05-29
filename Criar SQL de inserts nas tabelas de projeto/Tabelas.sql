CREATE TABLE `Cliente` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `nome` varchar(80) NOT NULL,
    `email` varchar(50) NOT NULL,
    `telefone` varchar(50) NOT NULL,
    `saldoCredito` decimal(10,0) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Profissional` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `nome` varchar(80) NOT NULL,
    `telefone` varchar(50) NOT NULL,
    `email` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Especialidade` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `nome` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Profissional_Especialidade` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `id_Profissional` int(10) unsigned NOT NULL,
    `id_Especialidade` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `Profissional` (`id_Profissional`),
    KEY `Especialidade` (`id_Especialidade`),
    CONSTRAINT `Profissional_Especialidade_Profissional` FOREIGN KEY (`id_Profissional`) REFERENCES `Profissional` (`id`),
    CONSTRAINT `Profissional_Especialidade_Especialidade` FOREIGN KEY (`id_Especialidade`) REFERENCES `Especialidade` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Agendamento` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `horario` timestamp NOT NULL,
    `status` int(10) unsigned NOT NULL, -- pendente (0), confirmado (1), cancelado (2)
    `id_Cliente` int(10) unsigned NOT NULL,
    `id_Profissional` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `Cliente` (`id_Cliente`),
    KEY `Profissional` (`id_Profissional`),
    CONSTRAINT `Agendamento_Cliente` FOREIGN KEY (`id_Cliente`) REFERENCES `Cliente` (`id`),
    CONSTRAINT `Agendamento_Profissional` FOREIGN KEY (`id_Profissional`) REFERENCES `Profissional` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Servico` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `nome` varchar(50) NOT NULL,
    `duracao` int(10) unsigned NOT NULL,
    `preco` decimal(10,0) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Agendamento_Servico` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `preco` decimal(10,0) NOT NULL,
    `id_Agendamento` int(10) unsigned NOT NULL,
    `id_Servico` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `Agendamento` (`id_Agendamento`),
    KEY `Servico` (`id_Servico`),
    CONSTRAINT `Agendamento_Servico_Agendamento` FOREIGN KEY (`id_Agendamento`) REFERENCES `Agendamento` (`id`) ,
    CONSTRAINT `Agendamento_Servico_Servico` FOREIGN KEY (`id_Servico`) REFERENCES `Servico` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Espera` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `posicao` int(10) unsigned NOT NULL,
    `id_Cliente` int(10) unsigned NOT NULL,
    `id_Profissional` int(10) unsigned NOT NULL,
    `id_Servico` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `Cliente` (`id_Cliente`),
    KEY `Profissional` (`id_Profissional`),
    KEY `Servico` (`id_Servico`),
    CONSTRAINT `Espera_Cliente` FOREIGN KEY (`id_Cliente`) REFERENCES `Cliente` (`id`) ,
    CONSTRAINT `Espera_Profissional` FOREIGN KEY (`id_Profissional`) REFERENCES `Profissional` (`id`) ,
    CONSTRAINT `Espera_Servico` FOREIGN KEY (`id_Servico`) REFERENCES `Servico` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Pacote` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `nome` varchar(50) NOT NULL,
    `preco` decimal(10,0) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Pacote_Servico` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `id_Pacote` int(10) unsigned NOT NULL,
    `id_Servico` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `Pacote` (`id_Pacote`),
    KEY `Servico` (`id_Servico`),
    CONSTRAINT `Pacote_Servico_Pacote` FOREIGN KEY (`id_Pacote`) REFERENCES `Pacote` (`id`) ,
    CONSTRAINT `Pacote_Servico_Servico` FOREIGN KEY (`id_Servico`) REFERENCES `Servico` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Pagamento` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `valor` decimal(10,0) NOT NULL,
    `metodo` int(10) unsigned NOT NULL, -- cartão (1), dinheiro (2), transferência (3)
    `id_Agendamento` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `Agendamento` (`id_Agendamento`),
    CONSTRAINT `Pagamento_Agendamento` FOREIGN KEY (`id_Agendamento`) REFERENCES `Agendamento` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;