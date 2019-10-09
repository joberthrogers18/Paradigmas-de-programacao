:- use_module(library(http/json)).
:- use_module(library(http/http_open)).

:- dynamic(known/2).

open_notify_url("http://api.open-notify.org/iss-now.json").

%! iss_data(-Data) is det.
%  get JSON ISS location data from open notify api and read in as dict
iss_data(Data) :-
    open_notify_url(URL),
    setup_call_cleanup(
        http_open(URL, In, [request_header('Accept'='application/json')]),
        json_read_dict(In, Data),
        close(In)
    ).

%! cached_iss_data(-Data) is det.
%  get cached data, else make a fresh request, useful during development.
cached_iss_data(Data) :-
    known(data, Data) ;
    iss_data(Data),
    assert(known(data, Data)).

%! iss_location(+Data, -Lat, -Long) is det.
%  extract the latitude and longitude from the data.
iss_location(Data, Lat, Long) :-
    Position = Data.get(iss_position),
    Lat = Position.get(latitude),
    Long = Position.get(longitude).