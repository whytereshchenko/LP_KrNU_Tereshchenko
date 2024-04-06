% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(32 000 000)).  % limit term space (32Mb)
:- set_prolog_stack(local,  limit(8 000 000)).  % limit environment space

% Your program goes here

flight(101, date(2024, 4, 10), time(15, 30), 'Air Fly', 'Boeing 737', economy, 150).
flight(102, date(2024, 4, 11), time(18, 45), 'Sky High', 'Airbus A320', business, 120).
flight(103, date(2024, 4, 12), time(21, 00), 'Cloud Nine', 'Boeing 787', first, 200).


date_in_range(date(Y, M, D), date(SY, SM, SD), date(EY, EM, ED)) :-
    ((Y > SY) ; (Y = SY, M > SM) ; (Y = SY, M = SM, D >= SD)),
    ((Y < EY) ; (Y = EY, M < EM) ; (Y = EY, M = EM, D < ED)).

time_in_range(time(H, Min), time(SH, SMin), time(EH, EMin)) :-
    ((H > SH) ; (H = SH, Min >= SMin)),
    ((H < EH) ; (H = EH, Min < EMin)).

schedule(StartD, EndD, StartT, EndT) :-
    flight(Number, Date, Time, Airline, Type, Class, Seats),
    date_in_range(Date, StartD, EndD),
    time_in_range(Time, StartT, EndT),
    writeln('Flight Number: '), writeln(Number),
    writeln('Date: '), writeln(Date),
    writeln('Time: '), writeln(Time),
    writeln('Airline: '), writeln(Airline),
    writeln('Type: '), writeln(Type),
    writeln('Class: '), writeln(Class),
    writeln('Seats: '), writeln(Seats),
    nl,
    fail.

schedule(_, _, _, _) :-
    writeln('No more flights match your criteria.').


/** <examples> Your example queries go here, e.g.
?- schedule(_, _, _, _).
*/
