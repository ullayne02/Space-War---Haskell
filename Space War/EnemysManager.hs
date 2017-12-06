module InvadersManager where
import Graphics.UI.Fungen
import Screen
--import Spacewar
import Textures
import Types
import Enemy
import Bullet

createEnemys :: SpaceWarAction ()
createEnemys = 
	enemys <- getObjectsFromGroup "enemyGroup"
	forM_ enemys $ \enemy -> do 
		sleeping <- getObjectAsleep (enemy)
		when (not sleeping) $ do
			(Score n) <- getGameAttribute
			let aux = ((fromIntegral n :: Double)/100.0)
			shoot <- randomDouble (0.0,100.0 + (aux)) 
			(px, py) <- getObjectPosition enemy
			let obj = (createBullet px py)
			addObjectsToGroup [obj] "bulletGroups"
	