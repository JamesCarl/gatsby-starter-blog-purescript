module Lib.Components.Bio (bio) where

import Prelude
import Foreign (Foreign)
import Lib.Packages.Gatsby (graphql, useStaticQuery)
import Lib.Packages.Gatsby.Img (img)
import Lib.Utils.Typography (rhythm)
import React.Basic (JSX)
import React.Basic.DOM as R

bioQuery :: String
bioQuery = "query BioQuery { avatar: file(absolutePath: { regex: \"/profile-pic.jpg/\" }) { childImageSharp { fixed(width: 50, height: 50) { ...GatsbyImageSharpFixed }}} site { siteMetadata {author {name summary} social {twitter}}}}"

foreign import graphqlBioQuery_ :: Unit -> Unit -> BioQuery

graphqlBioQuery :: Unit -> Unit -> BioQuery
graphqlBioQuery prepare run = graphqlBioQuery_ prepare run

type BioQuery
  = { avatar :: Avatar
    , site :: Site
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
  = { author :: Author
    , social :: Social
    }

type Author
  = { name :: String
    , summary :: String
    }

type Social
  = { twitter :: String
    }

bio :: {} -> JSX
bio _ =
  let
    results = graphqlBioQuery unit unit
  in
    R.div
      { style:
          R.css
            { display: "flex"
            , marginBottom: rhythm 2.5
            }
      , children:
          [ img
              { fixed: results.avatar.childImageSharp.fixed
              , alt: results.site.siteMetadata.author.name
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
                  [ R.text results.site.siteMetadata.author.name
                  ]
              , R.text (" " <> results.site.siteMetadata.author.summary <> " ")
              , R.a
                  { href: ("https://twitter.com/" <> results.site.siteMetadata.social.twitter)
                  , children:
                      [ R.text "You should follow him on Twitter"
                      ]
                  }
              ]
          ]
      }
