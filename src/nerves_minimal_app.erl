-module(nerves_minimal_app).

-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.
start(_Type, _Args) ->
    % Bring up the ethernet interface to a hardcoded IP
    % address for now.
    os:cmd("/sbin/ip link set eth0 up"),
    os:cmd("/sbin/ip addr add 192.168.1.40/24 dev eth0"),
    os:cmd("/sbin/ip route add default via 192.168.1.1"),

    nerves_minimal_sup:start_link().

-spec stop(_) -> ok.
stop(_State) ->
    ok.
