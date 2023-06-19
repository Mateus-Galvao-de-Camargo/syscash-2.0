-- -----------------------------------------------------
-- Schema syscash
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `syscash`;
USE `syscash` ;

-- -----------------------------------------------------
-- Table `syscash`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `syscash`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `syscash`.`favorecido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `syscash`.`favorecido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_favorecido_usuario` (`usuario_id` ASC),
  CONSTRAINT `fk_favorecido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `syscash`.`usuario` (`id`));

-- -----------------------------------------------------
-- Table `syscash`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `syscash`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `tipo` SMALLINT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categoria_usuario` (`usuario_id` ASC),
  CONSTRAINT `fk_categoria_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `syscash`.`usuario` (`id`));


-- -----------------------------------------------------
-- Table `syscash`.`conta_receber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `syscash`.`conta_receber` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `categoria_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `favorecido_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_conta_receber_categoria` (`categoria_id` ASC),
  INDEX `fk_conta_receber_usuario` (`usuario_id` ASC),
  INDEX `fk_conta_receber_favorecido` (`favorecido_id` ASC),
  CONSTRAINT `fk_conta_receber_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `syscash`.`categoria` (`id`),
  CONSTRAINT `fk_conta_receber_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `syscash`.`usuario` (`id`),
  CONSTRAINT `fk_conta_receber_favorecido`
    FOREIGN KEY (`favorecido_id`)
    REFERENCES `syscash`.`favorecido` (`id`));

-- -----------------------------------------------------
-- Table `syscash`.`conta_pagar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `syscash`.`conta_pagar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `categoria_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `favorecido_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_conta_pagar_categoria` (`categoria_id` ASC),
  INDEX `fk_conta_pagar_usuario` (`usuario_id` ASC),
  INDEX `fk_conta_pagar_favorecido` (`favorecido_id` ASC),
  CONSTRAINT `fk_conta_pagar_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `syscash`.`categoria` (`id`),
  CONSTRAINT `fk_conta_pagar_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `syscash`.`usuario` (`id`),
  CONSTRAINT `fk_conta_pagar_favorecido`
    FOREIGN KEY (`favorecido_id`)
    REFERENCES `syscash`.`favorecido` (`id`));
