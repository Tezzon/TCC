CREATE TABLE Bairro (
    IDBairro INT PRIMARY KEY,  -- Identificador �nico do bairro
    NomeBairro VARCHAR(255) NOT NULL  -- Nome do bairro
);
CREATE TABLE CEP (
    NumeroCEP VARCHAR(20) PRIMARY KEY,  -- N�mero do CEP, agora � a chave prim�ria
    -- Outros campos, se houver
);


CREATE TABLE Sexo (
    IDSexo INT PRIMARY KEY,  -- Identificador �nico do sexo
    Tipo VARCHAR(50) NOT NULL  -- Tipo de sexo (por exemplo, Masculino, Feminino, Outro)
);

CREATE TABLE Cidade (
    IDCidade INT PRIMARY KEY,  -- Identificador �nico da cidade
    NomeCidade VARCHAR(255) NOT NULL  -- Nome da cidade
);

CREATE TABLE Estado (
    IDEstado INT PRIMARY KEY,  -- Identificador �nico do estado
    NomeEstado VARCHAR(255) NOT NULL  -- Nome do estado
);

CREATE TABLE NumeroCasa (
    IDNumCasa INT PRIMARY KEY,  -- Identificador �nico do n�mero da casa
    NumeroCasa VARCHAR(10) NOT NULL  -- N�mero da casa
);
CREATE TABLE Pais (
    IDPais INT PRIMARY KEY,  -- Identificador �nico do pa�s
    NomePais VARCHAR(255) NOT NULL  -- Nome do pa�s
);
CREATE TABLE Rua (
    IDRua INT PRIMARY KEY,  -- Identificador �nico da rua
    NomeRua VARCHAR(255) NOT NULL  -- Nome da rua
);

CREATE TABLE Vendedor (
    IDVend INT PRIMARY KEY,  -- Identificador �nico do vendedor
    CPVVend CHAR(11) NOT NULL,  -- CPF do vendedor (11 caracteres para formato XXX.XXX.XXX-XX)
    NasVend DATE NOT NULL,  -- Data de nascimento do vendedor
    IDSexoFK INT NOT NULL,  -- Chave estrangeira para o sexo do vendedor
    EmailVend VARCHAR(255) NOT NULL,  -- E-mail do vendedor
    LoginVend VARCHAR(50) NOT NULL,  -- Login do vendedor
    TelVend VARCHAR(15),  -- Telefone do vendedor
    IDEnderecoFK INT NOT NULL,  -- Chave estrangeira para o endere�o do vendedor
    FOREIGN KEY (IDSexoFK) REFERENCES Sexo(IDSexo),  -- Refer�ncia para a tabela Sexo
    FOREIGN KEY (IDEnderecoFK) REFERENCES Endereco(CodigoEndereco)  -- Refer�ncia para a tabela Endereco
);
CREATE TABLE Comprador (
    IDComp INT PRIMARY KEY,  -- Identificador �nico do comprador
    CPFComp CHAR(11) NOT NULL,  -- CPF do comprador (11 caracteres para formato XXX.XXX.XXX-XX)
    NasComp DATE NOT NULL,  -- Data de nascimento do comprador
    IDSexoFK INT NOT NULL,  -- Chave estrangeira para o sexo do comprador
    EmailComp VARCHAR(255) NOT NULL,  -- E-mail do comprador
    LoginComp VARCHAR(50) NOT NULL,  -- Login do comprador
    TelComp VARCHAR(15),  -- Telefone do comprador
    IDEnderecoFK INT NOT NULL,  -- Chave estrangeira para o endere�o do comprador
    FOREIGN KEY (IDSexoFK) REFERENCES Sexo(IDSexo),  -- Refer�ncia para a tabela Sexo
    FOREIGN KEY (IDEnderecoFK) REFERENCES Endereco(CodigoEndereco)  -- Refer�ncia para a tabela Endereco
);
CREATE TABLE Endereco (
    CodigoEndereco INT PRIMARY KEY,  -- Identificador �nico do endere�o
    IDBairro INT NOT NULL,  -- Chave estrangeira para o bairro
    NumeroCEP VARCHAR(20) NOT NULL,  -- Chave estrangeira para o CEP
    IDCidade INT NOT NULL,  -- Chave estrangeira para a cidade
    IDEstado INT NOT NULL,  -- Chave estrangeira para o estado
    IDNumCasa INT NOT NULL,  -- Chave estrangeira para o n�mero da casa
    IDPais INT NOT NULL,  -- Chave estrangeira para o pa�s
    IDRua INT NOT NULL,  -- Chave estrangeira para a rua
    FOREIGN KEY (IDBairro) REFERENCES Bairro(IDBairro),  -- Refer�ncia para a tabela Bairro
    FOREIGN KEY (NumeroCEP) REFERENCES CEP(NumeroCEP),  -- Refer�ncia para a tabela CEP
    FOREIGN KEY (IDCidade) REFERENCES Cidade(IDCidade),  -- Refer�ncia para a tabela Cidade
    FOREIGN KEY (IDEstado) REFERENCES Estado(IDEstado),  -- Refer�ncia para a tabela Estado
    FOREIGN KEY (IDNumCasa) REFERENCES NumeroCasa(IDNumCasa),  -- Refer�ncia para a tabela NumeroCasa
    FOREIGN KEY (IDPais) REFERENCES Pais(IDPais),  -- Refer�ncia para a tabela Pais
    FOREIGN KEY (IDRua) REFERENCES Rua(IDRua)  -- Refer�ncia para a tabela Rua
);


