somaLista [] = 0
somaLista (h:t) = h + (somaLista t)


-- retornar os n primeiros numeros
pegarPrimeiros :: [Int] -> Int -> [Int]
-- Underscore significa qualquer coisa, nesse caso no segundo parametro
pegarPrimeiros [] _ = []
-- mesma coisa, mas quando o tamanho retornado for 0
pegarPrimeiros _ 0 = []
-- o :, signica concatenar lista
pegarPrimeiros (h:t) n = h : (pegarPrimeiros t (n-1))


