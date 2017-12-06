module Bullet where 

import Graphics.UI.Fungen
import Screen
import Textures
import Types
--import Enemy

creatBullet :: SpaceWarObject
creatBullet enemyPosicion = let sprite = Tex textureBulletSize textureBulletIndex
				in object "bullet" sprite False startPosicion (enemyPosicion)

moveBulletDown :: Modifiers -> Position -> SpaceWarAction ()
moveBulletDown _ _ = do
	obj <- findObject "bullet" "bulletGroup"
	(px, py) <- getObjectPosition obj
	(sx,py) <- getObjectSize obj
	--nao tenho certeza sobre o limite!!!!!!!!!!!!!!!
	if(px + (sx/2) - 5 > 0)
		then (setObjectPosition (px, py-5) obj)
		else (setObjectPosition(px,py) obj)

moveBulletUp :: Modifiers -> Position -> SpaceWarAction ()
moveBulletUp _ _ = do
	obj <- findObject "bullet" "bulletGroup"
	(px, py) <- getObjectPosition obj
	(sx,py) <- getObjectSize obj
	--MUDAR O LIMITE PARA HEIGHT 
	if(py + (sx/2) + 5 < 10)
		then (setObjectPosition (px, py+5) obj)
		else (setObjectPosition(px,py) obj)