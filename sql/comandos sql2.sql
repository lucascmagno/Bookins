select * from livro;
select * from usuario;
select * from venda;

insert into usuario values (null, 'lucascmagno@gmail.com','lucas','12345');
insert into livro values (null,'Percy Jackson e o ladrão de raios','Mitologia grega e muita aventura','79.99');
insert into livro values (null,'Magnus Chase e a espada do verão','Mitologia grega e muita aventura','79.99');
insert into venda values (null, 2, 1, 1);

INSERT INTO venda(idLivro, idUsuario, quantidade) VALUES (1,1,1);


select * from venda;
#Lista todas as vendas
SELECT v.idVenda as id, u.usuario, l.nomeLivro as livro, l.preco_livro as preco, v.quantidade
FROM usuario u
INNER JOIN Venda v ON u.idUsuario = v.idUsuario
INNER JOIN Livro l ON v.idLivro = l.idLivro;

#Lista todas as vendas de acordo com o usuario
SELECT v.idVenda as id, u.usuario, l.nomeLivro as livro, l.preco_livro as preco, v.quantidade
FROM usuario u
INNER JOIN Venda v ON u.idUsuario = v.idUsuario
INNER JOIN Livro l ON v.idLivro = l.idLivro
WHERE u.usuario = 'luck'
order by v.idVenda;


Select * from usuario
inner join livro
on usuario.idUsuario = venda.idUsuario
and livro.idLivro = venda.idVenda; 