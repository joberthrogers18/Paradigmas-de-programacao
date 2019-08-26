-- Using guarded if statement
stateif nome
 | nome == "teste" = putStrLn "opt1"
 | otherwise = putStrLn "opt2"

-- form to represent a list
teste = 1:2:[]

-- main function 
main = do
 nome <- getLine
 putStrLn ("" ++ nome ++ "")
 stateif nome

-- Fatorial function calculate
fatorial = print ( fat 20 )

fat 0 = 1
fat n = n * fat (n - 1)

