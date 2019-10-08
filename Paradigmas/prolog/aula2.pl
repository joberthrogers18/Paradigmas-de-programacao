ifThenElse(Condition, Action, _) :- Condition, !, Action.
ifThenElse(_, _, Else) :- Else.

:- dynamic printTerm/0, write_term/1.

printTerm :- write_term(ifThenElse(2>3, true, false)).

% Exemplo de cut
amigo(joana,ana).
amigo(maria,ana).
amigo(pedro,jose).
amigo(pedro,ana). 
um_unico_amigo(X,Y):-amigo(X,Y),!.

% usando o minimo

minimo(X,Y,X):-X =< Y, !. 
minimo(X,Y,Y):-X > Y, !.

% Uso do fail
cliente(ana,123,bradesco). 
cliente(jose,456,itau).

% Fail aqui faz o processo do backtracking para todos os clientes.
executa :- cliente(Nome,Conta,Agencia), 
write(Nome),write(' tem conta '),
write(Conta), write(' na agencia '),
write(Agencia),nl,fail.


estudante(jorge).
casado(jose).
estudante_solteiro(X) :- not(casado(X)), estudante(X).

% ------------------- Operadores _-----------------

ao_quadrado(X, Y) :- Y is X ** X.

interv_aberto(K,X1,X2):-K > X1,K < X2.

% read and write 

salve_cumpade :- read(X),write('Salve '),write(X).



escrevetab:-tab(15),write('Soma de 2 Elementos'),nl,nl,
tab(1),write('Entre com o 1o elemento: '),read(X), 
tab(1),write('Entre com o 2o elemento: '),read(Y),
tab(25),write('________'),nl,Total is X+Y, tab(28),write(Total),nl,nl,confirma.

confirma:-tab(1),write('Deseja calcular novamente (s/n): '), read(Resp),
Resp = s , escrevetab, ! .
