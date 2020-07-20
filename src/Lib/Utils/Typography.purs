module Lib.Utils.Typography (rhythm, scale) where

import Lib.Packages.Typography.BaseLine (BaseLine)
import Lib.Packages.Typography.Theme.Wordpress2016 (wordpress2016)
import Lib.Packages.Typography.Typography (Typography, typography, rhythm_, scale_)

typography' :: Typography
typography' = typography wordpress2016

rhythm :: Number -> String
rhythm = rhythm_ typography'

scale :: Number -> BaseLine
scale = scale_ typography'
