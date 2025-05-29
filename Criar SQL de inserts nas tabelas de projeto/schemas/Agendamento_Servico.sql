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