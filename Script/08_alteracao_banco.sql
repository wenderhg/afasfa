CREATE TABLE IF NOT EXISTS `infocontato` (
  `IDCONTATO` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(60) collate latin1_general_ci default NULL,
  `FOTO` varchar(150) collate latin1_general_ci default NULL,
  `RECEBERINFORMACOES` tinyint(1) default NULL,
  `CEP` varchar(10) collate latin1_general_ci default NULL,
  `LOGRADOURO` varchar(50) collate latin1_general_ci default NULL,
  `NUMERO` int(10) unsigned default NULL,
  `COMPLEMENTO` varchar(20) collate latin1_general_ci default NULL,
  `BAIRRO` varchar(30) collate latin1_general_ci default NULL,
  `CIDADE` varchar(30) collate latin1_general_ci default NULL,
  `UF` char(2) collate latin1_general_ci default NULL,
  `TELEFONECEL` decimal(10,0) default NULL,
  `TELEFONERES` decimal(10,0) default NULL,
  `EMAIL` varchar(100) collate latin1_general_ci default NULL,
  `SEXO` char(1) collate latin1_general_ci NOT NULL default 'M' COMMENT 'Indica o sexo',
  `APELIDO` varchar(20) collate latin1_general_ci NOT NULL COMMENT 'Indica o apelido',
  PRIMARY KEY  (`IDCONTATO`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;
