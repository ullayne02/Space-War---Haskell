module Main where

import Graphics.UI.Fungen
import Graphics.Rendering.OpenGL (GLdouble)
import Data.Foldable

data GameAttribute = Score Int
data GameState = Level Int

type SpaceWarObject = GameObject ()
type SpaceWarAction a = IOGame GameAttribute () () () a

width = 480
height = 640
