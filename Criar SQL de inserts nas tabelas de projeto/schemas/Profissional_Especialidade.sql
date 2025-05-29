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