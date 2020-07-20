module Lib.Components.Seo where

import Prelude (($), (<>))
import Data.Array (concat)
import Data.Maybe (fromMaybe)
import Data.Nullable (Nullable, notNull, null, toMaybe)
import Lib.Packages.React.Helmet (helmet)
import React.Basic (JSX)

type Props a
  = { meta :: Nullable (Array { name :: Nullable String, property :: Nullable String, content :: Nullable String }), lang :: Nullable String, author :: Nullable String, title :: Nullable String, metaDescription :: Nullable String | a }

initialState :: { title ∷ String }
initialState = { title: "Gatsby Default Starter" }

seo :: forall a. Props a -> JSX
seo props =
  helmet
    { htmlAttributes:
        { lang: fromMaybe "" $ toMaybe props.lang
        }
    , title: fromMaybe "" $ toMaybe props.title
    , titleTemplate: "%s | " <> (fromMaybe "" $ toMaybe props.title)
    , meta: metaArray props.meta props.metaDescription props.title props.author
    }
  where
  metaArray :: Nullable (Array { name :: Nullable String, property :: Nullable String, content :: Nullable String }) -> Nullable String -> Nullable String -> Nullable String -> (Array { name :: Nullable String, property :: Nullable String, content :: Nullable String })
  metaArray meta metaDescription title author =
    concat
      [ ( fromMaybe
            [ { property: null
              , name: null
              , content: null
              }
            ]
            $ toMaybe meta
        )
      , [ { property: notNull ""
          , name: notNull "description"
          , content: metaDescription
          }
        , { property: notNull "og:title"
          , name: null
          , content: title
          }
        , { property: notNull "og:description"
          , name: null
          , content: metaDescription
          }
        , { property: notNull "og:type"
          , name: null
          , content: notNull "website"
          }
        , { property: null
          , name: notNull "twitter:card"
          , content: notNull "summary"
          }
        , { property: null
          , name: notNull "twitter:creator"
          , content: author
          }
        , { property: null
          , name: notNull "twitter:title"
          , content: title
          }
        , { property: null
          , name: notNull "twitter:description"
          , content: metaDescription
          }
        ]
      ]
