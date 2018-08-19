module Msgs exposing (..)

-- external
import RemoteData exposing (WebData)

-- internal
import Models exposing (Player)

type Msg
    = OnFetchPlayers (WebData (List Player))
