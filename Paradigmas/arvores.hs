-- | nesse caso é ou
data ArvBin elemento = Nulo
  | No elemento (ArvBin elemento) (ArvBin elemento)

-- andar em pre ordem

preOrdem :: ArvBin elemento -> [elemento]
preOrdem Nulo = []
preOrdem (No x esq dir ) = [x] ++ (preOrdem esq) ++ (preOrdem dir)

-- em ordem em uma arvore

emOrdem :: ArvBin elemento -> [elemento]
emOrdem Nulo = []
emOrdem (No x esq dir ) = (emOrdem esq) ++ [x] ++ (emOrdem dir)

-- pos ordem em uma arvore

posOrdem :: ArvBin elemento -> [elemento]
posOrdem Nulo = []
posOrdem (No x esq dir) = (posOrdem esq) ++ (posOrdem dir) ++ [x]


-- verificar o tamanho da arvore
altArv :: ArvBin elemento -> Int
altArv Nulo = 0
altArv (No x esq dir) = 1 + max (altArv esq)  (altArv dir)

-- Verifica se arvore está balanceada
ehBalan :: ArvBin elemento -> Bool
ehBalan Nulo = True
ehBalan (No x esq dir) =(abs (altArv esq) - (altArv dir)) <= 1 && (ehBalan esq) && (ehBalan dir)

data ArvoreBin elem = Null 
 | Node Int (ArvoreBin elem) (ArvoreBin elem)

procuraValorArv :: ArvoreBin elem -> Int -> Bool
procuraValorArv Null _ = False
procuraValorArv (Node x esq dir) valor
  | x == valor = True
  | otherwise = False || (procuraValorArv esq valor) || (procuraValorArv dir valor)