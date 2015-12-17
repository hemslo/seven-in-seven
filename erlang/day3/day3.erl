-module(day3).
-export([loop/0, monitor/0]).

% Monitor the translate_service and restart it should it die.

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(translator, spawn_link(fun translate_service:loop/0)),
      loop();
    {'EXIT', From, Reason} ->
      io:format("The translate_service ~p died with reason ~p.", [From, Reason]),
      io:format(" Restarting. ~n"),
      self() ! new,
      loop()
  end.

% Make the Doctor process restart itself if it should die.
% Make a monitor for the Doctor monitor. If either monitor dies, restart it.

monitor() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(doctor, spawn_link(fun doctor:loop/0)),
      doctor ! new,
      monitor();
    {'EXIT', From, Reason} ->
      io:format("The doctor ~p died with reason ~p.", [From, Reason]),
      io:format(" Restarting. ~n"),
      self() ! new,
      monitor()
    end.

% Create a basic OTP server that logs messages to a file.
% Make the translate_service work across a network.
