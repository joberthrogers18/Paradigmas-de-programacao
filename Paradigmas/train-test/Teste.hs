import Numeric 

-- sum two number and print it
sumNumber = do
    input1 <- getLine 
    input2 <- getLine 
    let x = (read input1 :: Int)
    let y = (read input2 :: Int)
    putStr("X = ")
    print((x + y))

-- area of circle

showFullPrecision x = showFFloat (Just 4) x ""

areaCircle = do 
    radius <- getLine
    let area = 3.14159 * (read radius :: Double) * (read radius :: Double) 
    let cast = showFullPrecision area
    putStrLn("A=" ++ cast)

main = do
    areaCircle
    
