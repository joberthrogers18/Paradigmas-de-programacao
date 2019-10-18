salarioVerifica :: Int -> Int -> IO()
salarioVerifica sal_hora dias 
    | salario >= 400 && salario <=800 = putStrLn("Salário mediano!")
    | salario > 800 = putStrLn("Salário bom!")
    | otherwise = putStrLn("Abaixo da pobreza!")
    where salario = sal_hora * 8 * dias

descreveLista xs = "Trata-se de uma lista " ++ qual xs
    where qual [] = "vazia!"
          qual [x] = "unica!"
          qual xs = "maior!"

somaLista [] = 0
somaLista (h:t) = h + (somaLista t)

estaNaLista :: [Int] -> Int -> Bool
estaNaLista [] _ = False
estaNaLista (x:xs) n
    | n == x = True
    | otherwise = estaNaLista xs n

-- Create an data
data Shape = Circle Float Float Float | Retangle Float Float Float Float
    