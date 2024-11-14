CREATE TABLE Bairro (
    IDBairro INT PRIMARY KEY,  -- Identificador único do bairro
    NomeBairro VARCHAR(255) NOT NULL  -- Nome do bairro
);
CREATE TABLE CEP (
    NumeroCEP VARCHAR(20) PRIMARY KEY,  -- Número do CEP, agora é a chave primária
    -- Outros campos, se houver
);


CREATE TABLE Sexo (
    IDSexo INT PRIMARY KEY,  -- Identificador único do sexo
    Tipo VARCHAR(50) NOT NULL  -- Tipo de sexo (por exemplo, Masculino, Feminino, Outro)
);

CREATE TABLE Cidade (
    IDCidade INT PRIMARY KEY,  -- Identificador único da cidade
    NomeCidade VARCHAR(255) NOT NULL  -- Nome da cidade
);

CREATE TABLE Estado (
    IDEstado INT PRIMARY KEY,  -- Identificador único do estado
    NomeEstado VARCHAR(255) NOT NULL  -- Nome do estado
);

CREATE TABLE NumeroCasa (
    IDNumCasa INT PRIMARY KEY,  -- Identificador único do número da casa
    NumeroCasa VARCHAR(10) NOT NULL  -- Número da casa
);
CREATE TABLE Pais (
    IDPais INT PRIMARY KEY,  -- Identificador único do país
    NomePais VARCHAR(255) NOT NULL  -- Nome do país
);
CREATE TABLE Rua (
    IDRua INT PRIMARY KEY,  -- Identificador único da rua
    NomeRua VARCHAR(255) NOT NULL  -- Nome da rua
);

CREATE TABLE Vendedor (
    IDVend INT PRIMARY KEY,  -- Identificador único do vendedor
    CPVVend CHAR(11) NOT NULL,  -- CPF do vendedor (11 caracteres para formato XXX.XXX.XXX-XX)
    NasVend DATE NOT NULL,  -- Data de nascimento do vendedor
    IDSexoFK INT NOT NULL,  -- Chave estrangeira para o sexo do vendedor
    EmailVend VARCHAR(255) NOT NULL,  -- E-mail do vendedor
    LoginVend VARCHAR(50) NOT NULL,  -- Login do vendedor
    TelVend VARCHAR(15),  -- Telefone do vendedor
    IDEnderecoFK INT NOT NULL,  -- Chave estrangeira para o endereço do vendedor
    FOREIGN KEY (IDSexoFK) REFERENCES Sexo(IDSexo),  -- Referência para a tabela Sexo
    FOREIGN KEY (IDEnderecoFK) REFERENCES Endereco(CodigoEndereco)  -- Referência para a tabela Endereco
);
CREATE TABLE Comprador (
    IDComp INT PRIMARY KEY,  -- Identificador único do comprador
    CPFComp CHAR(11) NOT NULL,  -- CPF do comprador (11 caracteres para formato XXX.XXX.XXX-XX)
    NasComp DATE NOT NULL,  -- Data de nascimento do comprador
    IDSexoFK INT NOT NULL,  -- Chave estrangeira para o sexo do comprador
    EmailComp VARCHAR(255) NOT NULL,  -- E-mail do comprador
    LoginComp VARCHAR(50) NOT NULL,  -- Login do comprador
    TelComp VARCHAR(15),  -- Telefone do comprador
    IDEnderecoFK INT NOT NULL,  -- Chave estrangeira para o endereço do comprador
    FOREIGN KEY (IDSexoFK) REFERENCES Sexo(IDSexo),  -- Referência para a tabela Sexo
    FOREIGN KEY (IDEnderecoFK) REFERENCES Endereco(CodigoEndereco)  -- Referência para a tabela Endereco
);
CREATE TABLE Endereco (
    CodigoEndereco INT PRIMARY KEY,  -- Identificador único do endereço
    IDBairro INT NOT NULL,  -- Chave estrangeira para o bairro
    NumeroCEP VARCHAR(20) NOT NULL,  -- Chave estrangeira para o CEP
    IDCidade INT NOT NULL,  -- Chave estrangeira para a cidade
    IDEstado INT NOT NULL,  -- Chave estrangeira para o estado
    IDNumCasa INT NOT NULL,  -- Chave estrangeira para o número da casa
    IDPais INT NOT NULL,  -- Chave estrangeira para o país
    IDRua INT NOT NULL,  -- Chave estrangeira para a rua
    FOREIGN KEY (IDBairro) REFERENCES Bairro(IDBairro),  -- Referência para a tabela Bairro
    FOREIGN KEY (NumeroCEP) REFERENCES CEP(NumeroCEP),  -- Referência para a tabela CEP
    FOREIGN KEY (IDCidade) REFERENCES Cidade(IDCidade),  -- Referência para a tabela Cidade
    FOREIGN KEY (IDEstado) REFERENCES Estado(IDEstado),  -- Referência para a tabela Estado
    FOREIGN KEY (IDNumCasa) REFERENCES NumeroCasa(IDNumCasa),  -- Referência para a tabela NumeroCasa
    FOREIGN KEY (IDPais) REFERENCES Pais(IDPais),  -- Referência para a tabela Pais
    FOREIGN KEY (IDRua) REFERENCES Rua(IDRua)  -- Referência para a tabela Rua
);


