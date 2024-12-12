-module(lesson3_task3).
-export([split/2]).

split(Text, Separator) ->
    split(Text, Separator, <<>>, []).

split(<<>>, _Separator, <<>>, Acc) ->
    lists:reverse(Acc);
split(<<>>, _Separator, Part, Acc) ->
    lists:reverse([lists:reverse(Part) | Acc]);
split(Text, Separator, Part, Acc) ->
    case lists:reverse(Text) of
        <<Sep/binary, Rest/binary>> when Sep == lists:reverse(Separator) ->
            split(lists:reverse(Rest), Separator, <<>>, [lists:reverse(Part) | Acc]);
        <<Char, Rest/binary>> ->
            split(lists:reverse(Rest), Separator, <<Char, Part/binary>>, Acc)
    end.
