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