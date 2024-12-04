-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2024 às 23:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cat_facts`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `facts`
--

CREATE TABLE `facts` (
  `id` int(11) NOT NULL,
  `fact` varchar(255) NOT NULL,
  `length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `facts`
--

INSERT INTO `facts` (`id`, `fact`, `length`, `created_at`) VALUES
(69, 'Cats only use their meows to talk to humans, not each other. The only time they meow to communicate with other felines is when they are kittens to signal to their mother.', 170, '2024-12-04 22:23:57'),
(70, 'Cats can predict earthquakes. We humans are not 100% sure how they do it. There are several different theories.', 111, '2024-12-04 22:24:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `log`
--

CREATE TABLE `log` (
  `idlog` int(11) NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `numeroregistros` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `log`
--

INSERT INTO `log` (`idlog`, `datahora`, `numeroregistros`) VALUES
(35, '2024-12-04 22:23:57', 1),
(36, '2024-12-04 22:24:12', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `facts`
--
ALTER TABLE `facts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idlog`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `facts`
--
ALTER TABLE `facts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
  MODIFY `idlog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
