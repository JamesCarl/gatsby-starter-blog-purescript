{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "gatsby-starter-blog-purescript"
, dependencies =
  [ "argonaut"
  , "argonaut-generic"
  , "console"
  , "effect"
  , "foreign"
  , "generics-rep"
  , "psci-support"
  , "react-basic"
  , "react-basic-dom"
  , "react-basic-hooks"
  , "record"
  , "unordered-collections"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
