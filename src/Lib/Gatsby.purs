module Lib.Packages.Gatsby (graphql, useStaticQuery) where

import Prelude

foreign import graphql_ :: String -> Unit

foreign import useStaticQuery_ :: forall a. Unit -> a

graphql :: String -> Unit
graphql = graphql_

useStaticQuery :: forall a. Unit -> Unit -> a
useStaticQuery = useStaticQuery_
