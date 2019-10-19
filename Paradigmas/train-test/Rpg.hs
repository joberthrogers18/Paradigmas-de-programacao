
module Rpg
(
    Personagem(Criatura)
) where

type Poder = Int
type Tipo = String

data Personagem = Criatura Tipo Poder  
