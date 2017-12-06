module Main where

import Graphics.UI.Fungen
import Screen
--import Spacewar
import Textures
import Types
import Enemy
import Bullet

gameCycle :: SpaceWarAction ()
gameCycle = do
    gs <- getGameState 

main :: IO ()
main = do
    let winConfig = ((0,0), windowResolution, "Space War")
        background = textureMap 0 (fst textureBackgroundSize) (snd textureBackgroundSize) 250 250
        input = []
        --gameCycle = (0 0 True) () (GameOver) ()
    funInit winConfig background [] () () input gameCycle (Timer 40) bmpList

