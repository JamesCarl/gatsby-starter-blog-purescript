module Lib.Pages.FourZeroFour where

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

page :: forall a. Props a -> JSX
page props =
  layout
    { children:
        [ seo
            { title: N.notNull "404: Not Found"
            , meta: N.null
            , lang: N.null
            , author: N.null
            , metaDescription: N.null
            }
        , R.h1_ [ R.text "Not Found" ]
        , R.p_ [ R.text "You just hit a route that doesn't exist... the sadness." ]
        ]
    , year: "2020"
    , location: props.location
    , title: props.data.site.siteMetadata.title
    }
