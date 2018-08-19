module Main exposing (..)

-- external
import Html exposing (program)

-- internal
import Commands exposing (fetchPlayers)
import Msgs exposing (Msg)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)

init : (Model, Cmd Msg)
init = (initialModel, fetchPlayers)

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
