module Lib.Components.PostLink where

import Prelude (pure, ($), (<>))
import React.Basic (JSX)
import Effect (Effect)
import Lib.Packages.Gatsby.Link (link)
import React.Basic.DOM as R
import React.Basic.Hooks as React

type Props a
  = { key :: String, path :: String, date :: String, title :: String | a }

initialState ::
  { title :: String
  }
initialState = { title: "Gatsby Default Starter" }

postLink :: ∀ a b. Effect ({ date ∷ String, key ∷ a, path ∷ String, title ∷ String | b } → JSX)
postLink =
  React.component "SEO" \props -> React.do
    pure
      $ R.div_
          [ link
              { key: props.key
              , to: path props.path
              , children:
                  [ R.text (props.title <> "\t(" <> props.date <> ")")
                  ]
              }
          ]
  where
  path :: String -> String
  path p = p
