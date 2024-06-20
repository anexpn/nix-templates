{-# LANGUAGE OverloadedStrings #-}

module Main where

import Criterion.Main
import MyLib

-- The function we're benchmarking.
fib :: Int -> Int
fib m
  | m < 0 = error "negative!"
  | otherwise = go m
  where
    go 0 = 0
    go 1 = 1
    go n = go (n - 1) + go (n - 2)

-- Our benchmark harness.
main :: IO ()
main =
  defaultMain
    [ bgroup
        "fib"
        [ bench "1" $ whnf fib 1,
          bench "5" $ whnf fib 5,
          bench "9" $ whnf fib 9,
          bench "11" $ whnf fib 11
        ],
      bgroup "strip" [bench "strip small" $ whnf strip "\n\t Hello, Haskell \n"]
    ]
  -- Use `nfIO :: NFData a => IO a -> IO ()` to benchmark IO actions.
  -- There is also `whnfIO :: IO a -> IO ()`. <- Only use for simple value like Int!
  -- Use `nf :: NFData b => (a -> b) -> a -> Benchmarkable` for pure function.
  -- The function must accept one argument, see the document of criterion for why.
  -- Also `whnf :: (a -> b) -> a -> Benchmarkable`.
