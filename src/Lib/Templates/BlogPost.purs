module Lib.Templates.BlogPost where

import Prelude
import Prim
import Data.Nullable as N
import Data.String (null)
import Lib.Components.Bio (bio)
import Lib.Components.Layout (layout)
import Lib.Components.Seo (seo)
import Lib.Packages.Gatsby.Link (link)
import Lib.Utils.Typography (rhythm, scale)
import React.Basic (JSX)
import React.Basic.DOM as R
import Foreign (F, Foreign, readNumber, isNull, unsafeToForeign)

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

type PageContext a
  = { fields ::
        { slug :: String
        | a
        }
    , frontmatter ::
        { title :: String
        | a
        }
    | a
    }

type Context a
  = { next :: PageContext a
    , previous :: PageContext a
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
    , markdownRemark :: MarkdownRemark a
    | a
    }

type MarkdownRemark a
  = { html :: String
    , frontmatter :: Frontmatter a
    , excerpt :: String
    | a
    }

type Frontmatter a
  = { date :: String
    , description :: String
    , title :: String
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

blogPost :: forall a. Props a -> JSX
blogPost props =
  let
    post = props.data.markdownRemark

    siteTitle = props.data.site.siteMetadata.title

    next = props.pageContext.next

    previous = props.pageContext.previous
  in
    layout
      { year: "2020"
      , location: props.location
      , title: siteTitle
      , children:
          [ seo
              { title: N.notNull post.frontmatter.title
              , metaDescription: if null post.frontmatter.description then N.notNull post.frontmatter.description else N.notNull post.excerpt
              , meta: N.null
              , lang: N.null
              , author: N.null
              }
          , R.article_
              [ R.header_
                  [ R.h1
                      { style:
                          R.css
                            { marginTop: rhythm 1.0
                            , marginBottom: 0.0
                            }
                      , children:
                          [ R.text post.frontmatter.title
                          ]
                      }
                  ]
              , R.p
                  { style:
                      R.css
                        { fontSize: (scale (div (-1.0) 5.0)).fontSize
                        , lineHeight: (scale (div (-1.0) 5.0)).lineHeight
                        , display: "block"
                        , marginBottom: rhythm 1.0
                        }
                  , children:
                      [ R.text post.frontmatter.date
                      ]
                  }
              , R.section
                  { dangerouslySetInnerHTML:
                      { __html: post.html
                      }
                  }
              , R.hr
                  { style:
                      R.css
                        { marginBottom: rhythm 1.0
                        }
                  }
              , R.footer_ [ bio {} ]
              ]
          , R.nav_
              [ R.ul
                  { style:
                      R.css
                        { display: "flex"
                        , flexWrap: "wrap"
                        , justifyContent: "space-between"
                        , listStyle: "none"
                        , padding: 0
                        }
                  , children:
                      if (not $ isNull $ unsafeToForeign previous) && (not $ isNull $ unsafeToForeign next) then
                        [ R.li_
                            [ link
                                { to: previous.fields.slug
                                , rel: "prev"
                                , children:
                                    [ R.text ("← " <> previous.frontmatter.title)
                                    ]
                                }
                            ]
                        , R.li_
                            [ link
                                { to: next.fields.slug
                                , rel: "next"
                                , children:
                                    [ R.text (next.frontmatter.title <> " →")
                                    ]
                                }
                            ]
                        ]
                      else
                        if (not $ isNull $ unsafeToForeign previous) then
                          [ R.li_
                              [ link
                                  { to: previous.fields.slug
                                  , rel: "prev"
                                  , children:
                                      [ R.text ("← " <> previous.frontmatter.title)
                                      ]
                                  }
                              ]
                          ]
                        else
                          if (not $ isNull $ unsafeToForeign next) then
                            [ R.li_
                                [ link
                                    { to: next.fields.slug
                                    , rel: "next"
                                    , children:
                                        [ R.text (next.frontmatter.title <> " →")
                                        ]
                                    }
                                ]
                            ]
                          else
                            []
                  }
              ]
          ]
      }
