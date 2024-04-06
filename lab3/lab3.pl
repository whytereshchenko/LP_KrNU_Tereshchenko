% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(32 000 000)).  % limit term space (32Mb)
:- set_prolog_stack(local,  limit(8 000 000)).  % limit environment space

drop(0, L, L).
drop(N, [_|T], L) :-
    N > 0,
    N1 is N - 1,
    drop(N1, T, L).


select_first_list([], []).
select_first_list([X], [X]).
select_first_list([X, Y|T], [X, Y|Selected]) :-
    drop(1, T, NewT),
    select_first_list(NewT, Selected).


select_second_list([], []).
select_second_list([_], []).
select_second_list([_, Y|T], [Y|Selected]) :-
    select_second_list(T, Selected).

quicksort([], []).
quicksort([H|T], Sorted) :-
    partition(H, T, Less, Greater),
    quicksort(Less, SortedLess),
    quicksort(Greater, SortedGreater),
    append(SortedLess, [H|SortedGreater], Sorted).

partition(_, [], [], []).
partition(Pivot, [H|T], [H|Less], Greater) :-
    H =< Pivot, !,
    partition(Pivot, T, Less, Greater).
partition(Pivot, [H|T], Less, [H|Greater]) :-
    partition(Pivot, T, Less, Greater).


merge_and_sort(FirstList, SecondList, Sorted) :-
    select_first_list(FirstList, SelectedFromFirst),
    select_second_list(SecondList, SelectedFromSecond),
    append(SelectedFromFirst, SelectedFromSecond, Merged),
    quicksort(Merged, Sorted).


% [1, 2, 2, 3, 3, 3]
% [4, 5, 5, 6, 6, 6, 7]

% [-3, -2, -1, 0]
% [0, 1, 2, 3, 4, 5]

% [-1, 3, -2, 2]
% [4, -3, -4, 5, -5]


test :-
    FirstList = [1, 2, 3, 4, 5, 6],
    SecondList = [7, 8, 9, 10, 11, 12],
    
    writeln('Перший список'),
    writeln(FirstList),
    writeln('Другий список'),
    writeln(SecondList),
   
    merge_and_sort(FirstList, SecondList, Sorted),
    writeln('Sorted merged list: '), writeln(Sorted),
    Sorted = [Head|_],
    ( member(Head, FirstList) -> writeln('Перший елемент з першого списку.');
      member(Head, SecondList) -> writeln('Перший елемент з другого списку.');
      writeln('Перший елемент не з цих списків.') ).

/** <examples> Your example queries go here, e.g.
?- test.
*/
