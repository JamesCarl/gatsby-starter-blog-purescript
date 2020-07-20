module Lib.Packages.Gatsby.Img (img) where

import React.Basic (JSX, ReactComponent, element)

foreign import img_ :: forall attrs. ReactComponent attrs

img :: ∀ props. Record props → JSX
img = element img_
