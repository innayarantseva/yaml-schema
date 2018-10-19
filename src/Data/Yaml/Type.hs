module Data.Yaml.Type where

import Data.Text

data Field = Field  { name  :: Text
                    , value :: Value
                    }
    deriving (Show, Eq)

data Value = Number Double
           | String Text
           | Bool Bool
           | Array [Value]
           | Object [Field]
    deriving (Show, Eq)