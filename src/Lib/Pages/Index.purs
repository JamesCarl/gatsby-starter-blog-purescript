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

type Props a
  = { path :: String
    , location :: Location a
    , pageResources :: PageResources a
    , uri :: String
    , data :: Data a
    , pageContext :: Context a
    , pathContext :: Context a
    | a
    }

type Location a
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
    | a
    }

type Context a
  = {
    | a
    }

type PageResources a
  = { json :: JSON a
    , page :: Page a
    | a
    }

type JSON a
  = { data :: Data a
    , pageContext :: Context a
    | a
    }

type Data a
  = { site :: Site a
    , allMarkdownRemark :: AllMarkdownRemark a
    | a
    }

type AllMarkdownRemark a
  = { edges :: Array (Edge a)
    | a
    }

type Edge a
  = { node :: Node a
    | a
    }

type Node a
  = { excerpt :: String
    , fields :: Fields a
    , frontmatter :: Frontmatter a
    | a
    }

type Fields a
  = { slugFields :: String
    | a
    }

type Frontmatter a
  = { date :: String
    , title :: String
    , description :: String
    | a
    }

type Site a
  = { siteMetadata :: SiteMetadata a
    | a
    }

type SiteMetadata a
  = { title :: String
    | a
    }

type Page a
  = { componentChunkName :: String
    , path :: String
    , webpackCompilationHash :: String
    | a
    }

index :: forall a. Props a -> JSX
index props =
  let
    posts :: forall a. Array (Edge a)
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
                , bio {}
                ]
                  <> postsComponents
              )
          , year: "2020"
          , location: props.location
          , title: props.data.site.siteMetadata.title
          }
      ]
