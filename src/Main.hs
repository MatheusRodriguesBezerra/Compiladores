module Main where

import AST
import Lexer
import Parser
import SymbolTable
import CodeGen
import MIPS
import IR
import           Control.Monad.State (State)
import qualified Control.Monad.State as State

checkTypes :: Prog -> String
checkTypes x
  | typeVerify x = "O uso de todas as variaveis esta correto!"
  | otherwise = "erro de tipos" 

initialSupply :: Supply
initialSupply = (0, 0)

runCodeGen :: State Supply [Instr] -> [Instr]
runCodeGen gen = State.evalState gen initialSupply

-- print a list of IR instructions
printIR :: [Instr] -> IO ()
printIR = mapM_ print

main :: IO ()
main = do
  txt <- getContents
  putStrLn (txt)
  putStrLn "\n"
  let parse = parser $ alexScanTokens txt
  print (parse)
  putStrLn "\n"
  print (checkTypes parse)
  putStrLn "\n"
  let ir = transProgram (parse)
  printIR (runCodeGen (do result <- newTemp 
                          (ir)))
  putStrLn "\n"
  let ir2 = (runCodeGen (do result <- newTemp 
                            (ir)))
  mapM_ putStrLn (begin ir2)

