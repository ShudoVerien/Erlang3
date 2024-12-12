-module(lesson3_task1).
-export([first_word/1]).

first_word(Text) ->
    first_word(Text, <<>>).

first_word(<<>>, Acc) ->
    lists:reverse(Acc);
first_word(<<32, _/binary>>, Acc) -> % Простір як роздільник
    lists:reverse(Acc);
first_word(<<Char, Rest/binary>>, Acc) ->
    first_word(Rest, <<Acc/binary, Char>>).
