module Lib.Packages.Typography.TypographyOptions (TypographyOptions) where

import Data.List (List)
import Data.Maybe (Maybe)
import Lib.Packages.Typography.VerticalRhythm (VerticalRhythm)
import Lib.Packages.Typography.Weight (Weight)
import Prelude (Unit)
import Effect (Effect)
import Foreign.Object (Object)
import Lib.Packages.Typography.GoogleFont (GoogleFont)

foreign import overrideStyles_ :: VerticalRhythm -> TypographyOptions -> Object {} -> Effect Unit

overrideStyles :: VerticalRhythm -> TypographyOptions -> Object {} -> Effect Unit
overrideStyles = overrideStyles_

foreign import overrideThemeStyles_ :: VerticalRhythm -> TypographyOptions -> Object {} -> Effect Unit

overrideThemeStyles :: VerticalRhythm -> TypographyOptions -> Object (Record ()) -> Effect Unit
overrideThemeStyles = overrideThemeStyles_

data TypographyOptions
  = TypographyOptions
    { baseFontSize :: Maybe String
    , baseLineHeight :: Maybe Number
    , blockMarginBottom :: Maybe Number
    , bodyColor :: Maybe String
    , bodyFontFamily :: Maybe (List String)
    , bodyWeight :: Maybe Weight
    , boldWeight :: Maybe Weight
    , googleFonts :: Maybe (List GoogleFont)
    , headerColor :: Maybe String
    , headerFontFamily :: Maybe (List String)
    , headerLineHeight :: Maybe Number
    , headerWeight :: Maybe Weight
    , includeNormalize :: Maybe Boolean
    , overrideStyles :: Maybe TypographyOptionsMap
    , overrideThemeStyles :: Maybe TypographyOptionsMap
    , plugins :: Maybe (List (Maybe String))
    , scaleRatio :: Maybe Number
    }

newtype MaybeString
  = Maybe String

data TypographyOptionsMap
  = HashMap String MaybeString
