create database Hogwarts;
use Hogwarts;

create table ocupacao(
id bigint auto_increment not null,
cargo varchar (100) not null,
primary key (id)
);

create table usuarios(
id bigint auto_increment not null,
nome varchar (150) not null,
email varchar (150) not null,
nasc date not null,
senha varchar (8) not null,
data_cadastro datetime not null default now(),
condicao enum ('ativo','inativo') not null,
ocupacao_id bigint not null,
acesso enum ('Admin', 'Gestor', 'Usuário', 'Visitante'),
primary key (id),
foreign key (ocupacao_id) references ocupacao(id)
);

create table equipamento(
id bigint auto_increment not null,
nome varchar (150) not null,
primary key (id)
);

create table local(
id bigint auto_increment not null,
nome varchar (150) not null,
bloco enum ('A','B','C','D') not null,
qtde_pessoas bigint not null,
primary key (id)
);

create table eq_local(
id bigint auto_increment not null,
local_id bigint not null,
equip_id bigint not null,
qtde_eq int not null,
primary key (id),
foreign key (local_id) references local(id),
foreign key (equip_id) references equipamento(id)
);

create table evento(
id bigint auto_increment not null,
nome varchar (150) not null,
data_ev date not null,
inicio time not null,
fim time not null,
responsavel varchar (150) not null,
num_part int not null,
disponiveis int not null,
local_id bigint not null,
foreign key (local_id) references local(id),
primary key (id)
);

create table checkin(
id bigint auto_increment not null,
evento_id bigint not null,
inicio datetime not null,
fim datetime not null,
usuario_id bigint not null,
primary key (id),
foreign key (evento_id) references evento(id),
foreign key (usuario_id) references usuarios(id)
);

insert into ocupacao (cargo) values ('Aluno'), ('Professor'), ('Coordenador'), ('Diretor'), ('Assistente Social'), ('Secretaria');

insert into usuarios (nome, email, nasc, senha, condicao, ocupacao_id, acesso) values ('Jessica', 'jessicasantanamss@gmail.com', '2000-11-19', '12345678', 'ativo', 1, 'Admin'),
('Amanda', 'amanda@gmail.com', '2001-01-19', '12346678', 'ativo', 2, 'Gestor'), ('Carlos', 'carlos@gmail.com', '1987-07-03', '18346678', 'ativo', 6, 'Visitante'), 
('Dominique', 'dominique@gmail.com', '1991-03-27', '86346678', 'ativo', 3, 'Usuário'), ('Rafaela', 'rafaela@gmail.com', '1990-05-19', '72346678', 'inativo', 5, 'Visitante'),
('José', 'jose@gmail.com', '1981-08-24', '14546678', 'ativo', 2, 'Visitante'), ('Joaquim', 'joaquim@gmail.com', '1995-09-01', '54646678', 'inativo', 4, 'Admin');

insert into equipamento(nome) values ('Computador'), ('Notebook'), ('Tablet'), ('Ar condicionado'), ('Projetor'), ('Tv Smart');

insert into local (nome, bloco, qtde_pessoas) values ('Palco 1', 'C', 25), ('Salão de Festas', 'A', 50), ('Sala de Jogos', 'A', 40), ('Palco 2', 'D', 50), ('Pátio Central', 'B', 75),
('Sala 1', 'B', 45), ('Sala 2', 'B', 40), ('Sala 3', 'D', 50);

insert into eq_local (local_id, equip_id, qtde_eq) values ('1', '5', 2), ('2', '1', 1), ('2', '5', 1), ('3', '1', 3), ('3', '2', 2), ('3', '4', 1), ('4', '5', 1), ('4', '4', 1), ('5', '1', 1),
('5', '5', 1), ('6', '1', 10), ('6', '2', 5), ('6', '4', 1), ('7', '1', 20), ('7', '2', 2), ('7', '4', 2), ('8', '1', 10), ('8', '6', 2), ('8', '4', 1), ('8', '3', 10);

insert into evento (nome, data_ev, inicio, fim, responsavel, num_part, disponiveis, local_id) values ('Festa Anual', '2023-12-10', '19:00', '22:00', 'Jessica', 100, 100, 2), 
('Aula de Revisão', '2023-06-20', '18:00', '20:00', 'Monica', 30, 20, 8), ('Baile de Formatura', '2023-11-29', '19:00', '23:00', 'Carlos', 100, 10, 1),
('Plantão de Dúvidas', '2023-07-15', '10:00', '12:00', 'Amanda', 30, 30, 6), ('Feira de Ciências', '2023-06-19', '10:00', '19:00', 'Joaquim', 150, 100, 5),
('Aula de Banco de Dados', '2023-05-15', '18:45', '23:15', 'André', 20, 0, 7);

insert into checkin (evento_id, inicio, fim, usuario_id) values (1, '2023-11-10 19:00', '2023-12-09 19:00', 1), (1, '2023-11-10 19:00', '2023-12-09 19:00', 5), (1, '2023-11-10 19:00', '2023-12-09 19:00', 5),
(2, '2023-06-10 19:00', '2023-06-20 17:00', 2), (2, '2023-06-10 19:00', '2023-06-20 17:00', 1), (3, '2023-06-01 19:00', '2023-11-20 17:00', 3), (3, '2023-06-01 19:00', '2023-11-20 17:00', 4),
(3, '2023-06-01 19:00', '2023-11-20 17:00', 2), (5, '2023-03-30 19:00', '2023-06-18 20:00', 3), (5, '2023-03-30 19:00', '2023-06-18 20:00', 6),  (6, '2023-05-04 10:00', '2023-05-14 10:00', 6), 
(6, '2023-05-04 10:00', '2023-05-14 10:00', 1), (6, '2023-05-04 10:00', '2023-05-14 10:00', 5), (6, '2023-05-04 10:00', '2023-05-14 10:00', 4);


