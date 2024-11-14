-- Criação do Banco de Dados
CREATE DATABASE SistemaAgendamento;

-- Seleciona o Banco de Dados
USE SistemaAgendamento;

-- Tabela Usuarios
CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Tipo ENUM('cliente', 'administrador') NOT NULL
);

-- Tabela Estabelecimentos
CREATE TABLE Estabelecimentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Telefone VARCHAR(15) NOT NULL
);

-- Tabela Mesas
CREATE TABLE Mesas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    EstabelecimentoID INT NOT NULL,
    NumeroMesa INT NOT NULL,
    Capacidade INT NOT NULL,
    Disponibilidade BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (EstabelecimentoID) REFERENCES Estabelecimentos(ID)
);

-- Tabela Reservas
CREATE TABLE Reservas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT NOT NULL,
    MesaID INT NOT NULL,
    DataHora DATETIME NOT NULL,
    NumeroPessoas INT NOT NULL,
    Status ENUM('pendente', 'confirmada', 'cancelada') NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID),
    FOREIGN KEY (MesaID) REFERENCES Mesas(ID)
);

-- Tabela Pagamentos
CREATE TABLE Pagamentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ReservaID INT NOT NULL,
    MetodoPagamento VARCHAR(50) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Status ENUM('pago', 'pendente') NOT NULL,
    FOREIGN KEY (ReservaID) REFERENCES Reservas(ID)
);

-- Tabela Notificacoes
CREATE TABLE Notificacoes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT NOT NULL,
    Mensagem TEXT NOT NULL,
    DataHora DATETIME NOT NULL,
    Visualizada BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);
