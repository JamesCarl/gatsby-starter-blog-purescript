module Lib.Packages.Typography.GoogleFont (GoogleFont(..)) where

import Data.List

data GoogleFont
  = GoogleFont
    { name :: String
    , styles :: List String
    }
