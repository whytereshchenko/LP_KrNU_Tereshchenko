% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(32 000 000)).  % limit term space (32Mb)
:- set_prolog_stack(local,  limit(8 000 000)).  % limit environment space

% Your program goes here
% Факти про товари
% товар(Найменування, Виробник, Ціна).
asset('iPhone 12', 'Apple', 799).
asset('Galaxy S21', 'Samsung', 999).
asset('Pixel 5', 'Google', 699).
asset('iPhone SE', 'Apple', 399).
asset('Galaxy A52', 'Samsung', 499).

% Вивести всі товари із заданою ціною
fetch_by_price(Price) :-
    asset(Name, Producer, Price),
	write(Name), write(' від '), write(Producer), write(' за ціною '), write(Price), nl,
    fail.
    fetch_by_price(_).

% Вивести всі товари із заданим найменуванням
fetch_by_name(Name) :-
    asset(Name, Producer, Price),
    write(Name), write(' від '), write(Producer), write(' за ціною '), write(Price), nl,
    fail.
	fetch_by_name(_).

% Правило куплю (найменування), якщо товар має ціну, що не перевищує заданої
% та виробник співпадає із заданим.
buy(Name, Producer, PriceWanted) :-
    asset(Name, Producer, Price),
    Price =< PriceWanted,
    write('Можна купити '), write(Name), write(' від '), write(Producer), write(' за ціною '), write(Price), nl,
    fail.
	buy(_, _, _).

/** <examples> Your example queries go here, e.g.
% ?- fetch_by_price(499).
% ?- fetch_by_name('Galaxy S21').
% ?- buy('iPhone 12', 'Apple', 800).
*/