CREATE TABLE Produto (
    IDProd INT PRIMARY KEY,  -- Identificador �nico do produto
    DescricaoProd VARCHAR(255) NOT NULL,  -- Descri��o do produto
    ValorProd DECIMAL(10, 2) NOT NULL,  -- Valor do produto (com at� 2 casas decimais)
    FotoProd VARCHAR(255),  -- Foto ou caminho para a foto do produto
    NumdeSerie VARCHAR(50) NOT NULL UNIQUE,  -- N�mero de s�rie do produto (�nico)
    DataPublicacao DATE NOT NULL,  -- Data de publica��o do produto
    TipoProduto VARCHAR(100) NOT NULL,  -- Tipo ou categoria do produto
    MarcaProd VARCHAR(100) NOT NULL,  -- Marca do produto
    ModeloProd VARCHAR(100) NOT NULL,  -- Modelo do produto
    Anunciante VARCHAR(255) NOT NULL,  -- Nome do anunciante do produto
    EnderecoFK INT,  -- Chave estrangeira para o endere�o associado ao produto
    FOREIGN KEY (EnderecoFK) REFERENCES Endereco(CodigoEndereco)  -- Refer�ncia para a tabela Endereco
);


CREATE TABLE ProdutoNaCompra (
    IDProdnaComp INT PRIMARY KEY,  -- Identificador �nico do produto na compra
    NumSerieFK VARCHAR(50) NOT NULL,  -- Chave estrangeira para o n�mero de s�rie do produto
    IDCompFK INT NOT NULL,  -- Chave estrangeira para o identificador �nico do comprador
    IDProdFK INT NOT NULL,  -- Chave estrangeira para o identificador �nico do produto
    FOREIGN KEY (NumSerieFK) REFERENCES Produto(NumdeSerie),  -- Refer�ncia para o n�mero de s�rie do produto na tabela Produto
    FOREIGN KEY (IDCompFK) REFERENCES Comprador(IDComp),  -- Refer�ncia para o identificador �nico do comprador na tabela Comprador
    FOREIGN KEY (IDProdFK) REFERENCES Produto(IDProd)  -- Refer�ncia para o identificador �nico do produto na tabela Produto
);

CREATE TABLE Venda (
    IDVenda INT PRIMARY KEY,  -- Identificador �nico da venda
    IDProdFK INT NOT NULL,  -- Chave estrangeira para o identificador �nico do produto vendido
    IDVendFK INT NOT NULL,  -- Chave estrangeira para o identificador �nico do vendedor respons�vel pela venda
    DataVenda DATE NOT NULL,  -- Data da venda
    ValorVenda DECIMAL(10, 2) NOT NULL,  -- Valor da venda (com at� 2 casas decimais)
    FOREIGN KEY (IDProdFK) REFERENCES Produto(IDProd),  -- Refer�ncia para o identificador �nico do produto na tabela Produto
    FOREIGN KEY (IDVendFK) REFERENCES Vendedor(IDVend)  -- Refer�ncia para o identificador �nico do vendedor na tabela Vendedor
);



