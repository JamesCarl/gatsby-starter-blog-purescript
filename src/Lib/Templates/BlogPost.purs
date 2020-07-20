module Lib.Templates.BlogPost where

import Prelude
import Prim
import Data.Nullable as N
import Data.String (null)
import Lib.Components.Bio as B
import Lib.Components.Layout (layout)
import Lib.Components.Seo (seo)
import Lib.Packages.Gatsby.Link (link)
import Lib.Utils.Typography (rhythm, scale)
import React.Basic (JSX)
import React.Basic.DOM as R
import Foreign (isNull, unsafeToForeign)

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

type PageContext
  = { fields ::
        { slug :: String
        }
    , frontmatter ::
        { title :: String
        }
    }

type Context
  = { next :: PageContext
    , previous :: PageContext
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
    , avatar :: Avatar
    , allMarkdownRemark :: AllMarkdownRemark
    , markdownRemark :: MarkdownRemark
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

type MarkdownRemark
  = { html :: String
    , frontmatter :: Frontmatter
    , excerpt :: String
    }

type Frontmatter
  = { date :: String
    , description :: String
    , title :: String
    }

type AllMarkdownRemark
  = { edges :: Array Edge
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
  = { slugFields :: String
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

blogPost :: Props -> JSX
blogPost props =
  let
    bioComponent :: B.Avatar -> B.Site -> JSX
    bioComponent avatar site = B.bio { avatar: avatar, site: site }

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
              , R.footer_
                  [ bioComponent props.data.avatar props.data.site ]
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
  where
  site props =
    { siteMetaData:
        { author: props.data.site.siteMetaData.author
        , social: props.data.site.siteMetaData.social
        }
    }
