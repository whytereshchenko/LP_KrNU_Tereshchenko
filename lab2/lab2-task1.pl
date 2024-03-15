% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(32 000 000)).  % limit term space (32Mb)
:- set_prolog_stack(local,  limit(8 000 000)).  % limit environment space

% Your program goes here
series_sum(N, Sum, Epsilon) :-
    Term is (2*N - 1) / (N^2 * (N + 1)^2),
    Term < Epsilon,
    Sum is 0.

series_sum(N, Sum, Epsilon) :-
    Term is (2*N - 1) / (N^2 * (N + 1)^2),
    (Term < Epsilon -> Sum is 0;
     NextN is N + 1,
     series_sum(NextN, NextSum, Epsilon), 
     Sum is Term + NextSum).

calculate_sum(Sum) :-
    Epsilon = 0.0000000001,
    series_sum(100, Sum, Epsilon).

/** <examples> Your example queries go here, e.g.
?- calculate_sum(Sum).
*/
