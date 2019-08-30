-- Verificando se é um palindromo
isPalindromo :: String -> String
isPalindromo name
  | (name == reverse name) = "Palindromo!!"
  | otherwise = "Nao eh palindromo!!"

-- sabendo o comprimento de lista
lengthList :: [Int] -> Int
lengthList [] = 0
-- x é a cabeça e a calda xs
lengthList (x:xs) = 1 +  lengthList xs


-- Verificando se duas listas são iguais
isEqual :: [Int] -> [Int] -> Bool
isEqual [] [] = True
isEqual [] _ = False
isEqual _ [] = False
isEqual (a:as) (b:bs)  
  | (a == b) = (isEqual as bs)
  | otherwise = False 

-- reverso de uma certa lista dada

inv_aux :: [t] -> [t] -> [t]
inv_aux [] l_inv = l_inv
-- ++ concatena as listas no caso a lista auxiliar com a cabeça
inv_aux (x:xs) l_inv = (inv_aux xs l_inv++[x])

-- t: significa de qualquer tipo
inv_lista :: [t] -> [t]
inv_lista [] = []
inv_lista l = inv_aux l []


-- Forma mais faciol de se inverter uma lista
listInverse :: [t] -> [t]
listInverse [] = []
listInverse (x:xs) = (listInverse xs) ++ [x]