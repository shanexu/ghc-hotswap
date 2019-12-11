{-# LANGUAGE OverloadedStrings #-}

module SO.Handles
  ( hsNewSOHandle
  ) where

import Foreign

import Types

import SO.MyCode

foreign export ccall "hs_soHandles"
  hsNewSOHandle :: IO (StablePtr SOHandles)

hsNewSOHandle :: IO (StablePtr SOHandles)
hsNewSOHandle = newStablePtr SOHandles
  { someData = "I live in a shared object"
  , someFn = myFunction
  }
