module Lib.Packages.Typography.Weight (Weight(..)) where

import Prelude
import Data.Maybe
import Data.Argonaut (encodeJson)
import Foreign.Object
import Effect
import Data.List
import Data.Argonaut.Decode
import Data.Argonaut.Decode.Generic.Rep
import Data.Argonaut.Encode
import Data.Argonaut.Encode.Generic.Rep
import Data.Array
import Data.Generic.Rep
import Data.Generic.Rep.Show
import Data.HashMap
import Data.Nullable
import Prelude
import Data.Maybe (Maybe)

data Weight
  = NumberInWeight Number
  | StringInWeight String

derive instance genericWeight :: Generic Weight _

instance encodeJsonWeight :: EncodeJson Weight where
  encodeJson = genericEncodeJson

instance decodeJsonWeight :: DecodeJson Weight where
  decodeJson = genericDecodeJson

instance showWeight :: Show Weight where
  show = genericShow
