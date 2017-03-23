{application, 'rest_cowboy', [
	{description, "New project"},
	{vsn, "1.0.4"},
	{modules, ['my_handler','rest_cowboy_app','rest_cowboy_sup']},
	{registered, [rest_cowboy_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {rest_cowboy_app, []}},
	{env, []}
]}.