create database samuLucas1;

use samuLucas1;

CREATE TABLE veiculo(
	codigoRenavan CHAR(11) primary key,
	marcaVeiculo VARCHAR(20),
	modeloVeiculo VARCHAR(20),
	placaVeiculo CHAR(7)
);

CREATE TABLE tecnicoEnfermagem(
	cpfTecnicoEnfermagem CHAR(11) PRIMARY KEY,
	corenTencinoEnfermagem CHAR(5),
	estadoCorenTencinoEnfermagem CHAR(2),
	nomeTecnicoEnfermagem VARCHAR(50),
	sexoTecnicoEnfermagem CHAR(1)
);

CREATE TABLE motorista(
	cpfMotorista CHAR(11) PRIMARY KEY,
	cnhMotorista CHAR(11),
	estadoCnhMotorista CHAR(2),
	validadeCnhMotorista DATE,
	nomeMotorista VARCHAR(50),
	sexoMotorista CHAR(1)
);

CREATE TABLE medico(
	cpfMedico CHAR(11) PRIMARY KEY,
	crmMedico CHAR(5),
	estadoCrmMedico CHAR(2),
	nomeMedico VARCHAR(50),
	sexoMedico CHAR(1)
);

CREATE TABLE enfermeiro(
	cpfEnfermeiro CHAR(11) PRIMARY KEY,
    corenEnfermeiro CHAR(5),
    estadoCorenEnfermeiro CHAR(2),
    nomeEnfermeiro VARCHAR(50),
    sexoEnfermeiro CHAR(1)
);

CREATE TABLE equipe(
	codigoEquipe INT PRIMARY KEY,
	cpfMedico CHAR(11),
	cpfEnfermeiro CHAR(11),
	cpfTecnicoEnfermagem CHAR(11),
	cpfMotorista CHAR(11),
	codigoRenavan CHAR(11),
	dataPlantaoEquipe DATE,
	turnoPlantaoNoite CHAR(1)
);

ALTER TABLE equipe
ADD CONSTRAINT fk_equipe_medico FOREIGN KEY(cpfMedico) REFERENCES medico(cpfMedico);

ALTER TABLE equipe
ADD CONSTRAINT fk_equipe_tecnicoEnfermagem FOREIGN KEY(cpfTecnicoEnfermagem) REFERENCES tecnicoEnfermagem(cpfTecnicoEnfermagem);

ALTER TABLE equipe
ADD CONSTRAINT fk_equipe_veiculo FOREIGN KEY(codigoRenavan) REFERENCES veiculo(codigoRenavan);

ALTER TABLE equipe
ADD CONSTRAINT fk_equipe_enfermeiro FOREIGN KEY(cpfEnfermeiro) REFERENCES enfermeiro(cpfEnfermeiro);

ALTER TABLE equipe
ADD CONSTRAINT fk_equipe_motorista FOREIGN KEY(cpfMotorista) REFERENCES motorista(cpfMotorista);

CREATE TABLE usuario (
	cpfUsuario CHAR(11) PRIMARY KEY,
	nomeUsuario VARCHAR(50),
	sexoUsuario CHAR(1),
	dataDeNascimento DATE,
	emailUsuario VARCHAR(30),
	loginUsuario VARCHAR(15),
	senhaUsuario VARCHAR(15)
);

CREATE TABLE tipoAcidente(
	codigoTipoAcidente INT PRIMARY KEY,
	descricaoTipoAcidente VARCHAR(30)
);

CREATE TABLE chamado(
	codigoChamado INT PRIMARY KEY,
	dataChamado DATE,
	horaChamado TIME,
	codigoTipoAcidente INT,
	 localizacaoChamado VARCHAR(200),
	 codigoEquipe INT,
	 cpfUsuario VARCHAR(11)
 );
 
 ALTER TABLE chamado
 ADD CONSTRAINT fkTipoAcidente FOREIGN KEY (codigoTipoAcidente) REFERENCES tipoAcidente(codigoTipoAcidente);
 
 ALTER TABLE chamado 
 ADD CONSTRAINT fkChamadoEquipe FOREIGN KEY (codigoEquipe) REFERENCES equipe(codigoEquipe);
 
ALTER TABLE chamado 
 ADD CONSTRAINT fkChamadoUsuario FOREIGN KEY (cpfUsuario) REFERENCES usuario(cpfUsuario);