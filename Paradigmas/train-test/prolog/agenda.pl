:- dynamic agenda/3. 

agenda(joberth, 'joberth@gmail.com' , 12344321).
agenda(amanda, 'amanda@gmail.com' , 35634748).
agenda(icaro, 'icaro@gmail.com' , 87652134).

lista_todo :- 
    agenda(Nome, Email, Telefone),
    write('Nome: '),
    writeln(Nome),
    write('Email: '),
    writeln(Email),
    write('Telefone: '),
    write(Telefone),
    writeln('\n'),
    fail. 

print_nome([]).
print_nome([H|T]) :- writeln(H), print_nome(T).

lista_alt :- 
    findall( Nome, agenda(Nome, _, _), Vetor),
    print_nome(Vetor). 

existe_contato(Nome, Email, Telefone) :- 
agenda(Nome, Email, Telefone),
true.

adicionar_contato :-
    writeln('Digite o nome: '),
    read(Nome),
    writeln('Digite o email'),
    read(Email),
    writeln('Digite telefone:'),
    read(Telefone),
    (
        not(existe_contato(Nome, Email, Telefone)) ->
            writeln('Contato registrado com sucesso'),
            assertz(agenda(Nome, Email, Telefone))
        ;
            writeln('Nao foi possivel cadastrar')
    ). 

eliminar_email :-
    read(Email),
    (
        agenda(_, Email, _) ->
            retract(agenda(_, Email, _)),
            write('Contato removido')
        ;
            write('Nao foi possivel remover o contato')    
    ).
