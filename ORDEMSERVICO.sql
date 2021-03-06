-- CTR + SHIFT + R = ATUALIZA O SCRIP CASO ESTEJA ACUSANDO ERROS
-- CTR + R = ATALHO PARA FECHAR RESULTADO
USE MASTER
GO

IF EXISTS(SELECT 1 FROM SYS.DATABASES WHERE NAME = 'ORDEMSERVICO')
BEGIN
	ALTER DATABASE ORDEMSERVICO SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE ORDEMSERVICO
END
GO

CREATE DATABASE ORDEMSERVICO
GO

USE ORDEMSERVICO
GO
--TABELA "PERMISS?ES DO USUARIO"
CREATE TABLE Permissao
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Descricao VARCHAR(250)
)
GO
--INSERT DA TABELA "PERMISS?O"
INSERT INTO Permissao(Descricao)
	VALUES('Abrir O.S'),
	('Abrir O.S, Fechar O.S'),
	('Abrir O.S, Fechar O.S, Encaminhar O.S')
GO
--TABELA "PLANO"
CREATE TABLE Plano
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Descricao VARCHAR(150),
	Valor VARCHAR(50)
)
GO

INSERT INTO Plano(Descricao, Valor)
	VALUES('300 MEGAS', 99.90),
	('350 MEGAS + 1 ROTEADOR EM COMODATO', 119.90),
	('400 MEGAS + 1 ROTEADOR EM COMODATO', 129.90),
	('500 MEGAS + 2 ROTEADORES EM COMODATO', 139.90)
GO
CREATE PROCEDURE SP_InserirPlano
	@Id INT OUTPUT,
	@Descricao VARCHAR(150),
	@Valor VARCHAR(50)
AS
	INSERT INTO Plano(Descricao, Valor)
		VALUES(@Descricao,	@Valor)
	SET @Id = (SELECT @@IDENTITY)
GO

--EXEC SP_InserirPlano 5, '1 GIGA + 3 PONTOS DE WI-FI', 500.00
CREATE PROC SP_BuscarPlano
	@Filtro VARCHAR(50)
	as
IF EXISTS(SELECT 1 FROM Plano WHERE CONVERT(VARCHAR(50), Id) = @Filtro)
	SELECT Id, Descricao, Valor FROM Plano WHERE CONVERT(VARCHAR(50), Id) = @Filtro
ELSE
	SELECT Id, Descricao, Valor FROM Plano WHERE Descricao LIKE '%' + @filtro + '%'
GO

-- OR Id LIKE '%'+ @filtro +'%'
CREATE PROC SP_ExcluirPlano
	@Id INT
AS
	DELETE FROM Plano WHERE Id = @Id
GO
CREATE PROC SP_AlterarPlano
	@Id INT,
	@Descricao VARCHAR(150),
	@Valor VARCHAR(50)
AS
	UPDATE Plano SET
	Descricao = @Descricao,
	Valor = @Valor
	WHERE Id = @Id
GO
-- EXEC SP_AlterarPlano 9, '600', '100'
-- SELECT*FROM Plano

--TABELA "PESSOA"
CREATE TABLE Pessoa
(
	-- DADOS PESSOAIS
	Id INT PRIMARY KEY IDENTITY(1,1),-----AUTOMATICO
	Ativo BIT,----------------------------FEITO
	NomeUsuario VARCHAR(150),-------------FEITO
	Senha VARCHAR(150),-------------------FEITO
	NomeCompleto VARCHAR(150),------------FEITO
	Cpf VARCHAR(14),----------------------FEITO
	Rg VARCHAR(13),-----------------------FEITO
	OrgaoExpeditor VARCHAR(6),------------FEITO
	DataNascimento DATETIME,--------------FEITO
	Cep VARCHAR(10),
	Rua VARCHAR(150),---------------------FEITO
	NumCasa VARCHAR(10),------------------FEITO
	Bairro VARCHAR(150),------------------ADICIONADO RECENTE
	EstadoCivil VARCHAR(10),--------------FEITO
	Nacionalidade VARCHAR(10),------------FEITO
	Email VARCHAR(30),--------------------FEITO
	Telefone VARCHAR(15),-----------------FEITO
	CelularUm VARCHAR(16),----------------FEITO
	CelularDois VARCHAR(16),--------------FEITO
	Cidade VARCHAR(10),-------------------FEITO
	Uf VARCHAR(2),------------------------FEITO
	Foto VARCHAR(150),
	-- DADOS DO FUNCIONARIO
	Funcionario BIT,----------------------FEITO
	Id_Permissao INT,---------------------FEITO
	Salario varchar(15),
	Cargo VARCHAR(50),--------------------FEITO
	DataAdmissao DATETIME NULL,-----------FEITO
	DataDemissao DATETIME NULL,-----------FEITO
	Banco VARCHAR(40),--------------------FEITO
	NumeroAgenciaBanco VARCHAR(10),-------FEITO
	NumeroContaBanco VARCHAR(15),---------FEITO
	-- DADOS DO CLIENTE
	Cliente BIT,--------------------------FEITO
	Id_Plano INT,
	--InicioDoContrato DATETIME NULL,	--COMENTADO PARA REALIZAR TESTES
	InicioDoContrato DATETIME NULL,
	FimDoContrato DATETIME NULL,
	-- OBSERVA?OES GERAIS
	Observacao VARCHAR(250)---------------FEITO
)
GO