CREATE TABLE Produto (
    IDProd INT PRIMARY KEY,  -- Identificador único do produto
    DescricaoProd VARCHAR(255) NOT NULL,  -- Descrição do produto
    ValorProd DECIMAL(10, 2) NOT NULL,  -- Valor do produto (com até 2 casas decimais)
    FotoProd VARCHAR(255),  -- Foto ou caminho para a foto do produto
    NumdeSerie VARCHAR(50) NOT NULL UNIQUE,  -- Número de série do produto (único)
    DataPublicacao DATE NOT NULL,  -- Data de publicação do produto
    TipoProduto VARCHAR(100) NOT NULL,  -- Tipo ou categoria do produto
    MarcaProd VARCHAR(100) NOT NULL,  -- Marca do produto
    ModeloProd VARCHAR(100) NOT NULL,  -- Modelo do produto
    Anunciante VARCHAR(255) NOT NULL,  -- Nome do anunciante do produto
    EnderecoFK INT,  -- Chave estrangeira para o endereço associado ao produto
    FOREIGN KEY (EnderecoFK) REFERENCES Endereco(CodigoEndereco)  -- Referência para a tabela Endereco
);


CREATE TABLE ProdutoNaCompra (
    IDProdnaComp INT PRIMARY KEY,  -- Identificador único do produto na compra
    NumSerieFK VARCHAR(50) NOT NULL,  -- Chave estrangeira para o número de série do produto
    IDCompFK INT NOT NULL,  -- Chave estrangeira para o identificador único do comprador
    IDProdFK INT NOT NULL,  -- Chave estrangeira para o identificador único do produto
    FOREIGN KEY (NumSerieFK) REFERENCES Produto(NumdeSerie),  -- Referência para o número de série do produto na tabela Produto
    FOREIGN KEY (IDCompFK) REFERENCES Comprador(IDComp),  -- Referência para o identificador único do comprador na tabela Comprador
    FOREIGN KEY (IDProdFK) REFERENCES Produto(IDProd)  -- Referência para o identificador único do produto na tabela Produto
);

CREATE TABLE Venda (
    IDVenda INT PRIMARY KEY,  -- Identificador único da venda
    IDProdFK INT NOT NULL,  -- Chave estrangeira para o identificador único do produto vendido
    IDVendFK INT NOT NULL,  -- Chave estrangeira para o identificador único do vendedor responsável pela venda
    DataVenda DATE NOT NULL,  -- Data da venda
    ValorVenda DECIMAL(10, 2) NOT NULL,  -- Valor da venda (com até 2 casas decimais)
    FOREIGN KEY (IDProdFK) REFERENCES Produto(IDProd),  -- Referência para o identificador único do produto na tabela Produto
    FOREIGN KEY (IDVendFK) REFERENCES Vendedor(IDVend)  -- Referência para o identificador único do vendedor na tabela Vendedor
);



