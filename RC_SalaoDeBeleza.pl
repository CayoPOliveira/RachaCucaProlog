/* A resposta será do tipo:
salao(moca(_,_,_,_,_,_),
      moca(_,_,_,_,_,_),
      moca(_,_,_,_,_,_),
      moca(_,_,_,_,_,_),
      moca(_,_,_,_,_,_)).
*/

resolve(Solucao) :-
  Solucao = salao(_,_,_,_,_),
% A mulher que vai Tingir os cabelos está exatamente à esquerda da Cláudia.
  exatamente_a_esquerda(Tingir, Claudia, Solucao),
  fazer(Tingir, tingir),
  nome(Claudia, claudia),
% A moça que está no meio vai Alisar os cabelos.
  terceira(Terceira, Solucao),
  fazer(Terceira, alisar),
% Quem vai Cortar os cabelos está em algum lugar entre a Fluminense e a que tem a bolsa Vermelha, que está à direita.
  entre_ordem(Cortar, Fluminense, Vermelha, Solucao),
  fazer(Cortar, cortar),
  gentilico(Fluminense, fluminense),
  bolsa(Vermelha, vermelha),
% Quem vai fazer Maquiagem está na primeira cadeira.
  primeira(Primeira, Solucao),
  fazer(Primeira, maquiagem),
% A Paulista está sentada exatamente à esquerda da Publicitária.
  exatamente_a_esquerda(Paulista, Publicitaria, Solucao),
  gentilico(Paulista, paulista),
  profissao(Publicitaria, publicitaria),
% A Mariana trabalha como Tradutora.
  moca(Mariana,Solucao),
  nome(Mariana, mariana),
  profissao(Mariana, tradutora),
% A Dentista está sentada na quarta cadeira.
  quarta(Quarta, Solucao),
  profissao(Quarta, dentista),
% A Cozinheira está sentada ao lado da Mineira.
  aolado(Cozinheira, Mineira, Solucao),
  profissao(Cozinheira, cozinheira),
  gentilico(Mineira, mineira),
% A Ana está exatamente à direita da mulher que veio fazer Maquiagem.
  exatamente_a_direita(Ana, Maquiagem, Solucao),
  nome(Ana, ana),
  fazer(Maquiagem, maquiagem),
% Tina está sentada em uma das pontas.
  uma_das_pontas(Tina, Solucao),
  nome(Tina, tina),
% A Paulista adora Limonada
  moca(Paulista, Solucao),
  gentilico(Paulista, paulista),
  suco(Paulista, limao),
% A dona da bolsa Vermelha está sentada em algum lugar à esquerda da que bebe suco de Morango.
  algum_lugar_a_esquerda(Vermelha, Morango, Solucao),
  suco(Morango, morango),
%  Quem bebe suco de Laranja está na segunda cadeira.
  segunda(Segunda, Solucao),
  suco(Segunda, laranja),
% A dona da bolsa Verde está sentada ao lado de quem bebe suco de Maracujá.
  aolado(Verde, Maracuja, Solucao),
  bolsa(Verde, verde),
  suco(Maracuja, maracuja),
% A Mineira está sentada exatamente à direita da dona da bolsa Branca.
  exatamente_a_direita(Mineira, Branca, Solucao),
  gentilico(Mineira, mineira),
  bolsa(Branca, branca),
% A Sul-rio-grandense adora suco de Morango.
  moca(Gaucha, Solucao),
  gentilico(Gaucha, gaucha),
  suco(Gaucha, morango),
% A Advogada está sentada ao lado da mulher que veio Cortar os cabelos.
  aolado(Advogada, Cortar, Solucao),
  profissao(Advogada, advogada),
  fazer(Cortar, cortar),
% A dona da bolsa Amarela está sentada exatamente à esquerda da dona da bolsa Branca.
  exatamente_a_esquerda(Amarela, Branca, Solucao),
  bolsa(Amarela, amarela),
  bolsa(Branca, branca),
% Fechamento
  moca(AA,Solucao),
  suco(AA, abacaxi),
  moca(BB, Solucao),
  gentilico(BB, baiana),
  moca(CC, Solucao),
  nome(CC, vivian),
  moca(DD, Solucao),
  bolsa(DD, azul),
  moca(EE, Solucao),
  fazer(EE, manicure).