INSERT INTO Pessoa(Ativo, NomeUsuario, Senha, NomeCompleto, DataNascimento, Rua, NumCasa, Cpf, Rg, OrgaoExpeditor, Email, Telefone, Cliente, Funcionario, Id_Plano, Id_Permissao, Foto)
	VALUES (1, '3V4ND3R50N', 'Senha@123', 'EVANDERSON RIBEIRO', '05-01-1988', 'RUA DOS ABACATEIROS', '543', '02227866193', '6666666', 'SSPTO', 'evanderson@email.com', '63992019277', 1, 1, 4, 3, '')
GO

INSERT INTO Pessoa(NomeUsuario, Senha, NomeCompleto, DataNascimento, Cpf, Cliente, Funcionario, Id_Plano, Id_Permissao, Foto, Ativo)
	VALUES ('admin', 'admin', 'USUARIO TESTE', '01-01-2000', '02227855153', 1, 0, 2, 1, '', 1)
GO

CREATE PROCEDURE SP_InserirUsuario
	@Id INT OUTPUT,
	@Ativo BIT,
	@NomeUsuario VARCHAR(150),
	@Senha VARCHAR(150),
	@NomeCompleto VARCHAR(150),
	@Cpf VARCHAR(14),
	@Rg VARCHAR(13),
	@OrgaoExpeditor VARCHAR(6),
	@DataNascimento DATETIME,
	@Cep VARCHAR(10),
	@Rua VARCHAR(150),
	@NumCasa VARCHAR(10),
	@Bairro VARCHAR(150),
	@EstadoCivil VARCHAR(10),
	@Nacionalidade VARCHAR(10),
	@Email VARCHAR(30),
	@Telefone VARCHAR(15),
	@CelularUm VARCHAR(16),
	@CelularDois VARCHAR(16),
	@Cidade VARCHAR(10),
	@Uf VARCHAR(2),
	@Foto VARCHAR(150),
	@Funcionario BIT,
	@Id_Permissao INT,
	@Salario VARCHAR(15),
	@Cargo VARCHAR(50),
	@DataAdmissao DATETIME = NULL,
	@DataDemissao DATETIME = NULL,
	@Banco VARCHAR(40),
	@NumeroAgenciaBanco VARCHAR(10),
	@NumeroContaBanco VARCHAR(15),
	@Cliente BIT,
	@InicioDoContrato DATETIME = NULL,
	@FimDoContrato DATETIME = NULL,
	@Observacao VARCHAR(250),
	@Id_Plano INT
AS
	INSERT INTO Pessoa(
	Ativo,
	NomeUsuario,
	Senha,
	NomeCompleto,
	Cpf,
	Rg,
	OrgaoExpeditor,
	DataNascimento,
	Cep,
	Rua,
	NumCasa,
	Bairro,
	EstadoCivil,
	Nacionalidade,
	Email,
	Telefone,
	CelularUm,
	CelularDois,
	Cidade,
	Uf,
	Foto,
	Funcionario,
	Id_Permissao,
	Salario,
	Cargo,
	DataAdmissao,
	DataDemissao,
	Banco,
	NumeroAgenciaBanco,
	NumeroContaBanco,
	Cliente,
	InicioDoContrato,
	FimDoContrato,
	Observacao,
	Id_Plano)
	VALUES(@Ativo,
	@NomeUsuario,
	@Senha,
	@NomeCompleto,
	@Cpf,
	@Rg,
	@OrgaoExpeditor,
	@DataNascimento,
	@Cep,
	@Rua,
	@NumCasa,
	@Bairro,
	@EstadoCivil,
	@Nacionalidade,
	@Email,
	@Telefone,
	@CelularUm,
	@CelularDois,
	@Cidade,
	@Uf,
	@Foto,
	@Funcionario,
	@Id_Permissao,
	@Salario,
	@Cargo,
	@DataAdmissao,
	@DataDemissao,
	@Banco,
	@NumeroAgenciaBanco,
	@NumeroContaBanco,
	@Cliente,
	@InicioDoContrato,
	@FimDoContrato,
	@Observacao,
	@Id_Plano)
	SET @Id = (SELECT @@IDENTITY)
