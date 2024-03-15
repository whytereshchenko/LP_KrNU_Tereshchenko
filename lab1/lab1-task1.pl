% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(32 000 000)).  % limit term space (32Mb)
:- set_prolog_stack(local,  limit(8 000 000)).  % limit environment space

% Your program goes here
male("Ivan").
male("Oleksandr").
male("Nester").
male("Viktor").
male("Pavlo").
male("Semen").
male("Oleg").
male("Andrii").

female("Larisa").
female("Maria").
female("Olga").
female("Natasha").
female("Anna").
female("Alla").
female("Inna").

parent("Ivan", "Pavlo").
parent("Larisa", "Pavlo").
parent("Oleksandr", "Viktor").
parent("Oleksandr", "Natasha").
parent("Maria", "Viktor").
parent("Maria", "Natasha").
parent("Nester", "Anna").
parent("Nester", "Alla").
parent("Olga", "Anna").
parent("Olga", "Alla").
parent("Viktor", "Inna").
parent("Viktor", "Semen").
parent("Anna", "Inna").
parent("Anna", "Semen").
parent("Pavlo", "Oleg").
parent("Pavlo", "Andrii").
parent("Inna", "Oleg").
parent("Inna", "Andrii").

spouse("Ivan", "Larisa").
spouse("Oleksandr", "Maria").
spouse("Nester", "Olga").
spouse("Viktor", "Anna").
spouse("Pavlo", "Inna").

son(X, Y) :- 
    male(X), 
    parent(Y, X).

brother(X, Y) :-
    parent(Z, X),
    male(Y),
    parent(Z, Y),
    male(X),
    X \= Y.

mother_in_law(X, Y) :- 
    female(X),
    parent(X, Z), 
    spouse(Z, Y).

sibling(X, Y) :- 
    parent(Z, X), 
    parent(Z, Y), 
    X \= Y.

nephew_or_niece(X, Y) :- 
    parent(Z, X), 
    sibling(Z, Y).

great_nephew(X, Y) :-
    parent(Z, X),
    nephew_or_niece(Z, Y).

goal :- 
    nl, write("Sons: "), 			son(X, Y), 				write(X), write(", "), fail;
    nl, write("Brothers: "), 		brother(X, Y), 			write(X), write(" є братом для "), write(Y), write(". "), fail;
    nl, write("Mothers in law: "), 	mother_in_law(X, Y), 	write(X), write(" є свекрухою для "), write(Y), write(". "), fail;
    nl, write("Great nephews: "), 	great_nephew(X, Y), 	write(X), write(" є внучатим небіжем для "), write(Y), write(". "), fail.

/** <examples> Your example queries go here, e.g.
?- goal
*/
