module Msgs exposing (..)

-- external
import Navigation exposing (Location)
import RemoteData exposing (WebData)

-- internal
import Models exposing (Player)

type Msg
    = OnFetchPlayers (WebData (List Player))
    | OnLocationChange Location