GO

EXEC SP_InserirUsuario 0, 1, 'Superadmin', 'Superadmin', 'ADMINISTRADOR DO SISTEMA', '666.666.666-66', '66.666.666', 'SSP',
'05-01-1988', '77827-150', 'RUA TAL', '543', 'CENTRO', 'CASADO', 'BRASILEIRO', 'super_admin@email.com', '633411-2300', '63992019277', '13992019277',
'ARAGUAINA', 'TO', '', 1, 3, '2.500', 'SUPORTE1', '01-01-2014', '01-01-2018', 'Banco 0260 Nu Pagamentos S.A', '0001', '5658481-4', 1,
'02-02-2020', '02-02-2022', 'TEXTO TESTE DE OBSERVACAO', 3
GO
--'C:\Users\ADM\source\repos\3V4ND3R5ON\Base\Base\UIPrincipal\bin\Debug\Imgs\Matheus.jpeg'
--'C:\Users\axel_\Source\Repos\3V4ND3R5ON\Base\Base\UIPrincipal\bin\Debug\Imgs\Matheus.jpeg'
EXEC SP_InserirUsuario 0, 0, 'Usuario123', 'Senha123', 'MATHEUS MORTO-VIVO', '666.666.666-66', '66.666.666', 'SSP',
'05-01-2000', '77827-150', 'CEMIT?RIO JARDIM DAS PAINEIRAS', '543', 'CENTRO', 'SOLTEIRO', 'BRASILEIRO', 'ze_preguica@gmail.com', '633411-2300', '63991035240', null,
'ARAGUAINA', 'TO', 'C:\Users\ADM\source\repos\3V4ND3R5ON\Base\Base\UIPrincipal\bin\Debug\Imgs\Matheus.jpeg', 1, 3, '2.500', 'SUPORTE1', '01-01-2014', '01-01-2018', 'Banco 0260 Nu Pagamentos S.A', '0001', '5658481-4', 1,
'02-02-2020', '02-02-2022', 'ESSE FUNCIONARIO MATA LEFOA O DIA TODO NO ALMOXARIFADO', 3
GO

--TABELA TipoChamado
CREATE TABLE TipoChamado
	(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Descricao VARCHAR(30) 
)
GO
--SP_InserirTipoChamado
CREATE PROCEDURE SP_InserirTipoChamado
	@Id INT OUTPUT,
	@Descricao VARCHAR(150)
AS
	INSERT INTO TipoChamado(Descricao)
		VALUES(@Descricao)
	SET @Id = (SELECT @@IDENTITY)
GO
--EXEC SP_InserirTipoChamado 0, 'TESTE TIPO DE CHAMADO'
--SP_ExcluirTipoChamado
CREATE PROC SP_ExcluirTipoChamado
	@Id INT
AS
	DELETE FROM TipoChamado WHERE Id = @Id
GO
--EXEC SP_ExcluirTipoChamado 3
--SP_AlterarTipoChamado
CREATE PROC SP_AlterarTipoChamado
	@Id INT,
	@Descricao VARCHAR(150)
AS
	UPDATE TipoChamado SET
	Descricao = @Descricao
	WHERE Id = @Id
GO
--EXEC SP_AlterarTipoChamado 2, 'TESTE DE ALTERA??O'
CREATE PROC SP_BuscarTipoChamado
	@Filtro VARCHAR(50)
	as
IF EXISTS(SELECT 1 FROM TipoChamado WHERE CONVERT(VARCHAR(50), Id) = @Filtro)
	SELECT Id, Descricao FROM TipoChamado WHERE CONVERT(VARCHAR(50), Id) = @Filtro
ELSE
	SELECT Id, Descricao FROM TipoChamado WHERE Descricao LIKE '%' + @filtro + '%'
GO
--EXEC SP_BuscarTipoChamado ''
--INSERT DA TABELA "TIPO DE CHAMADO"
--SELECT * FROM TipoChamado
INSERT INTO TipoChamado(Descricao)
	VALUES('SUPORTE LOSS'),
	('SUPORTE FIBRA'),
	('INSTALA??O FIBRA'),
	('MUDAN?A DE ENDERE?O')
GO

