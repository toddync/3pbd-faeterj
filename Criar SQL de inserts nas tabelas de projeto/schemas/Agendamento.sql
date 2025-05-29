CREATE TABLE `Agendamento` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `horario` timestamp NOT NULL,
    `status` int(10) unsigned NOT NULL,
    `id_Cliente` int(10) unsigned NOT NULL,
    `id_Profissional` int(10) unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `Cliente` (`id_Cliente`),
    KEY `Profissional` (`id_Profissional`),
    CONSTRAINT `Agendamento_Cliente` FOREIGN KEY (`id_Cliente`) REFERENCES `Cliente` (`id`),
    CONSTRAINT `Agendamento_Profissional` FOREIGN KEY (`id_Profissional`) REFERENCES `Profissional` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;