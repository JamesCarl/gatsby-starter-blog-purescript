module Lib.Components.Bio where

import Prelude
import Lib.Packages.Gatsby.Img (img)
import Lib.Utils.Typography (rhythm)
import React.Basic (JSX)
import React.Basic.DOM as R

type Props
  = { site :: Site
    , avatar :: Avatar
    }

type Avatar
  = { childImageSharp :: ChildImageSharp
    }

type ChildImageSharp
  = { fixed :: Fixed
    }

type Fixed
  = { base64 :: String
    , width :: Int
    , height :: Int
    , src :: String
    , srcSet :: String
    }

type Site
  = { siteMetadata :: SiteMetadata
    }

type SiteMetadata
  = { title :: String
    , author :: Author
    , social :: Social
    }

type Author
  = { name :: String
    , summary :: String
    }

type Social
  = { twitter :: String
    }

bio :: Props -> JSX
bio props =
  R.div
    { style:
        R.css
          { display: "flex"
          , marginBottom: rhythm 2.5
          }
    , children:
        [ img
            { fixed: props.avatar.childImageSharp.fixed
            , alt: props.site.siteMetadata.author.name
            , style:
                R.css
                  { marginRight: rhythm $ div 1.0 2.0
                  , marginBottom: 0
                  , minWidth: 50
                  , borderRadius: "100%"
                  }
            , imgStyle:
                { borderRadius: "50%"
                }
            }
        , R.p_
            [ R.text "Written by "
            , R.strong_
                [ R.text props.site.siteMetadata.author.name
                ]
            , R.text (" " <> props.site.siteMetadata.author.summary <> " ")
            , R.a
                { href: ("https://twitter.com/" <> props.site.siteMetadata.social.twitter)
                , children:
                    [ R.text "You should follow him on Twitter"
                    ]
                }
            ]
        ]
    }
