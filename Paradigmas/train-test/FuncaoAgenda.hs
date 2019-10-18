-- Questao 1 prova

module FuncaoAgenda (
    Agenda(Agenda)
) where

type Nome = String
type TelRes = String
type Cel = String
type Email = String

data Agenda = Agenda Nome Email [(TelRes, Cel)] deriving(Show, Eq)


