-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.22-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para empresa2
CREATE DATABASE IF NOT EXISTS `empresa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `empresa`;

-- Copiando estrutura para tabela empresa.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.cargo: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` (`id`, `descricao`, `salario`) VALUES
	(1, 'GERENTE', 10000.00),
	(2, 'ENGENHEIRO', 8000.00),
	(3, 'SUPERVISOR', 3000.00),
	(4, 'OPERARIO', 2000.00),
	(5, 'VENDEDOR', 5000.00);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(40) NOT NULL,
  `municipio` varchar(40) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `estado` char(2) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `idrepresentante` int(11) NOT NULL,
  `idregiao` int(11) NOT NULL,
  `tipo` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FRK_CLIENTE_REPRESENTANTE` (`idrepresentante`),
  KEY `FRK_CLIENTE_REGIAO` (`idregiao`),
  CONSTRAINT `FRK_CLIENTE_REGIAO` FOREIGN KEY (`idregiao`) REFERENCES `regiao` (`id`),
  CONSTRAINT `FRK_CLIENTE_REPRESENTANTE` FOREIGN KEY (`idrepresentante`) REFERENCES `representante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.cliente: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `nome`, `endereco`, `numero`, `complemento`, `bairro`, `municipio`, `cep`, `estado`, `telefone`, `idrepresentante`, `idregiao`, `tipo`) VALUES
	(1, 'QUALITAS IND E COMERCIO', 'RUA FELICIANO ANTUNES', '76', NULL, 'JD CHAPARRAL', 'ITAPIRA', '13843000', 'SP', '39131122', 1, 4, 'J'),
	(2, 'METALURGICA RL', 'AV ORESTES PRESTES', '390', NULL, 'JD LARAMO', 'ITAPIRA', '13843000', 'SP', '39134433', 1, 4, 'J'),
	(3, 'JF MAQUINAS E EQUIPAMENTOS', 'RUA BORBA GATO', '78', NULL, 'JD PLANALTO VERDE', 'CAMPINAS', '13843000', 'SP', '39137090', 2, 1, 'J'),
	(4, 'PENHA IND DE PAPELAO LTDA', 'RUA OSVALDO CRUZ', '374', NULL, 'JD PROGRESSO', 'SAO PAULO', '13843000', 'SP', '39131345', 3, 5, 'J'),
	(5, 'INTERNATIONAL PAPER', 'RODOVIA SP 340', '5467', NULL, '', 'MOGI GUACU', '13840000', 'SP', '38619878', 1, 4, 'J'),
	(6, 'MAHLE IND E COMERCIO', 'Av. Ernst MAHLE', '2000', NULL, '', 'MOGI GUACU', '13846146', 'SP', ' 38619100', 3, 5, 'J'),
	(7, 'JOSE VANTUAM', 'Rua 8', '27', '', 'CENTRO', 'ARARAS', '13600-000', 'SP', '', 1, 1, 'F'),
	(8, 'AGOSTINHO DE HIPONA', 'RUA CONFISSOES', '430', '', 'CENTRO', 'RIO CLARO', '13506-000', 'SP', '', 2, 1, 'F');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.departamento: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`id`, `descricao`) VALUES
	(1, 'FINANCEIRO'),
	(2, 'COMERCIAL'),
	(3, 'ADMINISTRATIVO'),
	(4, 'PRODUCAO');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa2.empregado
CREATE TABLE IF NOT EXISTS `empregado` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(40) NOT NULL,
  `municipio` varchar(40) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `pais` varchar(40) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `escolaridade` int(11) NOT NULL,
  `idcargo` int(11) NOT NULL,
  `salario` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idcargo`) references cargo(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.empregado: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` (`id`, `nome`, `endereco`, `numero`, `complemento`, `bairro`, `municipio`, `estado`, `cep`, `pais`, `telefone`, `escolaridade`, `idcargo`, `salario`) VALUES
	(1, 'ANA PAULA', 'RUA 1', '5', NULL, 'VILA MARIANA', 'ITAPIRA', 'SP', '13843000', 'BRASIL', '39134589', 3, 2, 10000.000),
	(2, 'PEDRO HENRIQUE', 'RUA ALVAREZ TEIXEIRA', '1521', NULL, 'JD CARMEN LIDIA', 'ITAPIRA', 'SP', '13843000', 'INGLATERRA', '39138976', 3, 2, 18000.000),
	(3, 'MARIO CAVENAZZI', 'RUA TIRADENTES', '327', NULL, 'JD PORTO VELHO', 'ITAPIRA', 'SP', '13843000', 'INGLATERRA', '39131254', 2, 3, 8000.000),
	(4, 'JURANDIR VIEIRA', 'AV MARECHAL RONDOM', '2034', NULL, 'VILA MATILDE', 'ITAPIRA', 'SP', '13843000', 'BRASIL', '39136547', 3, 1, 8000.000),
	(5, 'AMALIA CARDOSO', 'RUA CORUMBA', '737', NULL, 'JD AUREA', 'ITAPIRA', 'SP', '13843000', 'ARGENTINA', '39132234', 1, 4, 2500.000);
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa2.formapagto
CREATE TABLE IF NOT EXISTS `formapagto` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.formapagto: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `formapagto` DISABLE KEYS */;
INSERT INTO `formapagto` (`id`, `descricao`) VALUES
	(1, 'A VISTA'),
	(2, 'A PRAZO'),
	(3, 'BOLETO'),
	(4, 'CHEQUE');
