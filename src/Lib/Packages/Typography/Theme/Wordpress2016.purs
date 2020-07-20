module Lib.Packages.Typography.Theme.Wordpress2016 where

import Prelude
import Effect (Effect)
import Foreign.Object
import Lib.Packages.Typography.TypographyOptions (TypographyOptions(..))

foreign import setOverrideThemeStyles_ :: forall a. TypographyOptions -> a -> TypographyOptions

foreign import delete_ :: String -> TypographyOptions -> TypographyOptions

defaultOverrideThemeStyles :: { "a.gatsby-resp-image-link" :: { "boxShadow" :: String } }
defaultOverrideThemeStyles = { "a.gatsby-resp-image-link": { "boxShadow": "none" } }

foreign import wordpress2016_ :: TypographyOptions

wordpress2016' :: TypographyOptions
wordpress2016' = wordpress2016_

setOverrideThemeStyles :: forall a. TypographyOptions -> a -> TypographyOptions
setOverrideThemeStyles = setOverrideThemeStyles_

delete :: String -> TypographyOptions -> TypographyOptions
delete = delete_

wordpress2016 :: TypographyOptions
wordpress2016 = delete_ "googleFonts" (setOverrideThemeStyles wordpress2016' defaultOverrideThemeStyles)
