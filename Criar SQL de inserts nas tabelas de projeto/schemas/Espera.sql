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