module Lib.Packages.Typography.VerticalRhythm where

import Lib.Packages.Typography.BaseLine (BaseLine)
import Data.Function.Uncurried (Fn1)

data VerticalRhythm
  = VerticalRhythm
    { adjustFontSizeTo :: RhythmMap
    , establishBaseline :: RhythmMap
    , linesForFontSize :: RhythmMap
    , rhythm :: Rhythm
    , scale :: Scale
    }

data Rhythm
  = Rhythm (Fn1 Number String)

newtype MaybeRhythmString
  = Maybe String

data Scale
  = Scale (Fn1 Number BaseLine)

data RhythmMap
  = HashMap String MaybeRhythmString
