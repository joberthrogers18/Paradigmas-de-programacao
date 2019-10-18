import FuncaoAgenda 

processing :: Agenda -> IO()
processing (Agenda nome telefone) = putStrLn (nome ++ " " ++ telefone)

main = do
    processing(Agenda "teste" "123")