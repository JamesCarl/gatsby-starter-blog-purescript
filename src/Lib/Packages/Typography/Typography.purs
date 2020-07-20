module Lib.Packages.Typography.Typography
  ( Typography
  , TypographyMap
  , MaybeString
  , typography
  , createStyles
  , toJson
  , injectStyles
  , rhythm_
  , scale_
  ) where

import Prelude (Unit)
import Data.Argonaut (Json)
import Data.Function.Uncurried (Fn1)
import Effect (Effect)
import Lib.Packages.Typography.BaseLine (BaseLine)
import Lib.Packages.Typography.TypographyOptions (TypographyOptions)
import Data.Maybe (Maybe)
import Data.HashMap (HashMap)

foreign import typography_ :: TypographyOptions -> Typography

typography :: TypographyOptions -> Typography
typography = typography_

foreign import createStyles_ :: Typography -> String

foreign import toJson_ :: Typography -> Json

foreign import injectStyles_ :: Typography -> Effect Unit

createStyles :: Typography -> String
createStyles = createStyles_

toJson :: Typography -> Json
toJson = toJson_

injectStyles :: Typography -> Effect Unit
injectStyles = injectStyles_

type MaybeString
  = Maybe String

type TypographyMap
  = HashMap String MaybeString

type Typography
  = { adjustFontSizeTo :: TypographyMap
    , establishBaseline :: TypographyMap
    , linesForFontSize :: TypographyMap
    , options :: TypographyOptions
    , rhythm :: Fn1 Number String
    , scale :: Fn1 Number BaseLine
    }

rhythm_ :: Typography -> Fn1 Number String
rhythm_ t = t.rhythm

scale_ :: Typography -> Fn1 Number BaseLine
scale_ t = t.scale
