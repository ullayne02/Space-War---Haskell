module EnemysManager where
import Graphics.UI.Fungen
import Graphics.Rendering.OpenGL (GLdouble)

import Screen
import Textures
import Types


enemySpeed = -1

width = 480
height = 640
startPosition = (800, 20)

enemyCreate :: [SpaceWarObject]
enemyCreate = 
	let sprite = Tex textureObstacleSize textureObstacleIndex
	in [(object "enemy1" sprite False startPosition (10, 1000) ()), 
	(object "enemy2" sprite False startPosition (10, 1000) ()), 
	(object "enemy3" sprite False startPosition (10, 1000) ())]

moveEnemyRight :: Modifiers -> Position -> SpaceWarAction ()
moveEnemyRight _ _  = do
	obj <- findObject "enemy" "enemyGroup"
	(px, py) <- getObjectPosition obj
	(sx,sy) <- getObjectSize obj
	if(px + (sx/2) + 5 < width)
		then (setObjectPosition ((px+5), py) obj)
		else (setObjectPosition((width-(sx/2)),py) obj) 

moveEnemyLeft :: Modifiers -> Position -> SpaceWarAction ()
moveEnemyLeft _ _ = do
	obj <- findObject "enemy" "enemyGroup"
	(px, py) <- getObjectPosition obj
	(sx,sy) <- getObjectSize obj
	if(px + (sx/2) - 5 > 0)
		then (setObjectPosition ((px-5), py) obj)
		else (setObjectPosition((width + (sx/2)),py) obj) 	

moveEnemyDown :: Modifiers -> Position -> SpaceWarAction ()
moveEnemyDown _ _ = do
	obj <- findObject "enemy" "enemyGroup"
	(px, py) <- getObjectPosition obj
	(sx,sy) <- getObjectSize obj
	if(py + (sx/2) - 5 > 0)
		then (setObjectPosition (px, py-5) obj)
		else (setObjectPosition(px, py) obj) 	

creatBullet :: GLdouble -> GLdouble -> GameObject ()
creatBullet x y = 
	let sprite = Tex textureBulletSize textureBulletIndex
	in object "bullet" sprite False (x,y) (10, 1000) ()

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
	if(py + (sx/2) + 5 < height)
		then (setObjectPosition (px, py+5) obj)
		else (setObjectPosition(px,py) obj)

stopEnemy :: [SpaceWarObject] -> Int -> SpaceWarAction ()
stopEnemy _ 0 = return()
stopEnemy [] _ = return()
stopEnemy (x:xs) l = do
	setObjectSpeed(0,0) x
	stopEnemy xs (l-1)

shot :: [SpaceWarObject] -> SpaceWarAction ()
shot (x:xs) = do 
	(px, py) <- getObjectPosition x
	let fire = (creatBullet px py)
	addObjectsToGroup [fire] "bulletGroup"
	drawObject fire
	shooting fire
	shot xs

shooting :: SpaceWarObject -> SpaceWarAction ()
shooting obj = do 
	(px, py) <- getObjectPosition obj 
	if (py + 5 >= height) 
		then return ()
		else 
			do
				(setObjectPosition (px, py+5) obj)
				drawObject obj