/*!40000 ALTER TABLE `formapagto` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa.venda
CREATE TABLE IF NOT EXISTS `venda` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `datemissao` date NOT NULL,
  `datentrega` date DEFAULT NULL,
  `idformapagto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FRK_VENDA_CLIENTE` (`idcliente`),
  KEY `FRK_VENDA_FORMAPAGTO` (`idformapagto`),
  CONSTRAINT `FRK_VENDA_CLIENTE` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FRK_VENDA_FORMAPAGTO` FOREIGN KEY (`idformapagto`) REFERENCES `formapagto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.venda: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `VENDA` (`id`, `idcliente`, `datemissao`, `datentrega`, `idformapagto`) VALUES
	(1, 1, '2019-01-05', '2019-04-06', 1),
	(2, 2, '2019-01-06', '2019-04-07', 2),
	(3, 1, '2019-02-03', '2019-02-03', 3),
	(4, 3, '2019-03-15', '2019-03-18', 1),
	(5, 4, '2019-04-04', '2019-04-10', 3),
	(6, 5, '2019-04-04', '2019-04-10', 3),
	(7, 6, '2019-04-04', '2019-04-10', 3),
	(8, 5, '2019-04-04', '2019-04-10', 3),
	(9, 4, '2019-04-04', '2019-04-10', 2),
	(10, 6, '2019-04-04', '2019-04-10', 1);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  `precodecompra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precodevenda` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estoque` decimal(10,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.produto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `descricao`, `precodecompra`, `precodevenda`, `estoque`) VALUES
	(1, 'PARAFUSO SEXTAVADO 1 POL.', 0.15, 0.25, 10000.000),
	(2, 'PARAFUSO ROSCA SOBERBA', 0.30, 0.45, 15000.000),
	(3, 'PARAFUSO SEXTAVADO 2 POL.', 0.30, 0.45, 8000.000),
	(4, 'PORCA', 0.02, 0.05, 12000.000),
	(5, 'ARRUELA', 0.02, 0.05, 14000.000),
	(6, 'TESTE', 0.20, 0.80, 10.000);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa.itemvenda
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `idvenda` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `precounitario` decimal(10,3) NOT NULL,
  PRIMARY KEY (`idvenda`,`idproduto`),
  KEY `FRK_ITEMVENDA_PRODUTO` (`idproduto`),
  CONSTRAINT `FRK_ITEMVENDA_VENDA` FOREIGN KEY (`idvenda`) REFERENCES venda (`id`),
  CONSTRAINT `FRK_ITEMVENDA_PRODUTO` FOREIGN KEY (`idproduto`) REFERENCES produto (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.itemvenda: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
INSERT INTO `itemvenda` (`idvenda`, `idproduto`, `quantidade`, `precounitario`) VALUES
	(1, 1, 5.000, 0.250),
	(1, 2, 3.000, 0.450),
	(2, 1, 2.000, 0.250),
	(2, 3, 10.000, 0.450),
	(3, 1, 15.000, 0.250),
	(4, 2, 20.000, 0.450),
	(5, 1, 35.000, 0.250),
	(6, 1, 40.000, 0.250),
	(7, 2, 35.000, 0.450),
	(8, 4, 28.000, 0.050),
	(9, 5, 60.000, 0.050),
	(10, 2, 100.000, 0.050),
	(10, 3, 100.000, 0.450),
	(10, 4, 100.000, 0.050);
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa.regiao
CREATE TABLE IF NOT EXISTS `regiao` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `estado` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.regiao: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `regiao` DISABLE KEYS */;
INSERT INTO `regiao` (`id`, `descricao`, `estado`) VALUES
	(1, 'CAMPINAS', 'SP'),
	(2, 'PIRACICABA', 'SP'),
	(3, 'GRANDE SAO PAULO', 'SP'),
	(4, 'BAIXA MOGIANA', 'SP'),
	(5, 'SAO PAULO', 'SP');
/*!40000 ALTER TABLE `regiao` ENABLE KEYS */;

-- Copiando estrutura para tabela empresa.representante
CREATE TABLE IF NOT EXISTS `representante` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(40) NOT NULL,
  `municipio` varchar(40) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela empresa.representante: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `representante` DISABLE KEYS */;
INSERT INTO `representante` (`id`, `nome`, `endereco`, `numero`, `complemento`, `bairro`, `municipio`, `estado`, `cep`, `telefone`) VALUES
	(1, 'ALVARO', 'RUA ORLANDO SILVA', '13', NULL, 'JD VILLAGE', 'ITAPIRA', 'SP', '13843000', '39138876'),
	(2, 'PEIXOTO', 'AV DEODORA DA FONSECA', '980', NULL, 'JD CRUZEIRO', 'ITAPIRA', 'SP', '13843000', '39131423'),
	(3, 'JOAQUIM', 'RUA DOS PRADOS', '26', NULL, 'JD CATAGUA', 'ITAPIRA', 'SP', '13843000', '39133390'),
	(4, 'SINESIO', 'RUA ODORICO PARAGUACU', '456', NULL, 'JD FRONTEIRA', 'ITAPIRA', 'SP', '13843000', '39135527');
/*!40000 ALTER TABLE `representante` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
