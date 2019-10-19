
import Rpg

registrar :: Personagem -> IO()
registrar (Criatura tipo _) = do
    putStr (tipo)
    putStrLn(" registrado com sucesso!")
