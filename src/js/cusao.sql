INSERT INTO Plataforma (plataformaNome) VALUES 
    ('PlayStation 4'),
    ('Xbox One'),
    ('PC'),
    ('Nintendo Switch');

INSERT INTO Jogo (jogosNome, jogosDescricao, jogosLancamento, jogosDesenvolvedora, jogosNota, jogosPlataforma) VALUES 
    ('Half Life', 'Um emocionante jogo de tiro em primeira pessoa.', '1998-11-19', 'Valve', 9.5, 3),
    ('The Legend of Zelda: Breath of the Wild', 'Um jogo de aventura da série Zelda.', '2017-03-03', 'Nintendo', 9.7, 4),
    ('Red Dead Redemption 2', 'Um épico de ação no velho oeste.', '2018-10-26', 'Rockstar Games', 9.8, 2),
	('The Witcher 3: Wild Hunt', 'Um RPG de mundo aberto com uma narrativa envolvente.', '2015-05-19', 'CD Projekt', 9.8, 3),
    ('Fortnite', 'Um jogo de batalha real extremamente popular.', '2017-07-25', 'Epic Games', 8.7, 1),
    ('Minecraft', 'Um jogo sandbox que permite construção e exploração.', '2011-11-18', 'Mojang', 9.0, 3),
    ('Assassin''s Creed Valhalla', 'Um jogo de ação e aventura da série Assassin''s Creed.', '2020-11-10', 'Ubisoft', 8.9, 2),
    ('Super Mario Odyssey', 'Um jogo de plataforma com o famoso encanador Mario.', '2017-10-27', 'Nintendo', 9.5, 4),
	('Overwatch', 'Um jogo de tiro em primeira pessoa com personagens únicos.', '2016-05-24', 'Blizzard Entertainment', 9.0, 3),
    ('Grand Theft Auto V', 'Um jogo de ação em mundo aberto com elementos de crime.', '2013-09-17', 'Rockstar Games', 9.5, 1),
    ('Cyberpunk 2077', 'Um RPG de ação futurista com uma narrativa imersiva.', '2020-12-10', 'CD Projekt', 7.0, 3),
    ('The Elder Scrolls V: Skyrim', 'Um RPG de mundo aberto com vasto mundo explorável.', '2011-11-11', 'Bethesda Game Studios', 9.3, 3),
    ('FIFA 22', 'Um simulador de futebol com gráficos realistas e jogabilidade envolvente.', '2021-10-01', 'EA Sports', 8.8, 1),
    ('Destiny 2', 'Um jogo de tiro online com elementos de MMO.', '2017-09-06', 'Bungie', 8.2, 3),
    ('Animal Crossing: New Horizons', 'Um jogo de simulação de vida em uma ilha deserta.', '2020-03-20', 'Nintendo', 9.4, 4),
    ('DOOM Eternal', 'Um jogo de tiro em primeira pessoa com ação intensa e combates frenéticos.', '2020-03-20', 'id Software', 9.1, 3),
    ('Among Us', 'Um jogo online de dedução e sobrevivência com amigos.', '2018-06-15', 'Innersloth', 8.5, 3),
    ('League of Legends', 'Um popular jogo de estratégia e batalha online.', '2009-10-27', 'Riot Games', 9.3, 3),
	('Hollow Knight', 'Um jogo indie de ação e aventura com estilo de arte único.', '2017-02-24', 'Team Cherry', 9.4, 3),
    ('The Last of Us Part II', 'Um emocionante jogo de ação e aventura com narrativa envolvente.', '2020-06-19', 'Naughty Dog', 9.7, 1),
    ('Hades', 'Um jogo roguelike com ação intensa e história cativante.', '2020-09-17', 'Supergiant Games', 9.5, 3);

SELECT Usuario.usuarioID, usuarioNome, pedidosID
FROM Usuario
LEFT JOIN Pedidos ON Usuario.usuarioPedidos = Pedidos.pedidosID;

SELECT Usuario.usuarioID, usuarioNome, SUM(transacaoValor) AS ValorTotal
FROM Usuario
JOIN Pedidos ON Usuario.usuarioPedidos = Pedidos.pedidosID
JOIN Transacao ON Pedidos.pedidosID = Transacao.transacaoPedido
GROUP BY Usuario.usuarioID, usuarioNome;

SELECT Carrinho.carrinhoID, Jogo.jogosNome
FROM Carrinho
JOIN Jogo ON Carrinho.carrinhoJogos = Jogo.jogosID
WHERE Carrinho.carrinhoID = 6;

SELECT Plataforma.plataformaNome, AVG(jogosNota) AS MediaNota
FROM Jogo
JOIN Plataforma ON Jogo.jogosPlataforma = Plataforma.plataformaID
GROUP BY Plataforma.plataformaNome;

SELECT Usuario.usuarioID, usuarioNome
FROM Usuario
JOIN Pedidos ON Usuario.usuarioPedidos = Pedidos.pedidosID
JOIN Transacao ON Pedidos.pedidosID = Transacao.transacaoPedido
WHERE Transacao.transacaoValor > 0.0;

SELECT Usuario.usuarioID, usuarioNome, SUM(transacaoValor) AS ValorTotalGasto
FROM Usuario
JOIN Pedidos ON Usuario.usuarioPedidos = Pedidos.pedidosID
JOIN Transacao ON Pedidos.pedidosID = Transacao.transacaoPedido
GROUP BY Usuario.usuarioID, usuarioNome;