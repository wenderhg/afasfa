ALTER TABLE `voluntarios` ADD `PAISORIGEM` VARCHAR( 30 ) NULL ;

ALTER TABLE `voluntarios` DROP `NOME`;

INSERT INTO `afasfa`.`estado` (
`codigo` ,
`codigopais` ,
`sigla` ,
`nome`
)
VALUES (
'28', '1', 'EX', 'Estrangeiro'
);