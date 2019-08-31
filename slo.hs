#!/usr/bin/env runhaskell
import Data.IORef
import Control.Monad
data Point = Point { x :: Int, y :: Int } deriving (Show)

main = do
  total <- newIORef 0
  forM_ [1 .. 1000000] $ \_ -> do
    let p = Point 2 3
    t <- readIORef total
    writeIORef total (t + (x p) + (y p))
  t <- readIORef total
  print t
