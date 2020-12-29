%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Create1d : 10 dec 2012
%%% -------------------------------------------------------------------
-module(dbase_tests). 
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").




%% --------------------------------------------------------------------
%% External exports
-export([start/0]).

%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:tes cases
%% Description: List of test cases 
%% Returns: non
%% --------------------------------------------------------------------
start()->
    ?debugMsg("Start setup"),
    setup(),
    ?debugMsg("Stop setup"),   
    %% Start application tests

    ?debugMsg("Start init_tables"),
    ?assertEqual(ok,init_tables:start()),
    ?debugMsg("Stop init_tables"),   

    ?debugMsg("Start table_test"),
    ?assertEqual(ok,table_test:start()),
    ?debugMsg("Stop table_test"), 
 %   ?debugMsg("computer_test"),    

    ?debugMsg("Start cleanup"),
    cleanup(),
 
    ?debugMsg("------>"++atom_to_list(?MODULE)++" ENDED SUCCESSFUL ---------"),
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
setup()->
    ?assertEqual(ok,application:start(common)), 
    ?assertEqual(ok,application:start(dbase)), 
    ?assertMatch({pong,_,_},dbase:ping()),
    ok.
cleanup()->
    init:stop(),
    ok.
