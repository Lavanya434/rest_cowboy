

%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(rest_cowboy_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", my_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
		{compress, true},
		{env, [{dispatch, Dispatch}]}
		
		
	]),
	rest_cowboy_sup:start_link().

stop(_State) ->
	ok.
