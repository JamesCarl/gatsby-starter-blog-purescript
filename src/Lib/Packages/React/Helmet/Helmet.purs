module Lib.Packages.React.Helmet where

import Prelude (Unit)
import Prim.Row (class Union, Union)
import Data.Argonaut.Core
import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Effect (Effect)
import React.Basic
import React.Basic.DOM (CSS, Props_a)
import React.Basic.Events (EventFn, SyntheticEvent, EventHandler)
import Web.DOM.Internal.Types (Node)

foreign import helmet_ :: forall attrs. ReactComponent attrs

helmet = element helmet_

type Props
  = ( to :: String
    , style :: CSS
    , children :: Array JSX
    )
