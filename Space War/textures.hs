module Textures(
    bmpList,
    texturePlayerSize, texturePlayerIndex,
    textureBackgroundSize, textureBackgroundIndex,
    textureBackground2Size, textureBackground2Index,
    textureObstacleSize, textureObstacleIndex,
    textureBulletSize, textureBulletIndex
) where

import Graphics.UI.Fungen

bmpList = [("Sprites/spaceship.bmp", magenta),
            ("Sprites/background1.bmp", Nothing),
            ("Sprites/background2.bmp", Nothing),
            ("Sprites/obstacle.bmp", magenta)]

texturePlayerIndex :: Int
texturePlayerIndex = 0

textureBackgroundIndex :: Int
textureBackgroundIndex = 1

textureBackground2Index :: Int
textureBackground2Index = 2

textureObstacleIndex :: Int
textureObstacleIndex = 3

textureBulletIndex :: Int
textureBulletIndex = 4

textureBackgroundSize :: (Double, Double)
textureBackgroundSize = (800, 800)

textureBackground2Size :: (Double, Double)
textureBackground2Size = (800, 800)

textureObstacleSize :: (Double, Double)
textureObstacleSize = (500, 443)

texturePlayerSize :: (Double, Double)
texturePlayerSize = (430, 486)

textureBulletSize :: (Double, Double)
textureBulletSize = (3, 3)

magenta :: InvList
magenta = Just [(255, 0, 255)]