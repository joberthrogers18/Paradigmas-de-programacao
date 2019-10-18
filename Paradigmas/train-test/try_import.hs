import FuncaoAgenda 

process_data :: Agenda -> IO()
process_data (Agenda nome email [(residencial, celular)]) = 
    putStrLn("Registrado com sucesso")

main = do
    process_data (Agenda "jobs" "teste" [("123", "321")])