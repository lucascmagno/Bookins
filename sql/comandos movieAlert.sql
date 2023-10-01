select * from filme;
select * from usuario;
select * from favorito;

insert into favorito values (null, 1, 1);

#pagina de listagem de todos
SELECT fav.idfavorito as id, u.usuario, f.titulo AS filme, f.data_lancamento, f.duracao
FROM usuario u
INNER JOIN favorito fav ON u.idUsuario = fav.idUsuario
INNER JOIN filme f ON fav.idFilme = f.idFilme
order by fav.idfavorito;


#pagina do usuario logado
SELECT fav.idfavorito, f.titulo AS filme, f.data_lancamento, f.duracao
FROM usuario u
INNER JOIN favorito fav ON u.idUsuario = fav.idUsuario
INNER JOIN filme f ON fav.idFilme = f.idFilme
WHERE u.usuario = 'Luck'
order by fav.idFavorito;
