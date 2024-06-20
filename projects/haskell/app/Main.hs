module Main where

import qualified MyLib (strip)

main :: IO ()
main = do
  putStrLn $ MyLib.strip "\t Hello, Haskell! \n"
