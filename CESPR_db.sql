
CREATE DATABASE cespr_bd;
GO

USE cespr_bd;
GO

CREATE TABLE pessoas
(
    codigo INT NOT NULL IDENTITY,
    nome VARCHAR(60) NOT NULL,
    endereco VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    CONSTRAINT pk_pessoas PRIMARY KEY(codigo)
);
GO

CREATE TABLE clientes
(
    pessoa_codigo INT NOT NULL,
    CONSTRAINT pk_clientes PRIMARY KEY(pessoa_codigo),
    CONSTRAINT fk_clientes_pessoas FOREIGN KEY(pessoa_codigo)
        REFERENCES pessoas(codigo)
);
GO

CREATE TABLE vendedores
(
    pessoa_codigo INT NOT NULL,
    salario DECIMAL(10,2) NOT NULL DEFAULT 1500,
    CONSTRAINT pk_vendedores PRIMARY KEY(pessoa_codigo),
    CONSTRAINT fk_vendedores_pessoas FOREIGN KEY(pessoa_codigo)
        REFERENCES pessoas(codigo),
    CONSTRAINT ck_vendedores_salario CHECK(salario >= 1500)
);
GO

CREATE TABLE pedidos
(
    id INT NOT NULL IDENTITY,
    data DATETIME NOT NULL DEFAULT GETDATE(),
    status VARCHAR(20) NOT NULL,
    data_prevista DATETIME NOT NULL,
    cliente_codigo INT NOT NULL,
    vendedor_codigo INT NOT NULL,

    CONSTRAINT pk_pedidos PRIMARY KEY(id),
    CONSTRAINT fk_pedidos_clientes FOREIGN KEY(cliente_codigo)
        REFERENCES clientes(pessoa_codigo),
    CONSTRAINT fk_pedidos_vendedores FOREIGN KEY(vendedor_codigo)
        REFERENCES vendedores(pessoa_codigo)
);
GO

CREATE TABLE modelos
(
    id INT NOT NULL IDENTITY,
    nome VARCHAR(60) NOT NULL,
    obs VARCHAR(255),
    CONSTRAINT pk_modelos PRIMARY KEY(id)
);
GO

CREATE TABLE pedido_modelo
(
    pedido_id INT NOT NULL,
    modelo_id INT NOT NULL,
    qtd INT NOT NULL,
    obs VARCHAR(255),
    CONSTRAINT pk_pedido_modelo PRIMARY KEY(pedido_id, modelo_id),
    CONSTRAINT fk_pm_pedidos FOREIGN KEY(pedido_id)
        REFERENCES pedidos(id),
    CONSTRAINT fk_pm_modelos FOREIGN KEY(modelo_id)
        REFERENCES modelos(id),
    CONSTRAINT ck_pm_qtd CHECK(qtd > 0)
);
GO


-- INSERTS

-- CLIENTES

INSERT INTO pessoas VALUES ('Cliente 1', 'Rua 1', '(11)11111-1111');
INSERT INTO pessoas VALUES ('Cliente 2', 'Rua 2', '(22)22222-2222');
INSERT INTO pessoas VALUES ('Cliente 3', 'Rua 3', '(33)33333-3333');
INSERT INTO pessoas VALUES ('Cliente 4', 'Rua 4', '(44)44444-4444');
INSERT INTO pessoas VALUES ('Cliente 5', 'Rua 5', '(55)55555-5555');
INSERT INTO pessoas VALUES ('Cliente 6', 'Rua 6', '(66)66666-6666');
INSERT INTO pessoas VALUES ('Cliente 7', 'Rua 7', '(77)77777-7777');
INSERT INTO pessoas VALUES ('Cliente 8', 'Rua 8', '(88)88888-8888');
INSERT INTO pessoas VALUES ('Cliente 9', 'Rua 9', '(99)99999-9999');
INSERT INTO pessoas VALUES ('Cliente 10', 'Rua 10', '(10)10101-1010');

INSERT INTO clientes VALUES (1);
INSERT INTO clientes VALUES (2);
INSERT INTO clientes VALUES (3);
INSERT INTO clientes VALUES (4);
INSERT INTO clientes VALUES (5);
INSERT INTO clientes VALUES (6);
INSERT INTO clientes VALUES (7);
INSERT INTO clientes VALUES (8);
INSERT INTO clientes VALUES (9);
INSERT INTO clientes VALUES (10);

