module Lib.Components.Layout where

import Prelude (div, (<>), (==))
import Effect (Effect)
import Lib.Utils.Typography (rhythm)
import Prim
import Data.JSDate (JSDate, now)
import Lib.Packages.Gatsby.Link (link)
import React.Basic.DOM as R
import React.Basic.Hooks (JSX)

type Props a b
  = { children :: Array JSX, location :: { pathname :: String | a }, title :: String, year :: String | b }

layout :: forall a b. Props a b -> JSX
layout props =
  R.div
    { style:
        R.css
          { marginLeft: "auto"
          , marginRight: "auto"
          , maxWidth: rhythm 24.0
          , padding: rhythm 1.5 <> " " <> rhythm (div 3.0 4.0)
          }
    , children:
        [ R.header_ [ header props ]
        , R.main_ props.children
        , R.footer_
            [ R.text (("© " <> (currentYear props.year) <> ", Built with "))
            , R.a
                { href: "https://www.gatsbyjs.org"
                , children: [ R.text ("Gatsby") ]
                }
            ]
        ]
    }
  where
  currentYear :: String -> String
  currentYear year = year

  rootPath :: String
  rootPath = "/"

  header hprops =
    if hprops.location.pathname == rootPath then
      R.h1
        { children:
            [ link
                { style:
                    { boxShadow: "none"
                    , color: "inherit"
                    }
                , to: "/"
                , children:
                    [ R.text hprops.title
                    ]
                }
            ]
        }
    else
      R.h1
        { children:
            [ link
                { style:
                    { boxShadow: "none"
                    , color: "inherit"
                    }
                , to: "/"
                , children:
                    [ R.text hprops.title
                    ]
                }
            ]
        }
