module Main(
    process_data
) where

import FuncaoAgenda 

process_data :: Agenda -> IO()
process_data (Agenda nome email [(residencial, celular)]) = 
    putStrLn "Registrado com sucesso"