bolsa(    moca(X,_,_,_,_,_), X).
gentilico(moca(_,X,_,_,_,_), X).
suco(     moca(_,_,X,_,_,_), X).
nome(     moca(_,_,_,X,_,_), X).
profissao(moca(_,_,_,_,X,_), X).
fazer(    moca(_,_,_,_,_,X), X).

moca(X,salao(X,_,_,_,_)).
moca(X,salao(_,X,_,_,_)).
moca(X,salao(_,_,X,_,_)).
moca(X,salao(_,_,_,X,_)).
moca(X,salao(_,_,_,_,X)).

primeira(X,salao(X,_,_,_,_)).
segunda( X,salao(_,X,_,_,_)).
terceira(X,salao(_,_,X,_,_)).
quarta(  X,salao(_,_,_,X,_)).
quinta(  X,salao(_,_,_,_,X)).

aolado(X,Y,salao(X,Y,_,_,_)).
aolado(X,Y,salao(Y,X,_,_,_)).
aolado(X,Y,salao(_,X,Y,_,_)).
aolado(X,Y,salao(_,Y,X,_,_)).
aolado(X,Y,salao(_,_,X,Y,_)).
aolado(X,Y,salao(_,_,Y,X,_)).
aolado(X,Y,salao(_,_,_,X,Y)).
aolado(X,Y,salao(_,_,_,Y,X)).

uma_das_pontas(X,salao(X,_,_,_,_)).
uma_das_pontas(X,salao(_,_,_,_,X)).

algum_lugar_a_direita(X,Y,salao(Y,X,_,_,_)).
algum_lugar_a_direita(X,Y,salao(Y,_,X,_,_)).
algum_lugar_a_direita(X,Y,salao(Y,_,_,X,_)).
algum_lugar_a_direita(X,Y,salao(Y,_,_,_,X)).
algum_lugar_a_direita(X,Y,salao(_,Y,X,_,_)).
algum_lugar_a_direita(X,Y,salao(_,Y,_,X,_)).
algum_lugar_a_direita(X,Y,salao(_,Y,_,_,X)).
algum_lugar_a_direita(X,Y,salao(_,_,Y,X,_)).
algum_lugar_a_direita(X,Y,salao(_,_,Y,_,X)).
algum_lugar_a_direita(X,Y,salao(_,_,_,Y,X)).

algum_lugar_a_esquerda(X,Y,Salao) :-
    algum_lugar_a_direita(Y,X,Salao).

exatamente_a_esquerda(X,Y,salao(X,Y,_,_,_)).
exatamente_a_esquerda(X,Y,salao(_,X,Y,_,_)).
exatamente_a_esquerda(X,Y,salao(_,_,X,Y,_)).
exatamente_a_esquerda(X,Y,salao(_,_,_,X,Y)).

exatamente_a_direita(X,Y,Salao) :-
   exatamente_a_esquerda(Y,X,Salao).

entre_exatamente(X,Y,Z,salao(Y,X,Z,_,_)).
entre_exatamente(X,Y,Z,salao(Z,X,Y,_,_)).
entre_exatamente(X,Y,Z,salao(_,Y,X,Z,_)).
entre_exatamente(X,Y,Z,salao(_,Z,X,Y,_)).
entre_exatamente(X,Y,Z,salao(_,_,Y,X,Z)).
entre_exatamente(X,Y,Z,salao(_,_,Z,X,Y)).

entre_ordem(X,Y,Z,salao(Y,X,Z,_,_)).
entre_ordem(X,Y,Z,salao(Y,X,_,Z,_)).
entre_ordem(X,Y,Z,salao(Y,X,_,_,Z)).
entre_ordem(X,Y,Z,salao(Y,_,X,Z,_)).
entre_ordem(X,Y,Z,salao(Y,_,X,_,Z)).
entre_ordem(X,Y,Z,salao(Y,_,_,X,Z)).
entre_ordem(X,Y,Z,salao(_,Y,X,Z,_)).
entre_ordem(X,Y,Z,salao(_,Y,X,_,Z)).
entre_ordem(X,Y,Z,salao(_,Y,_,X,Z)).
entre_ordem(X,Y,Z,salao(_,_,Y,X,Z)).
