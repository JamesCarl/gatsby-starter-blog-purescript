module Lib.Utils.Typography (typography, rhythm, scale) where

import Lib.Packages.Typography.BaseLine (BaseLine)
import Lib.Packages.Typography.Theme.Wordpress2016 (wordpress2016)
import Lib.Packages.Typography.Typography as T

typography :: T.Typography
typography = T.typography wordpress2016

rhythm :: Number -> String
rhythm = T.rhythm_ typography

scale :: Number -> BaseLine
scale = T.scale_ typography
