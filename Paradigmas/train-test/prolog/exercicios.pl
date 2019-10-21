
% :- op(900, xfx, [ehUm, gostaDe]).

% joao ehUm passaro.
% pedro ehUm peixe.
% maria ehUm minhoca.
% gato ehUm amigo.

% passaro gostaDe minhoca.
% gato gostaDe peixe.
% gato gostaDe passaro.
% amigo gostaDe amigo.

% 3) Exercício de alunos de uma universidade

aluno(joao, calculo).
aluno(maria, calculo).
aluno(joel, programacao).
aluno(joel, estrutura).
frequenta(joao, puc).
frequenta(maria, puc).
frequenta(joel, ufrj).
professor(carlos, calculo).
professor(ana_paula, estrutura).
professor(pedro, programacao).
funcionario(pedro, ufrj).
funcionario(ana_paula, puc).
funcionario(carlos, puc). 

aluno_professor(NomeProfessor, NomeAluno) :-
    aluno(NomeAluno, Materia),
    frequenta(NomeAluno, Universidade),
    funcionario(NomeProfessor, Universidade),
    professor(NomeProfessor, Materia).

all_uni(Aluno, Professor , Universidade) :-
    frequenta(Aluno, Universidade),
    funcionario(Professor, Universidade).

% 4) Verificar notas

nota(joao,5.0).
nota(maria,6.0).
nota(joana,8.0).
nota(mariana,9.0).
nota(cleuza,8.5).
nota(jose,6.5).
nota(jaoquim,4.5).
nota(mara,4.0).
nota(mary,10.0). 

verificar_nota(Aluno) :-
    nota(Aluno, Nota),
    (
        Nota >= 0, Nota =< 4.9 ->
            write(Aluno),
            writeln(' está reprovado' ), !
        ;
        Nota >= 5, Nota =< 6.9 ->
            write(Aluno),
            writeln(' está de recuperação' ), !
        ;
        Nota >= 7, Nota =< 10 ->
            write(Aluno),
            writeln(' está aprovado'), !
    );
    writeln("Não existe nome na base de dados").

% 5) Catalogos de filmes

:- dynamic filmeClassico/2. 

infoFilme(amnesia, suspense, nolan, 2000, 113).
infoFilme(babel, drama, innaritu, 2006, 142).
infoFilme(capote, drama, miller, 2005, 98).
infoFilme(casablanca, romance, curtis, 1942, 102).
infoFilme(matrix, ficcao, wachowsk, 1999, 136).
infoFilme(rebecca, suspense, hitchcock, 1940, 130).
infoFilme(shrek, aventura, adamson, 2001, 90).
infoFilme(sinais, ficcao, shymalan, 2002, 106).
infoFilme(titanic, romance, cameron, 1997, 194).
infoFilme(superman, aventura, donner, 1978, 143).

diretorTitanic :- 
    infoFilme(titanic, _, Diretor, _, _ ),
    write(Diretor),
    writeln(" é diretor do titanic").

filmeSuspense :-
    infoFilme(Nome, suspense, _, _, _),
    writeln(Nome),
    fail.

getAllFilmesSuspense :-
    writeln('Filmes de suspense'), nl, nl,
    filmeSuspense.

filmesDoDrone :-
    infoFilme(Nome, _, donner, _, _),
    writeln(Nome),
    fail.

anoSinais :-
    infoFilme(sinais, _, _, Ano, _),
    writeln(Ano).

filmesMenorDuracao :-
    infoFilme(Nome, _, _, _, Duracao),
    (
        Duracao < 100 ->
            writeln(Nome)    
    ),
    fail.

filmesEntraAnos :-
    infoFilme(Nome, _, _, Ano, _),
    (
        Ano >= 2002, Ano =< 2005 ->
            writeln(Nome)    
    ),
    fail.

% getClassico :- 
%     infoFilme(Nome, _, _, Ano, _),
%     (
%         Ano >= 1980 ->
%             write(Nome),
%             retract(filmeClassico(Nome, Ano));
%             assertz(filmeClassico(Nome, Ano))
%     ),
%     fail.
    

classico(Filmes) :-
    findall(Nome, (infoFilme(Nome, _, _, Ano, _), Ano < 1980), Filmes). 

% teste(Final) :-
%     findall(Nome, infoFilme(Nome, _, _, _, _), Final).


