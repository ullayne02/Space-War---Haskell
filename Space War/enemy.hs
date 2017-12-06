module Enemy (
	enemyCreate,moveEnemyRight,
	moveEnemyLeft, moveEnemyDown
	)where
import Graphics.UI.Fungen
import Graphics.UI.Fungen
import Screen
import Textures
import Types


startPosition = (800, 20)

enemyCreate :: SpaceWarObject
enemyCreate = 
	let sprite = Tex textureObstacleSize textureObstacleIndex
	in object "enemy" sprite False startPosition (10, 1000) ()

moveEnemyRight :: Modifiers -> Position -> SpaceWarAction ()
moveEnemyRight _ _  = do
	obj <- findObject "enemy" "enemyGroup"
	(px, py) <- getObjectPosition obj
	(sx,sy) <- getObjectSize obj
--MUDAR O 10 PARA WIDTH
	if(px + (sx/2) + 5 < 10)
		then (setObjectPosition ((px+5), py) obj)
		else (setObjectPosition((10-(sx/2)),py) obj) 

moveEnemyLeft :: Modifiers -> Position -> SpaceWarAction ()
moveEnemyLeft _ _ = do
	obj <- findObject "enemy" "enemyGroup"
	(px, py) <- getObjectPosition obj
	(sx,sy) <- getObjectSize obj
	if(px + (sx/2) - 5 > 0)
		then (setObjectPosition ((px-5), py) obj)
		--MUDAR O 10 PARA WIDTH
		else (setObjectPosition((10 + (sx/2)),py) obj) 	

moveEnemyDown :: Modifiers -> Position -> SpaceWarAction ()
moveEnemyDown _ _ = do
	obj <- findObject "enemy" "enemyGroup"
	(px, py) <- getObjectPosition obj
	(sx,sy) <- getObjectSize obj
	if(py + (sx/2) - 5 > 0)
		then (setObjectPosition (px, py-5) obj)
		else (setObjectPosition(px, py) obj) 	

