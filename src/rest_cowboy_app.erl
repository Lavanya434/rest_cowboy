-module(rest_cowboy_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", my_handler, []}]}
    ]),
    cowboy:start_http(my_http_listener, 100, [{port, 8088}],
        [{env, [{dispatch, Dispatch}]}]
    ),
    frst_cowboy_sup:start_link().
stop(_state) ->
	ok.