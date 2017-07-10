%%--------------------------------------------------------------------
%% Copyright (c) 2016-2017 EMQ Enterprise, Inc. (http://emqtt.io)
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(emq_coap_sup).

-behaviour(supervisor).

-export([start_link/0, init/1]).

-define(CHILD(M), {M, {M, start_link, []}, permanent, 5000, worker, [M]}).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
    {ok, { {one_for_all, 10, 3600}, [?CHILD(emq_coap_registry)] }}.