--DROP PROC SP_AlterarUsuario
CREATE PROC SP_AlterarUsuario
	@Id INT, --OUTPUT,
	@Ativo BIT,
	@NomeUsuario VARCHAR(150),
	@Senha VARCHAR(150),
	@NomeCompleto VARCHAR(150),
	@Cpf VARCHAR(14),
	@Rg VARCHAR(13),
	@OrgaoExpeditor VARCHAR(6),
	@DataNascimento DATETIME,
	@Cep VARCHAR(10),
	@Rua VARCHAR(150),
	@Bairro VARCHAR(150),
	@NumCasa VARCHAR(10),
	@EstadoCivil VARCHAR(10),
	@Nacionalidade VARCHAR(10),
	@Email VARCHAR(30),
	@Telefone VARCHAR(15),
	@CelularUm VARCHAR(16),
	@CelularDois VARCHAR(16),
	@Cidade VARCHAR(10),
	@Uf VARCHAR(2),
	@Foto VARCHAR(150),
	@Funcionario BIT,
	@Id_Permissao INT,
	@Salario FLOAT,
	@Cargo VARCHAR(50),
	@DataAdmissao DATETIME = NULL,
	@DataDemissao DATETIME = NULL,
	@Banco VARCHAR(40),
	@NumeroAgenciaBanco VARCHAR(10),
	@NumeroContaBanco VARCHAR(15),
	@Cliente BIT,
	@InicioDoContrato DATETIME = NULL,
	@FimDoContrato DATETIME = NULL,
	@Observacao VARCHAR(250),
	@Id_Plano INT
AS
	UPDATE Pessoa SET
	Ativo = @Ativo,
	NomeUsuario = @NomeUsuario,
	Senha = @Senha,
	NomeCompleto = @NomeCompleto,
	Cpf = @Cpf,
	Rg = @Rg,
	OrgaoExpeditor = @OrgaoExpeditor,
	DataNascimento = @DataNascimento,
	Cep = @Cep,
	Rua = @Rua,
	NumCasa = @NumCasa,
	Bairro = @Bairro,
	EstadoCivil = @EstadoCivil,
	Nacionalidade = @Nacionalidade,
	Email = @Email,
	Telefone = @Telefone,
	CelularUm = @CelularUm,
	CelularDois = @CelularDois,
	Cidade = @Cidade,
	Uf = @Uf,
	Foto = @Foto,
	Funcionario = @Funcionario,
	Id_Permissao = @Id_Permissao,
	Salario = @Salario,
	Cargo = @Cargo,
	DataAdmissao = @DataAdmissao,
	DataDemissao = @DataDemissao,
	Banco = @Banco,
	NumeroAgenciaBanco = @NumeroAgenciaBanco,
	NumeroContaBanco = @NumeroContaBanco,
	Cliente = @Cliente,
	InicioDoContrato = @InicioDoContrato,
	FimDoContrato = @FimDoContrato,
	Observacao = @Observacao,
	Id_Plano = @Id_Plano
	WHERE Id = @Id
GO

--SELECT * FROM Plano
--SELECT NomeCompleto, Cpf, Ativo, Cliente, Funcionario, Id_Plano, Id_Permissao, InicioDoContrato, DataAdmissao, Foto FROM Pessoa
--GO
--TABELA "STATUS DA O.S"
CREATE TABLE StatusOS
	(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Descricao VARCHAR(20) 
)
GO
--TABELA "STATUS DA O.S"
INSERT INTO StatusOS(Descricao)
	VALUES ('ABERTO'),
	('FECHADO'),
	('ENCAMINHADO')
GO
--SELECT * FROM StatusOS
--EXEC SP_InserirStatusOS 0, "TESTE DE INSERIR"
CREATE PROCEDURE SP_InserirStatusOS
	@Id INT OUTPUT,
	@Descricao VARCHAR(150)
AS
	INSERT INTO StatusOS(Descricao)
		VALUES(@Descricao)
	SET @Id = (SELECT @@IDENTITY)
GO
--EXEC SP_ExcluirStatusOS 4
CREATE PROC SP_ExcluirStatusOS
	@Id INT
AS
	DELETE FROM StatusOS WHERE Id = @Id
GO
--EXEC SP_AlterarStatusOS 5, "TESTE DE ALTERA??O"
CREATE PROC SP_AlterarStatusOS
	@Id INT,
	@Descricao VARCHAR(150)
AS
	UPDATE StatusOS SET
	Descricao = @Descricao
	WHERE Id = @Id
GO
--EXEC SP_BuscarStatusOS "5"
CREATE PROC SP_BuscarStatusOS
	@Filtro VARCHAR(50)
	as
