% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(32 000 000)).  % limit term space (32Mb)
:- set_prolog_stack(local,  limit(8 000 000)).  % limit environment space

% Your program goes here

% Завдання 1

binary_tree(nil).  % Пусте дерево
binary_tree(tree(Left, Value, Right)) :-  % Вузол дерева
    binary_tree(Left),
    binary_tree(Right).

tree1(tree(tree(nil, 1, nil), 2, tree(nil, 3, nil))).
tree2(tree(tree(tree(nil, 1, nil), 2, tree(nil, 3, nil)), 4, tree(tree(nil, 5, nil), 6, tree(nil, 7, nil)))).

elements_of_right_subtrees(nil, []).
elements_of_right_subtrees(tree(_, _, Right), List) :-
    binary_tree(Right),
    collect_values(Right, List).

collect_values(nil, []).
collect_values(tree(Left, Value, Right), [Value|Values]) :-
    collect_values(Left, LeftValues),
    collect_values(Right, RightValues),
    append(LeftValues, RightValues, Values).



% Завдання 2
edge(a, b, 1).
edge(a, c, 5).
edge(b, d, 2).
edge(c, d, 1).
edge(d, e, 3).

dfs(Start, End, Path, MaxWeight) :-
    dfs_helper(Start, End, [Start], 0, RevPath, MaxWeight),
    reverse(RevPath, Path).

dfs_helper(End, End, Visited, Weight, Visited, Weight).
dfs_helper(Current, End, Visited, Weight, Path, MaxWeight) :-
    edge(Current, Next, W),
    \+ member(Next, Visited),
    NewWeight is Weight + W,
    dfs_helper(Next, End, [Next|Visited], NewWeight, Path, MaxWeight).

find_longest_path(Start, End, LongestPath, MaxWeight) :-
    findall(Weight-Path, dfs(Start, End, Path, Weight), Paths),
    max_member(MaxWeight-LongestPath, Paths).


/** <examples> Your example queries go here, e.g.
?- tree1(Tree1), elements_of_right_subtrees(Tree1, List1), writeln(List1).
% Очікуваний вивід: [3]
?- tree2(Tree2), elements_of_right_subtrees(Tree2, List2), writeln(List2).
% Очікуваний вивід: [3, 7]
?- find_longest_path(a, e, Path, Weight), format('Longest path: ~w with total weight: ~w', [Path, Weight]).
*/
