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
width = 480
height = 640
main :: IO ()
main = do
  let winConfig = ((100,0),(width,height),"A brief example!")
      gameMap = textureBackgroundIndex 0 (fst textureBackgroundSize) (snd textureBackgroundSize) w h
      spaceShip = objectGroup "player" createPlayer 
      enemy = objectGroup "enemy" createEnemy []
      bullet = objectGroup "bullet" createBullet []
      initScore = Score 0
      input = [
        (SpecialKey KeyRight, StillDown, movePlayerRight),
        (SpecialKey KeyLeft, StillDown, movePlayerLeft)
        --(SpecialKey KeyUp, Press, moveBulletUp),
       -- (Char ' ', Press, fireSpaceShip),
        --(Char 'q', Press, \_ _ -> funExit)
        ]
  funInit winConfig gameMap [spaceShip, invader, spaceShipFire, invaderFire] () initScore input gameCycle (Timer 40) bmpList


main :: IO ()
main = do
    let winConfig = ((0,0), windowResolution, "Space War")
        background = textureMap 0 (fst textureBackgroundSize) (snd textureBackgroundSize) 250 250
        input = []
        --gameCycle = (0 0 True) () (GameOver) ()
    funInit winConfig background [] () () input gameCycle (Timer 40) bmpList

