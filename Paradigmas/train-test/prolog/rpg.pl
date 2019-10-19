:- dynamic ehUm.

:-op(900, xfx, [ehUm]).

:-dynamic vence/2.
:-dynamic ehUm/2.

fada ehUm ninfa.
guerreiro ehUm humano.
conselheiro ehUm humano.
lobisomem ehUm meioHumano.
centauro ehUm meioHumano.
fauno ehUm meioHumano.

vence(guerreiro, lobisomem).
vence(fada, conselheiro).
vence(conselheiro, fauno).
vence(centauro, fauno).
vence(centauro, lobisomem).
vence(guerreiro, centauro).
vence(guerreiro, fauno).
vence(guerreiro, conselheiro).

adicionarCriatura :-
    write('Criatura: '),
    read(Criatura),
    write('Tipo: '),
    read(Tipo),
    retract(vence(Criatura, Tipo)),
    assertz(vence(Criatura, Tipo)).

removerCriaturas([]).
removerCriaturas([H | T]):- 
    write('Criatura removida: '),
    writeln(H),
    retract(H ehUm _),
    removerCriaturas(T).

removerTipo :-
    write('Tipo: '),
    read(Tipo),
    findall(Criatura, Criatura ehUm Tipo, Criaturas),
    removerCriaturas(Criaturas). 

quemGanhou(Criatura1, Criatura2) :-
    (
        vence(Criatura1, Criatura2) -> 
            write(Criatura1),
            writeln(' ganhou')
        ;
        vence(Criatura2, Criatura1) ->
            write(Criatura2),
            writeln(' ganhou')
        ;
            writeln('Essas criaturas não entram em confronto!')
    ).
    

