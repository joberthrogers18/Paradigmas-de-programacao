-- soma numeros
soma :: Int -> Int
soma 1 = 1
soma n = n + (soma (n - 1))

-- fatorial
fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * (fatorial (n - 1)) 

--fibonacci

fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib(n-2)

-- usando guarda (se)

guarda x 
  | (x == 0) = 0
  | (x == 1) = 1
  | otherwise = 2

-- variavel anonima

andBool :: Bool -> Bool -> Bool
andBool False _ = False
andBool _ False = False
andBool True True = True

-- tuplas -> dados heterogeneos

 -- soma de pontos
sumPoints :: (Int, Int) -> (Int, Int) -> (Int, Int)
sumPoints (a,b) (c,d) = (a + c, b + d)
 

-- manipulate tuplas
nomes :: (String, String, String)
nomes = ("Joberth", "Rogers", "Tavares")

selecionaPrimeiro (x, _, _) = x
selecionaSegundo (_, y, _) = y
selecionaTerceiro (_, _, z) = z

-- Criando novos tipos de dados com haskell
type Nome = String
type Idade = Int
type Linguagem = String
type Pessoa = (Nome, Idade, Linguagem)

pessoa :: Pessoa
pessoa = ("Jobs", 15, "Javascript")

my_fst :: Pessoa -> Nome
my_fst (nome, _, _ ) = nome

my_sst :: Pessoa -> Idade
my_sst (_, idade, _ ) = idade

my_tst :: Pessoa -> Linguagem
my_tst (_, _, linguagem) = linguagem