-- VENDEDORES

INSERT INTO pessoas VALUES ('Vendedor 1', 'Av 1', '(11)11111-1111');
INSERT INTO pessoas VALUES ('Vendedor 2', 'Av 2', '(22)22222-2222');
INSERT INTO pessoas VALUES ('Vendedor 3', 'Av 3', '(33)33333-3333');
INSERT INTO pessoas VALUES ('Vendedor 4', 'Av 4', '(44)44444-4444');
INSERT INTO pessoas VALUES ('Vendedor 5', 'Av 5', '(55)55555-5555');
INSERT INTO pessoas VALUES ('Vendedor 6', 'Av 6', '(66)66666-6666');
INSERT INTO pessoas VALUES ('Vendedor 7', 'Av 7', '(77)77777-7777');
INSERT INTO pessoas VALUES ('Vendedor 8', 'Av 8', '(88)88888-8888');
INSERT INTO pessoas VALUES ('Vendedor 9', 'Av 9', '(99)99999-9999');
INSERT INTO pessoas VALUES ('Vendedor 10', 'Av 10', '(10)10000-1000');

INSERT INTO vendedores VALUES (11, 1800);
INSERT INTO vendedores VALUES (12, 2000);
INSERT INTO vendedores VALUES (13, 2200);
INSERT INTO vendedores VALUES (14, 2500);
INSERT INTO vendedores VALUES (15, 1700);
INSERT INTO vendedores VALUES (16, 3000);
INSERT INTO vendedores VALUES (17, 2600);
INSERT INTO vendedores VALUES (18, 2800);
INSERT INTO vendedores VALUES (19, 3100);
INSERT INTO vendedores VALUES (20, 3300);

-- MODELOS

INSERT INTO modelos VALUES ('Modelo A', 'OK');
INSERT INTO modelos VALUES ('Modelo B', 'OK');
INSERT INTO modelos VALUES ('Modelo C', 'OK');
INSERT INTO modelos VALUES ('Modelo D', 'OK');
INSERT INTO modelos VALUES ('Modelo E', 'OK');
INSERT INTO modelos VALUES ('Modelo F', 'OK');
INSERT INTO modelos VALUES ('Modelo G', 'OK');
INSERT INTO modelos VALUES ('Modelo H', 'OK');
INSERT INTO modelos VALUES ('Modelo I', 'OK');
INSERT INTO modelos VALUES ('Modelo J', 'OK');

-- PEDIDOS

INSERT INTO pedidos (status, cliente_codigo, vendedor_codigo, data_prevista) VALUES
 ('Aguardando', 1, 11, '2025-01-20T00:00:00'),
 ('Aguardando', 2, 12, '2025-01-22T00:00:00'),
 ('Aguardando', 3, 13, '2025-01-25T00:00:00'),
 ('Aguardando', 4, 14, '2025-01-28T00:00:00'),
 ('Aguardando', 5, 15, '2025-02-01T00:00:00'),
 ('Entregue',   6, 16, '2025-02-03T00:00:00'),
 ('Entregue',   7, 17, '2025-02-06T00:00:00'),
 ('Aguardando', 8, 18, '2025-02-08T00:00:00'),
 ('Aguardando', 9, 19, '2025-02-10T00:00:00'),
 ('Entregue',  10, 20, '2025-02-12T00:00:00');


-- PEDIDO-MODELO

INSERT INTO pedido_modelo VALUES (1, 1, 2, 'OK');
INSERT INTO pedido_modelo VALUES (2, 2, 1, 'OK');
INSERT INTO pedido_modelo VALUES (3, 3, 3, 'OK');
INSERT INTO pedido_modelo VALUES (4, 4, 1, 'OK');
INSERT INTO pedido_modelo VALUES (5, 5, 3, 'OK');
INSERT INTO pedido_modelo VALUES (6, 6, 1, 'OK');
INSERT INTO pedido_modelo VALUES (7, 7, 2, 'OK');
INSERT INTO pedido_modelo VALUES (8, 8, 2, 'OK');
INSERT INTO pedido_modelo VALUES (9, 9, 5, 'OK');
INSERT INTO pedido_modelo VALUES (10, 10, 1, 'OK');
