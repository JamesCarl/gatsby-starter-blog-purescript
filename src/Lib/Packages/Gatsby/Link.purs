module Lib.Packages.Gatsby.Link (link) where

import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (CSS)

foreign import link_ :: forall attrs. ReactComponent attrs

link :: ∀ props. Record props → JSX
link = element link_

type Props_GatsbyLink
  = ( to :: String
    , style :: CSS
    , children :: Array JSX
    )
