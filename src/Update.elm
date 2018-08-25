module Update exposing (..)

-- external
import RemoteData

-- internal
import Commands exposing (savePlayerCmd)
import Msgs exposing (Msg(..))
import Models exposing (Model, Player)
import Routing exposing (parseLocation)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        OnFetchPlayers response ->
            ({ model | players = response }, Cmd.none)
        OnLocationChange location ->
            let newRoute = parseLocation location
            in ({ model | route = newRoute }, Cmd.none)
        ChangeLevel player howMuch ->
            let updatedPlayer = { player | level = player.level + howMuch }
            in (model, savePlayerCmd updatedPlayer)
        OnPlayerSave (Ok player) ->
            (updatePlayer model player, Cmd.none)
        OnPlayerSave (Err error) ->
            (model, Cmd.none)

updatePlayer : Model -> Player -> Model
updatePlayer model updatedPlayer =
    let pick currentPlayer =
            if updatedPlayer.id == currentPlayer.id
                then updatedPlayer
                else currentPlayer
        updatePlayerList player = List.map pick player
        updatedPlayers = RemoteData.map updatePlayerList model.players
    in { model | players = updatedPlayers }
