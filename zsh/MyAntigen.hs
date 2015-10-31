{-# LANGUAGE OverloadedStrings #-}
module MyAntigen where

import Antigen (
                -- Rudimentary imports
                AntigenConfig (..)
              , defaultConfig
              , bundle
              , antigen
                -- If you want to source a bit trickier plugins
              , ZshPlugin (..)
              , antigenSourcingStrategy
              , filePathsSourcingStrategy
              )

bundles =
  [ bundle "Tarrasch/zsh-functional"
  , bundle "Tarrasch/zsh-bd"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "zsh-users/zsh-history-substring-search"
  , bundle "nojhan/liquidprompt"
  , (bundle "robbyrussell/oh-my-zsh")
    { sourcingLocations = [ "plugins/common-aliases"
                          , "plugins/git"
                          , "plugins/git-extras"
                          , "plugins/rsync" ] }
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config