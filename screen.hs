module Screen(
    windowResolution,
    middleScreen
) where

import Graphics.UI.Fungen
import Textures
import Types

windowResolution :: (Int, Int)
windowResolution = (800, 800)

middleScreen :: (Double, Double)
middleScreen = (fromIntegral ((fst windowResolution) `div` 2), fromIntegral ((snd windowResolution) `div` 2))