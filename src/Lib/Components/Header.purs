module Lib.Components.Header (header) where

import Prelude
import Data.Maybe (fromMaybe)
import Data.Nullable (Nullable, toMaybe)
import Lib.Packages.Gatsby.Link (link)
import Prelude
import React.Basic
import Data.Maybe (fromMaybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import React.Basic.DOM as R
import React.Basic.Hooks as React

type Props a
  = { siteTitle :: String | a }

header :: forall a. Props a -> JSX
header props =
  R.header
    { style: R.css { background: "#1d222d", marginBottom: "1.45rem" }
    , children:
        [ R.div
            { style: R.css { margin: "0 auto", maxWidth: "960px", padding: "1.45rem 1.0875rem" }
            , children:
                [ R.h1
                    { style: R.css { margin: "0" }
                    , children:
                        [ link
                            { to: "/"
                            , style: R.css { color: "#f0f0f0", textDecoration: "none" }
                            , children: [ R.em_ [ R.text (props.siteTitle) ] ]
                            }
                        ]
                    }
                ]
            }
        ]
    }
