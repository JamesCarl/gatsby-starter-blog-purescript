module Lib.Components.Image where

import Data.Maybe (Maybe)
import Lib.Packages.Gatsby.Img (img)
import React.Basic

type Props a b
  = { fluid ::
        { aspectRatio :: Number
        , src :: String
        , srcSet :: String
        , sizes :: String
        , base64 :: Maybe String
        , tracedSVG :: Maybe String
        , srcWebp :: Maybe String
        , srcSetWebp :: Maybe String
        , media :: Maybe String
        | b
        }
    | a
    }

initialState :: { defaultTitle :: String }
initialState = { defaultTitle: "Gatsby Default Starter" }

image :: forall a b. Props a b → JSX
image props = img props.fluid
