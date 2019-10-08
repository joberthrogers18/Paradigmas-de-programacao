progenitor(pam, bob).
progenitor(tom, bob).
progenitor(tom, liz).
progenitor(bob, ann).
progenitor(bob, pat).
progenitor(pat, jim).

:- discontiguous([
    mulher/1, homem/1
]).

mulher(pam).
homem(tom).
homem(bob).
mulher(liz).
mulher(pat).
mulher(ann).
homem(jim).

robo(peter).
capaz_fazer(peter, armas).
machuca(armas, pedro).
humano(pedro).
proibido_fazer(R, B) :- robo(R), capaz_fazer(R, B), machuca(B, H), humano(H).

dados_pessoa(jobs, data(25, 5, 2018)).
dados_pessoa(melanie, data(5, 1, 2019)).
dados_pessoa(natalia, data(10, 3, 2001)).
dados_pessoa(emanuela, data(20, 1, 2005)).

verificar_acima_2016(Nome, Ano) :- dados_pessoa(Nome, data(_, _, Ano)), Ano > 2016.

% Exercicio de 01 da aula 1

progenitor(jose, joao).
progenitor(maria, joao).
progenitor(jose, ana).
progenitor(maria, ana).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(joao, mario).
progenitor(helena, carlos).
progenitor(mario, helena).


aluno(joao,calculo).
aluno(maria,calculo). 
aluno(joel,programacao). 
aluno(joel,estrutura).

frequenta(joao,puc). 
frequenta(maria,puc). 
frequenta(joel,ufrj).

professor(carlos,calculo). 
professor(ana,estrutura). 
professor(pedro,programacao).

funcionario(pedro,ufrj). 
funcionario(ana,puc). 
funcionario(carlos,puc).

verAlunosAula(Aluno, Professor, Universidade) :- aluno(Aluno, Turma), 
professor(Professor, Turma), frequenta(Aluno, Universidade), funcionario(Professor, Universidade).

:- dynamic casados/0, noivos/0, namorados/0, amigos/0.

casados(X,Y) :- (relacionamento(X,Y,casados);(Y,X,casados)). 
noivos(X,Y) :- (relacionamento(X,Y,noivos);(Y,X,noivos)). 
namorados(X,Y) :- (relacionamento(X,Y,namorados);(Y,X,namorados)). 
amigos(X,Y) :- (relacionamento(X,Y,amigos);(Y,X,amigos)).

relacionamento('Milene','Mauricio',casados). 
relacionamento('Ana','Paulo',namorados). 
relacionamento('Lívia','Pedro',casados). 
relacionamento('Lucas','Carla',amigos). 
relacionamento('Diego','Roberta',noivos).