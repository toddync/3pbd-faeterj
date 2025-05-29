CREATE TABLE `Pagamento` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `valor` decimal(10,0) NOT NULL,
    `metodo` int(10) unsigned NOT NULL,
    `id_Agendamento` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `Agendamento` (`id_Agendamento`),
    CONSTRAINT `Pagamento_Agendamento` FOREIGN KEY (`id_Agendamento`) REFERENCES `Agendamento` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;