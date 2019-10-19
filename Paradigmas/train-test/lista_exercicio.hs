-- 1) Área do circulo

type Radius = Float
type SmallerSide = Float
type BigSide = Float

data Shape = Circle Radius 

calcCirc:: Shape -> IO()
calcCirc (Circle radius) = do
    let area = pi * (radius ^ 2)
    putStr("O resultado da área foi: ")
    print area
    putStrLn("")

--2) Prime number

verPrime:: Int -> Int -> IO()
verPrime number current
    | number == 1 = putStrLn("É primo!")
    | mod number current == 0 = putStrLn("Não é primo!")
    | current == (floor $ (sqrt $ fromIntegral number)) = putStrLn("É primo!")
    | otherwise = verPrime number (current + 1)

-- 3) Checar se eh negativo ou positivo

checkNumber :: Int -> IO()
checkNumber number 
    | number == 0 = print(0)
    | number > 0 = print(1)
    | otherwise = print(-1)

-- 4) Calculadora

calculator:: String -> Int -> Int -> IO()
calculator op n1 n2
    | op == "*" = print(n1 * n2)
    | op == "/" = do
        let division = n1 `div` n2
        print(division)
    | op == "+" = print(n1 + n2)
    | op == "-" = print(n1 - n2)
    | otherwise = putStrLn("Entradas invalidas!")


-- 5) Fibbonacci

fib:: Int -> Int
fib pos
    | pos == 0 = 0
    | pos == 1 = 1
    | pos > 1 = calcFib 0 1 (pos - 2)
    | otherwise = -1

calcFib:: Int -> Int -> Int -> Int
calcFib pre current pos
    | pos == 0 = current + pre
    | otherwise = calcFib current (pre + current) (pos - 1)
    
-- 6) Média em uma lista

numberInList ::[Int] -> Int -> Int 
numberInList [] cont = cont
numberInList (x:xs)  cont =  numberInList xs (cont + 1)

sumInList ::[Int] -> Int -> Int 
sumInList [] sum = sum
sumInList (x:xs)  sum =  sumInList xs (sum + x)

saveList:: [Int] -> IO()
saveList list = do
    let sumAll = sumInList list 0
    let numberElem = numberInList list 0
    print(sumAll `div` numberElem)

-- 7) Retornar valores superiores a n

contSup:: Int -> [Int] -> Int -> Int
contSup _ [] cont = cont 
contSup n (x:xs) cont
    | x > n = contSup n xs (cont + 1)
    | otherwise = contSup n xs cont

returnSup:: Int -> [Int] -> IO()
returnSup n list = do
    let cont = contSup n list 0
    print(cont)     

-- 8) Returnar valores superiores a n numa lista

contSupList:: Int -> [Int] -> [Int] -> [Int]
contSupList _ [] accumulate = accumulate 
contSupList n (x:xs) accumulate
    | x > n = contSupList n xs (x:accumulate)
    | otherwise = contSupList n xs accumulate

returnSupList:: Int -> [Int] -> IO()
returnSupList n list = do
    let cont = contSupList n list []
    print(reverse cont)     

-- união entre duas listas

-- verifyRep:: Int -> [Int] -> Bool
-- verifyRep number [] = False
-- verifyRep number (x:xs) 
--     | x == number = True
--     | otherwise = verifyRep number xs

-- conc (x:xs) (s:ss) acc
--     | (verifyRep x) == True = do
--         | (verifyRep s) == False = s


-- union:: [Int] -> [Int] -> IO()
-- union list1 list2 = do
--     let newList = conc list1 list2 []

-- 10) Elementos intercalados de uma lista

concatenate :: [Int] -> [Int] -> [Int] -> [Int]
concatenate [] [] acc = acc
concatenate (x:xs) (s:ss) acc = concatenate xs ss (acc ++ [x] ++ [s])


 