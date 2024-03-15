% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(32 000 000)).  % limit term space (32Mb)
:- set_prolog_stack(local,  limit(8 000 000)).  % limit environment space

% Your program goes here
discipline("Математика").
discipline("Фізика").
discipline("Програмування").

participate("Ivan", Discipline) :- discipline(Discipline), Discipline \= "Фізика".
participate("Petro", Discipline) :- discipline(Discipline), Discipline \= "Програмування".
participate("Mykhailo", Discipline) :- discipline(Discipline), Discipline \= "Математика".
participate("Sergiy", Discipline) :- discipline(Discipline), Discipline \= "Програмування".

solve :-
    participate("Ivan", IvanDiscipline), 
    participate("Sergiy", SergiyDiscipline), IvanDiscipline = SergiyDiscipline,
    participate("Petro", PetroDiscipline),
    participate("Mykhailo", MykhailoDiscipline),
    
    PetroDiscipline \= programming,
    MykhailoDiscipline \= mathematics,
    
    IvanDiscipline \= PetroDiscipline, IvanDiscipline \= MykhailoDiscipline,
    SergiyDiscipline \= PetroDiscipline, SergiyDiscipline \= MykhailoDiscipline,
    PetroDiscipline \= MykhailoDiscipline,

    write('Іван виступав в '), write(IvanDiscipline), nl,
    write('Сергій виступав в '), write(SergiyDiscipline), nl,
    write('Петро виступав в '), write(PetroDiscipline), nl,
    write('Михайло виступав в '), write(MykhailoDiscipline), nl.


/** <examples> Your example queries go here, e.g.
?- solve.
*/
