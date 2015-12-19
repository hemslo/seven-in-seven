% Monitor the translate_service and restart it should it die.

-module(translate_service).
-behaviour(supervisor).
-export([loop/0, translate/2, start/0, init/1, start_service/0]).

loop() ->
  receive
    {From, "casa"} ->
      From ! "house",
      loop();

    {From, "blanca"} ->
      From ! "white",
      loop();

    {From, _} ->
      From ! "I don't understand.",
      exit({translator, die, at, erlang:time()})
  end.

translate(To, Word) ->
  To ! {self(), Word},
  receive
    Translation -> Translation
  end.

start() ->
  io:fwrite("Starting...~n"),
  Pid = spawn_link(fun loop/0),
  register(translator, Pid),
  {ok, Pid}.

init(_) ->
  { ok, { { one_for_one, 1, 60 },
    [{ translate_service,
       { translate_service, start, [] },
       permanent,
       brutal_kill,
       worker,
       [translate_service]
     }
    ]}
  }.

start_service() ->
  io:fwrite("start_service~n"),
  supervisor:start_link(translate_service, []).
