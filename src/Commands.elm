module Commands exposing (..)

-- external
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode
import RemoteData

-- internal
import Msgs exposing (Msg)
import Models exposing (PlayerId, Player)

fetchPlayers : Cmd Msg
fetchPlayers =
    Http.get fetchPlayersUrl playersDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchPlayers

fetchPlayersUrl : String
fetchPlayersUrl = "http://localhost:4000/players"

savePlayerUrl : PlayerId -> String
savePlayerUrl playerId = "http://localhost:4000/players/" ++ playerId

savePlayerRequest : Player -> Http.Request Player
savePlayerRequest player =
    Http.request
        { body = Http.jsonBody (playerEncoder player)
        , expect = Http.expectJson playerDecoder
        , headers = []
        , method = "PATCH"
        , timeout = Nothing
        , url = savePlayerUrl player.id
        , withCredentials = False
        }

savePlayerCmd : Player -> Cmd Msg
savePlayerCmd player = Http.send Msgs.OnPlayerSave (savePlayerRequest player)

playersDecoder : Decode.Decoder (List Player)
playersDecoder = Decode.list playerDecoder

playerDecoder : Decode.Decoder Player
playerDecoder =
    decode Player
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "level" Decode.int

playerEncoder : Player -> Encode.Value
playerEncoder player =
    Encode.object
        [ ("id", Encode.string player.id)
        , ("name", Encode.string player.name)
        , ("level", Encode.int player.level)
        ]
