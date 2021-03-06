module Msgs exposing (..)

-- external
import Http
import Navigation exposing (Location)
import RemoteData exposing (WebData)

-- internal
import Models exposing (Player)

type Msg
    = OnFetchPlayers (WebData (List Player))
    | OnLocationChange Location
    | ChangeLevel Player Int
    | OnPlayerSave (Result Http.Error Player)
