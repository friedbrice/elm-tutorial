module Main exposing (..)

-- external
import Navigation exposing (Location)

-- internal
import Commands exposing (fetchPlayers)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Routing
import Update exposing (update)
import View exposing (view)

init : Location -> (Model, Cmd Msg)
init location =
    let currentRoute = Routing.parseLocation location
    in (initialModel currentRoute, fetchPlayers)

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main = Navigation.program Msgs.OnLocationChange
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
