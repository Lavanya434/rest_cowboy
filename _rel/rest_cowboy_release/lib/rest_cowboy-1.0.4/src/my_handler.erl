-module(my_handler).

-export([init/3]).
-export([content_types_provided/2]).
-export([get_html/2, get_text/2]).

init(_, _Req, _Opts) ->
	{upgrade, protocol, cowboy_rest}.

content_types_provided(Req, State) ->
io:format("HI"),
	{[{{<<"text">>, <<"html">>, '*'}, get_html},
	{{<<"text">>, <<"plain">>, '*'}, get_text}], Req, State}.

get_html(Req, State) ->
	{<<"<html><body>This is REST!</body></html>">>, Req, State}.
get_text(Req, State) ->
	{<<"This is REST TEXT">>, Req, State}.
