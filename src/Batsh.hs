module Batsh where

import qualified Batsh.Ast
import qualified Batsh.Lexer
import qualified Batsh.Parser

lex :: String -> [Batsh.Lexer.Token]
lex code = Batsh.Lexer.scanTokens code

parse :: String -> Batsh.Ast.Program
parse code = Batsh.Parser.parse code

parseFromFile :: FilePath -> IO Batsh.Ast.Program
parseFromFile path = do
  code <- readFile path
  return $ parse code

parseFromAstFile :: FilePath -> IO Batsh.Ast.Program
parseFromAstFile path = do
  code <- readFile path
  return (read code :: Batsh.Ast.Program)
