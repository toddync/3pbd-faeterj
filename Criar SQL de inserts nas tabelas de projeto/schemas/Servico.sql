CREATE TABLE `Servico` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `nome` varchar(50) NOT NULL,
    `duracao` int(10) unsigned NOT NULL,
    `preco` decimal(10,0) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;