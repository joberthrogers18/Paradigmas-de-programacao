-- Questao 1 prova

module FuncaoAgenda (
    Agenda(Agenda)
) where

type Nome = String
type TelRes = String
type Cel = String

data Agenda = Agenda Nome TelRes deriving(Show, Eq)

    


