use bookins;
select * from livro;
select * from categoria;
select * from categorialivro;
select * from estoque;
select * from usuario;
select * from venda;

#-------INSERT INTO-----------------------------------------------------------
#cadastro de livros
INSERT INTO livro (idLivro, nomeLivro, descricao_livro, preco_livro) VALUES ('','Percy Jackson','Mitologia e aventura','90,00');

#cadastro de categoria
INSERT INTO categoria (idCategoria, nome_categoria) VALUES ('','Mitologia'); 

#cadastro de um livro a uma categoria
INSERT INTO categorialivro VALUES (1,1);

#cadastro de um livro no estoque
INSERT INTO estoque (idEstoque, idLivro, quantidade, total) VALUES ('', '1', 2, 180.00);

#cadastro de um usuario
INSERT INTO usuario (idUsuario, email, usuario, senha) VALUES ('','usertest@exemplo.com','user test','12345');

#Realizacao de uma venda
INSERT INTO venda (idvenda, idLivro, idUsuario, Estoque_idEstoque) VALUES ('','1','1','1');

#------------SELECT----------------------------------------------------------------------------
#Select Livro
SELECT * FROM livro;
#Select categoria
SELECT * FROM categoria;
#Select

#Estoque 
SELECT livro.idLivro as id,
 livro.nomeLivro as nome,
 livro.descricao_livro as descricao,
 livro.preco_livro as preço,
 estoque.quantidade,
 estoque.total
from livro, estoque
;
#----------------UPDATE
UPDATE livro SET nomeLivro='Percy Jackson' WHERE idLivro = 1;

SELECT * FROM venda;
#junta todas as tabelas referente a venda

Select v.idVenda, l.nomeLivro, u.usuario from venda as v
inner join livro as l
on v.idLivro = l.idLivro
inner join usuario as u
on v.idUsuario = u.idUsuario;





