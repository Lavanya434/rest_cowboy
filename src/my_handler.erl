-module(my_handler).

-export([init/3]).
-export([content_types_provided/2]).
-export([hello_to_text/2]).

init(_, _Req, _Opts) ->
	{upgrade, protocol, cowboy_rest}.
content_types_provided(Req, State) ->
	{[
		{<<"text/plain">>, hello_to_text}
	], Req, State}.



hello_to_text(Req, State) ->
{<<"REST Hello World as text!">>, Req, State}.