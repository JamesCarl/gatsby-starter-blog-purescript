module Lib.Pages.Index where

import Prim
import Data.Nullable as N
import Data.String (null)
import Lib.Components.Bio (bio)
import Lib.Components.Layout (layout)
import Lib.Components.Seo (seo)
import Lib.Packages.Gatsby.Link (link)
import Lib.Utils.Typography (rhythm)
import Prelude (div, map, ($), (<>))
import React.Basic (JSX)
import React.Basic.DOM as R

type Props
  = { path :: String
    , location :: Location
    , pageResources :: PageResources
    , uri :: String
    , data :: Data
    , pageContext :: Context
    , pathContext :: Context
    }

type Location
  = { pathname :: String
    , search :: String
    , hash :: String
    , href :: String
    , origin :: String
    , protocol :: String
    , host :: String
    , hostname :: String
    , port :: String
    , state :: String
    , key :: String
    }

type Context
  = {
    }

type PageResources
  = { json :: JSON
    , page :: Page
    }

type JSON
  = { data :: Data
    , pageContext :: Context
    }

type Data
  = { site :: Site
    , allMarkdownRemark :: AllMarkdownRemark
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

type AllMarkdownRemark
  = { edges :: Array (Edge)
    }

type Edge
  = { node :: Node
    }

type Node
  = { excerpt :: String
    , fields :: Fields
    , frontmatter :: Frontmatter
    }

type Fields
  = { slug :: String
    }

type Frontmatter
  = { date :: String
    , title :: String
    , description :: String
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

type Page
  = { componentChunkName :: String
    , path :: String
    , webpackCompilationHash :: String
    }

index :: Props -> JSX
index props =
  let
    posts :: Array Edge
    posts = props.data.allMarkdownRemark.edges

    postsComponents :: Array JSX
    postsComponents = map post posts

    siteTitle :: String
    siteTitle = props.data.site.siteMetadata.title

    post edge =
      let
        title :: String
        title = edge.node.frontmatter.title
      in
        R.article
          { key: edge.node.fields.slug
          , children:
              [ R.header_
                  [ R.h3
                      { style:
                          R.css
                            { marginBottom: rhythm $ div 1.0 4.0
                            }
                      , children:
                          [ link
                              { style:
                                  R.css
                                    { boxShadow: "none"
                                    }
                              , to: edge.node.fields.slug
                              , children:
                                  [ R.text title
                                  ]
                              }
                          ]
                      }
                  , R.small_
                      [ R.text edge.node.frontmatter.date
                      ]
                  ]
              , R.section_
                  [ R.p
                      { dangerouslySetInnerHTML:
                          { __html: if null edge.node.frontmatter.description then edge.node.frontmatter.description else edge.node.excerpt
                          }
                      }
                  ]
              ]
          }
  in
    R.div_
      [ layout
          { children:
              ( [ seo { title: N.notNull "All Posts", meta: N.null, lang: N.null, author: N.null, metaDescription: N.null }
                , bio
                    { avatar: props.data.avatar
                    , site: props.data.site
                    }
                ]
                  <> postsComponents
              )
          , year: "2020"
          , location: props.location
          , title: props.data.site.siteMetadata.title
          }
      ]
