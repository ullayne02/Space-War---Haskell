module Bullet where 

import Graphics.UI.Fungen
import Screen
import Textures
import Types
import Enemy
width = 480
height = 640
startPosition = (800, 20)

--creatBullet :: Position -> SpaceWarObject
creatBullet x y = 
	let sprite = Tex textureBulletSize textureBulletIndex
	in object "bullet" sprite False startPosition x y ()

moveBulletDown :: Modifiers -> Position -> SpaceWarAction ()
moveBulletDown _ _ = do
	obj <- findObject "bullet" "bulletGroup"
	(px, py) <- getObjectPosition obj
	(sx, py) <- getObjectSize obj
	if(px + (sx/2) - 5 > 0)
		then (setObjectPosition (px, py-5) obj)
		else (setObjectPosition(px,py) obj)

moveBulletUp :: Modifiers -> Position -> SpaceWarAction ()
moveBulletUp _ _ = do
	obj <- findObject "bullet" "bulletGroup"
	(px, py) <- getObjectPosition obj
	(sx, py) <- getObjectSize obj
	--MUDAR O LIMITE PARA HEIGHT 
	if(py + (sx/2) + 5 < height)
		then (setObjectPosition (px, py+5) obj)
		else (setObjectPosition(px,py) obj)