module Data.Yaml.Parser
    ( fieldP, valueP, numberP, stringP
    , parseOnly, many1
    ) where

-- import Control.Arrow (first)
import Control.Applicative
import Data.Yaml.Type
import Data.Text
import Data.Attoparsec.Text

fieldP :: Parser Field
fieldP = do name <- nameP
            char ':'
            space
            value <- valueP
            pure $ Field name value
-- fieldP = Field <$> ( nameP *> (char ':' >> space)) <*> valueP
    where
        nameP :: Parser Text
        nameP = pack <$> many1 (notChar ':')
-- field = many1 (notChar ':')

valueP :: Parser Value
valueP = numberP <|> stringP

numberP :: Parser Value
numberP = Number <$> double

stringP :: Parser Value
stringP = String . pack <$> many1 (satisfy (not . isEndOfLine))


-- parseChar :: String -> Maybe (Char, String)
-- parseChar []     = Nothing
-- parseChar (x:xs) = Just (x, xs)

-- parseInt :: String -> Maybe (Int, String)
-- parseInt = undefined

-- -- newtype Parser a = Parser { parse :: String -> Maybe (a, String) }
-- newtype Parser s e a = Parser { parse :: s -> Either (a, s) }

-- -- instance Functor Parser where
-- -- --  fmap :: (a -> b) -> Parser a -> Parser b
-- --     -- fmap f (Parser p) = Parser $ \s -> (\(x, s') -> (f x, s')) <$> p s
-- --     fmap f (Parser p) = Parser $ \s -> first f <$> p s