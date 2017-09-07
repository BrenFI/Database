CREATE TABLE `gri` (
  `idgri` int(11) NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`idgri`),
  UNIQUE KEY `idcategorianormalizada_UNIQUE` (`idgri`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=latin1
