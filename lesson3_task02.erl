-module(lesson3_task2).
-export([words/1]).

words(Text) ->
    words(Text, <<>>, []).

words(<<>>, <<>>, Acc) ->
    lists:reverse(Acc);
words(<<>>, Word, Acc) ->
    lists:reverse([lists:reverse(Word) | Acc]);
words(<<32, Rest/binary>>, <<>>, Acc) ->
    words(Rest, <<>>, Acc);
words(<<32, Rest/binary>>, Word, Acc) ->
    words(Rest, <<>>, [lists:reverse(Word) | Acc]);
words(<<Char, Rest/binary>>, Word, Acc) ->
    words(Rest, <<Word/binary, Char>>, Acc).
