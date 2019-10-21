type NotaP1 = Float
type NotaP2 = Float
type NotaP3 = Float
type Nome = String
type Idade = Integer

data CorpoDescente = Aluno Nome Idade NotaP1 NotaP2 NotaP3 | Professor Nome Idade

registrarAluno:: CorpoDescente -> IO()
registrarAluno (Aluno nome _ _ _ _ ) = putStrLn(nome ++ " foi registrado")

verificarNota:: Float -> IO()
verificarNota media
	| media >= 0.0, media <= 4.9 = putStrLn("Reprovou")
	| media >= 5, media <= 6.9 = putStrLn("Recuperação")
	| media > 7 = putStrLn("Passou") 


calcularNota:: CorpoDescente -> IO()
calcularNota (Aluno nome _ p1 p2 p3) = do
	let media = ((p1 + p2 + p3) / 3)
	verificarNota media

registrarProfessor:: CorpoDescente -> IO()
registrarProfessor (Professor nome _ ) = 
	putStrLn("O professor " ++ nome ++ " foi registrado")