IF EXISTS(SELECT 1 FROM StatusOS WHERE CONVERT(VARCHAR(50), Id) = @Filtro)
	SELECT Id, Descricao FROM StatusOS WHERE CONVERT(VARCHAR(50), Id) = @Filtro
ELSE
	SELECT Id, Descricao FROM StatusOS WHERE Descricao LIKE '%' + @filtro + '%'
GO

--################################################--
CREATE PROC SP_BuscarUsuario
	@Filtro VARCHAR(250) = ''
AS
	SELECT
	Pessoa.Id,
	Ativo,
	NomeUsuario,
	Senha,
	NomeCompleto,
	Cpf,
	Rg,
	OrgaoExpeditor,
	DataNascimento,
	Cep,
	Rua,
	NumCasa,
	Bairro,
	EstadoCivil,
	Nacionalidade,
	Email,
	Telefone,
	CelularUm,
	CelularDois,
	Cidade,
	Uf,
	Foto,
	Funcionario,
	Id_Permissao,
	Salario,
	Cargo,
	DataAdmissao,
	DataDemissao,
	Banco,
	NumeroAgenciaBanco,
	NumeroContaBanco,
	Cliente,
	InicioDoContrato,
	FimDoContrato,
	Observacao,
	Id_Plano,
	Plano.Descricao AS Plano
	FROM Pessoa 
	LEFT JOIN Plano ON Pessoa.Id_Plano = Plano.Id
	WHERE NomeCompleto LIKE '%' + @filtro + '%'
	OR Cpf LIKE '%'+ @filtro +'%' OR NomeUsuario LIKE '%'+ @filtro +'%'--CONVERT(VARCHAR(50), Id) = @Filtro
GO
--###################################################################################
CREATE PROC SP_BuscarFuncionario
	@Filtro VARCHAR(250) = ''
AS
	SELECT
	Pessoa.Id,
	Ativo,
	NomeUsuario,
	NomeCompleto,
	Funcionario,
	Id_Permissao
	FROM Pessoa
	WHERE Funcionario LIKE '%' + @filtro + '%' AND Ativo = 1
GO
--EXEC SP_BuscarFuncionario '0'
--####################################################################################

CREATE PROC SP_ExcluirUsuario
	@Id INT
AS
	DELETE FROM Pessoa WHERE Id = @Id
GO

--TABELA "GEST?O DE O.S"
CREATE TABLE OrdemServico
	(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Protocolo VARCHAR (20),
	Id_Cliente INT,
	TipoChamado VARCHAR(50),
	Descricao VARCHAR(1000),
	DataAbertura DATETIME NULL,
	DataPrazo DATETIME NULL,
	DataDeFechamento DATETIME NULL,
	TecnicoResponsavel VARCHAR(150),
	Atendente VARCHAR(150),
	EstatusOS VARCHAR(20),
	LigarAntes VARCHAR(5)
)
GO

CREATE PROCEDURE SP_AbrirOrdemServico
	@Id INT OUTPUT,
	@Protocolo VARCHAR (20),
	@Id_Cliente INT,
	@TipoChamado VARCHAR(50),
	@Descricao VARCHAR(1000),
	@DataAbertura DATETIME NULL,
	@DataPrazo DATETIME NULL,
	@TecnicoResponsavel VARCHAR(150),
	@Atendente VARCHAR(150),
	@EstatusOS VARCHAR(20),
	@LigarAntes VARCHAR(5)
AS
	INSERT INTO OrdemServico(
	Protocolo,
	Id_Cliente,
	TipoChamado,
	Descricao,
	DataAbertura,
	DataPrazo,
	TecnicoResponsavel,
	Atendente,
	EstatusOS,
	LigarAntes
	)
		VALUES(
		@Protocolo,
		@Id_Cliente,
		@TipoChamado,
		@Descricao,
		@DataAbertura,
		@DataPrazo,
		@TecnicoResponsavel,
		@Atendente,
		@EstatusOS,
		@LigarAntes
		)
	SET @Id = (SELECT @@IDENTITY)
GO

EXEC SP_AbrirOrdemServico 0, 123456789, 1, 'SUPORTE LOSS','TESTE DA DESCRI??O DA O.S UM', '28-07-2022', '30-07-2022', 'TECNICO J?O', 'ATEND. UM', 'ENCAMINHADO', 'SIM'
EXEC SP_AbrirOrdemServico 0, 987654321, 2, 'SUPORTE FIBRA','TESTE DA DESCRI??O DA O.S DOIS', '30-07-2022', '01-08-2022', 'TECNICO Z?', 'ATEND. DOIS', 'ABERTO', 'NAO'
SELECT * FROM OrdemServico
GO
