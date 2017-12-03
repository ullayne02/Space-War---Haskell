module Types(
    GameAttribute(GA),
    GameState(LevelStart, Level, GameOver),
    SpaceWarObject,
    SpaceWarAction
) where

import Graphics.UI.Fungen

data GameAttribute = GA Int Int Bool
data GameState = LevelStart Int | Level Int | GameOver

type SpaceWarObject = GameObject ()
type SpaceWarAction = IOGame GameAttribute () GameState () a
